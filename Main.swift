import Foundation
import AppKit


// <Zosia Voice> Fun Fact! Discord's charlimit for a status is 128, while Github and Instagram's are both 80 characters! </Zosia Voice>
// Method to pick the next status and emoji
func getRandomStatus() -> Status {
    let statuses: Array<Status> = [
        Status(status: "Refuse to be stored in black plastic sacks and placed in the containers provided"), // https://x.com/atlanticesque/status/1989310584844677591?s=46
        Status(status: "Did that work? No, but it was a brilliant idea."),
        Status(status: "That's numberwang!"), // NumberWang
        Status(status: "I don't want to comment on it. The answer is yes."), // Trump
        Status(status: "You ask me, I ask who?"), // Singaporean saying
        Status(status: "Six of one, half a dozen of the other"),
        Status(status: "We're born dying, but we're compelled to fancy our chances"), // https://www.youtube.com/watch?v=CmZriB9AFHM
        Status(status: "Hard boiling an egg is a known anti pattern"), // Stack Overflow meme
        Status(status: "Hello Carol, we are John Cena"), // Plur1bus
        Status(status: "Double majored in Firm Handshakes and Eye Contact"), // That one better work talk
        Status(status: "No interests outside of generating cash flows"), // That one better work talk (I think I need to workshop this)
        Status(status: "Coming up with new statuses"),
        Status(status: "You could name your AI company after Pokémon and noone would know"), // Also the better work talk
        Status(status: "Ask me about paragraph 4 of the Danish state budget"),
        Status(status: "I think I'm much more humble than you would expect"),
        Status(status: "I cant carry it for you, but I can carry you!"), // LOTR
        Status(status: "I miss my wife tails, I miss her a lot"), // One of the snapcube sonic dubs
        Status(status: "*Someone* has to charge the eletric eels"),
        Status(status: "I don't chuckle. I have respect for the dollar."), // Nicholas Cage
        Status(status: "There's no more ni hao, only ni howdy"), // Twitter post I think?
        Status(status: "Never underestimate the bandwidth of a shipping container full of hard drives"), // Can't remember where I got this
        Status(status: "It is generally a good idea to write comprehensible programs"), // https://wiki.haskell.org/Commenting
        Status(status: "It makes no damn sense. Compels me, Though."), // Knives Out
        Status(status: "I anticipate the terminus of Gravity's Rainbow"), // Knives Out
        Status(status: "A doughnut hole in a doughnut's hole"), // Knives Out
        Status(status: "This is stoopid with two O's"), // Knives Out
        Status(status: "I don't like normal people, they're weird"),
        Status(status: "Gin is the spirit of their patriotism!"), // https://letterboxd.com/film/waterloo/
        Status(status: "A retreating army is never in love with their commander"), // https://letterboxd.com/film/waterloo/
        Status(status: "Obviously he's no student of Caesar"), // https://letterboxd.com/film/waterloo/
        Status(status: "This fellow knows how to defend a hopeless position. Raise him to corporal!"), // https://letterboxd.com/film/waterloo/
        Status(status: "I'm the romantic ideal of an aircraft carrier"),
        Status(status: "Violating the laws of physics isn't explicitly illegal in the state of Illinois"),
        Status(status: "Today's not going to be a lesson in hubris, it's going to be a lesson in winning"), // Make Some Noise? I think?
        Status(status: "I know a lesson in hubris hates to see me coming"),
        Status(status: "What if you need a favour from Ferris Bueller one day?"), // https://letterboxd.com/film/ferris-buellers-day-off/
        Status(status: "A sorrow shared is a sorrow halved; a joy shared is a joy doubled."),
        Status(status: "It was horrible. It worked flawlessly."), // https://youtu.be/uMoql_RYVBQ?si=oZ50NLYcpsaDHxpc 
        Status(status: "Integrate, Culminate, Fruitionize"), // https://youtu.be/wakBARkxqls
        Status(status: "@everyone have we tried making more money"), // https://x.com/james406/status/2005368178776346664?s=20
        Status(status: "All slopes are slippery when you are the soap man"), // https://x.com/epicmasterchief/status/2006202494314025040?s=46
        Status(status: "Let's kick the stick from the blind man of ignorance."), // https://www.youtube.com/watch?v=b8m3dFcNuAQ
        Status(status: "We need to create a discourse of silence"), // https://www.youtube.com/watch?v=b8m3dFcNuAQ
        Status(status: "It's cringe or be cringe"), // https://www.youtube.com/watch?v=41v3L0zCkNY or https://youtu.be/TgmTsa3rFU0
        Status(status: "Perhaps I am cringe. But that makes me free."), // https://www.youtube.com/watch?v=41v3L0zCkNY or https://youtu.be/TgmTsa3rFU0
        Status(status: "Memes, Jack. The DNA of the soul."), // MGR:R
        Status(status: "The only thing worse than all the idiots is yourself"), // https://letterboxd.com/film/the-worst-person-in-the-world/
        Status(status: "I eat a delicious tube of \"Day 4-Meal 2\"."), // https://en.wikipedia.org/wiki/Project_Hail_Mary
        Status(status: "Turn your haters into waiters at the table of success"), // Mayor Eric Adams
        Status(status: "Nothing bad can happen. It can only good happen"), // Trump
        Status(status: "You have meddled with the primal forces of nature, mr beale, and I won't have it!"), // https://letterboxd.com/film/network
        Status(status: "As the great warrior-poet Ice Cube once said;"), // https://letterboxd.com/film/generation-kill/ 
        Status(status: "That's how history arrives; on the coattails of unintended consequences"), // TechnoFeudalism by Yanis Varoufakis
        Status(status: "The dose makes the poison"), // https://youtu.be/1lY7Y6iJ1jk
        Status(status: "68±1"), // "Wow, Are you gonna credit me for that one?" -- Olivia
        Status(status: "Mother says I meddle."), // Witcher 1
        Status(status: "Witchmolol bool"), // Witcher 1
        Status(status: "Opening terminals and typing 'exit' just to feel something"),
        Status(status: "Average Amy message is edited and still has a typo"),
        Status(status: "My body is not a temple, it is merely a dive bar"),
        Status(status: "I'm da king of da highway"), // https://x.com/senn_spud/status/1598398098933702656?s=46
        Status(status: "How do you teach data visualization to a blind student?"), // find the source of this
        Status(status: "I have too many things to do and too much time to do them"),
        Status(status: "They call me ranch cause I be dressing"),
        Status(status: "You mess with Michael Bay, you mess with America"), // That one meme
        Status(status: "I was born in 1601. I'm a vampire. I've been around forever."), // Marty Supreme Christmas Day
        Status(status: "Random Status!")

        /* Statuses that are too long
        Status(status: "I DID NOT USURP THE CROWN, I FOUND IT IN THE GUTTER AND I PICKED IT UP WITH MY SWORD"), // https://letterboxd.com/film/waterloo/
        Status(status: "How many times have I told you, never think ahead, kiddo. No good is ever gonna come of that. The here and now is all that counts"), // Hades 2
        Status(status: "If you're always doing good right now, you're always doing good later, that's all there is to it."), // Hades 2
        Status(status: "It is not a doughnut hole, but a smaller doughnut with its own hole and our doughnut is not whole at all!"), // Knives Out
        Status(status: "Where should i go? The left where nothing is right or the right where nothing is left?"), // https://www.youtube.com/watch?v=zWH_9VRWn8Y
        Status(status: "Monkeys are such silly little guys that what they consider to be business, the horses consider play")
        */

        // Add random picking for this one: "In my <Zosia/Jinx/Arcane/Severance/Pluribus> era"

        /* Time/date calculating statuses:
        "[num] days till Christmas!"
        "[num] days till I turn [next age]"
        "[num] days till I turn [random age between now and 100 years old]"
        */
    ]

    /* Specific date statuses:
    28 April 2011 -- Ed Balls Day
    04 July 1776 -- America
    03 November 2000 -- Amy Birthday
    24 December XXXX -- Jesus
    */
    return statuses.randomElement() ?? Status(status: "Random Status!")
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

    // <Zosia Voice> Fun fact: If you're listening to podcasts on spotify, the artist isn't propagated, instead if labels the "album" with the name of the podcast </Zosia Voice>
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