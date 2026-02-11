
// Load framework
let bundle = CFBundleCreate(kCFAllocatorDefault, NSURL(fileURLWithPath: "/System/Library/PrivateFrameworks/MediaRemote.framework"))

// // Called when what's playing changes, including when it starts or stops
// NotificationCenter.default.addObserver(
//    forName: NSNotification.Name("_MRMediaRemotePlayerNowPlayingInfoDidChangeNotification"),
//    object: nil,
//    queue: OperationQueue()) {(notif) in print(notif);print("lol")}


// Called when we either start or stop playing, not when what we're playing changes.
NotificationCenter.default.addObserver(
   forName: NSNotification.Name("_MRMediaRemotePlayerIsPlayingDidChangeNotification"),
   object: nil,
   queue: OperationQueue()) {(notif) in print(notif);print("lmao")}

// Get a Swift function for MRMediaRemoteGetNowPlayingInfo
let MRMediaRemoteGetNowPlayingInfoPointer = CFBundleGetFunctionPointerForName(bundle, "MRMediaRemoteGetNowPlayingInfo" as CFString)
typealias MRMediaRemoteGetNowPlayingInfoFunction = @convention(c) (DispatchQueue, @escaping ([String: Any]) -> Void) -> Void
let MRMediaRemoteGetNowPlayingInfo = unsafeBitCast(MRMediaRemoteGetNowPlayingInfoPointer, to: MRMediaRemoteGetNowPlayingInfoFunction.self)

// Get a Swift function for MRNowPlayingClientGetBundleIdentifier
// let MRNowPlayingClientGetBundleIdentifierPointer = CFBundleGetFunctionPointerForName(bundle, "MRNowPlayingClientGetBundleIdentifier" as CFString)
// typealias MRNowPlayingClientGetBundleIdentifierFunction = @convention(c) (AnyObject?) -> String
// let MRNowPlayingClientGetBundleIdentifier = unsafeBitCast(MRNowPlayingClientGetBundleIdentifierPointer, to: MRNowPlayingClientGetBundleIdentifierFunction.self)

// MRMediaRemoteGetNowPlayingInfo(DispatchQueue.global(qos: DispatchQoS.QoSClass.utility), { (information) in
//     for (key, value) in information {
//         if key != "kMRMediaRemoteNowPlayingInfoArtworkData" {
//             print(key)
//             print(value)
//         }
//     }
// })