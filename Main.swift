import Foundation
import AppKit


// <Zosia Voice> Fun Fact! Discord's charlimit for a status is 128, so if we want this to work for discord, probably want to stay below that! </Zosia Voice>
// Method to pick the next status and emoji
func getRandomStatus() -> Status {
    return Status(status: "Random Status!")
}

// What to update our status to, based on what we're listening to.
func getStatusWhenListening(title: String?, artist: String?, album: String?) -> Status {
    return Status(status: artist! + " - " + title!)
}


// --- Everything below here is internal stuff to make the script actually work. Shouldn't need to be changed unless you want to extend it to more platforms ---


// Load the private media framework
let bundle = CFBundleCreate(kCFAllocatorDefault, NSURL(fileURLWithPath: "/System/Library/PrivateFrameworks/MediaRemote.framework"))

// Set up methods we need from the private media frameworks 
let MRMediaRemoteGetIsPlaying = getPrivateMethod(name: "MRMediaRemoteGetNowPlayingApplicationIsPlaying", to: (@convention(c) (DispatchQueue, @escaping (Bool) -> Void) -> Void).self)
let MRMediaRemoteGetNowPlaying = getPrivateMethod(name: "MRMediaRemoteGetNowPlayingInfo", to: (@convention(c) (DispatchQueue, @escaping ([String: Any]) -> Void) -> Void).self)

// Whether or not we're currently playing music
var isPlaying: Bool = false
var currentStatus: Status?

// The Queue we use for updates to the status and whether we're listening
// This is an awful lot easier than locking and whatnot, and for a script
// of this size, bothering with locking is a bit much
let updateQueue: OperationQueue = OperationQueue()
updateQueue.maxConcurrentOperationCount = 1

// The dispatch queue that we use for all our private methods that require one
let dispatchQueue: DispatchQueue = DispatchQueue(label: "test")

// TypeAlias for nowPlaying observer
typealias Observer = NSObjectProtocol
// Optional which may contain our nowPlaying notification, if it has been set
var playingObserver: Observer? = nil

// Figure out whether we're currently playing, and if we are, what we're playing
func initialise() {
    // Add the event handler for whether or not we're playing music
    NotificationCenter.default.addObserver(
        forName: NSNotification.Name("_MRMediaRemotePlayerNowPlayingInfoDidChangeNotification"),
        object: nil,
        queue: updateQueue
    ) {
        (notif) in isPlayingHasChanged()
    }

    // Then run it once, to initialise
    isPlayingHasChanged()
}

// Reroll our status to a new randomly chosen one, and update accordingly
func rerollStatus() {
    // Unless we're currently listening to music
    if (isPlaying) {
        return
    }
    
    // Pick a new status
    updateStatus(status: getRandomStatus())
}



// Update our status to the given new one
func updateStatus(status: Status) {
    // Early return so we don't inadvertently spam
    if status == currentStatus {
        return
    }
    currentStatus = status

    // Until I've decided upon (a) platform(s), this will just print
    print(status)
}

// Whether we're even playing anything has changed
func isPlayingHasChanged() {
    var isPlayingOptional: Bool?

    // Find out whether our Mac thinks we're playing
    MRMediaRemoteGetIsPlaying(dispatchQueue, { (isMacPlaying) in
        isPlayingOptional = isMacPlaying
    })

    // Wait for the framework to return
    while (isPlayingOptional == nil) {
        Thread.sleep(forTimeInterval: 1)
    }

    let newIsPlaying = isPlayingOptional ?? false

    // Early return just in case
    if (newIsPlaying == isPlaying) {
        return
    }

    isPlaying = newIsPlaying

    if (isPlaying) {
        // Add an observer to changes in *what* we're playing
        playingObserver = NotificationCenter.default.addObserver(
            forName: NSNotification.Name("_MRMediaRemotePlayerNowPlayingInfoDidChangeNotification"),
            object: nil,
            queue: updateQueue
        ) { (notif) in 
            nowPlayingHasChanged()
        }

        // And invoke it once to find out what just started playing
        nowPlayingHasChanged()
    } else {
        // Remove our observer (assuming we have one)
        if let myObserver = playingObserver {
            NotificationCenter.default.removeObserver(myObserver)
        }

        // Reroll our status, since we've just stopped listening to music
        updateQueue.addOperation(BlockOperation(block: rerollStatus))
    }
}

// What we're playing has changed
func nowPlayingHasChanged() {
    // Invoke our private method to find out what
    MRMediaRemoteGetNowPlaying(dispatchQueue, {(notif) in 
        // Then stick it on the queue
        updateQueue.addOperation(BlockOperation(block: {nowPlayingHasChanged(notification: notif)}))
    })
}

// What we're playing has changed, and we now know what it is
func nowPlayingHasChanged(notification: [String: Any]) {
    // Just in case, let's add an early return if we aren't playing but somehow ended up here
    if !isPlaying {
        return
    }

    // Fun fact: If you're listening to podcasts on spotify, the artist isn't propagated, instead if labels the "album" with the name of the podcast
    let album: String? = notification["kMRMediaRemoteNowPlayingInfoAlbum"] as? String
    let title: String? = notification["kMRMediaRemoteNowPlayingInfoTitle"] as? String
    let artist: String? = notification["kMRMediaRemoteNowPlayingInfoArtist"] as? String
    
    // Update our status
    updateStatus(status: getStatusWhenListening(title: title, artist: artist, album: album))
}

func getPrivateMethod<U>(name: String, to: U.Type) -> U {
    let functionPointer = CFBundleGetFunctionPointerForName(bundle, name as CFString)
    return unsafeBitCast(functionPointer, to: to)
} 

// Initialise everything
updateQueue.addOperation(initialise)

// Loop to both keep the process running and update to a new status every 5 mins
while true {
    updateQueue.addOperation(rerollStatus)
    Thread.sleep(forTimeInterval: 300)
}

struct Status: Equatable {
    var status: String
    var emoji: Array<String>?
}