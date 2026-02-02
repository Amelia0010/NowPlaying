import Foundation
import AppKit

// Load framework
let bundle = CFBundleCreate(kCFAllocatorDefault, NSURL(fileURLWithPath: "/System/Library/PrivateFrameworks/MediaRemote.framework"))
print(bundle!)

//NSNotificationCenter.defaultCenter.addObserver(
//    forName: kMRMediaRemoteNowPlayingInfoDidChangeNotification,
//    object: nil,
//    queue: NSOperationQueue.mainQueue) {(notif) in print(notif)}

// Get a Swift function for MRMediaRemoteGetNowPlayingInfo
let MRMediaRemoteGetNowPlayingInfoPointer = CFBundleGetFunctionPointerForName(bundle, "MRMediaRemoteGetNowPlayingInfo" as CFString)
typealias MRMediaRemoteGetNowPlayingInfoFunction = @convention(c) (DispatchQueue, @escaping ([String: Any]) -> Void) -> Void
let MRMediaRemoteGetNowPlayingInfo = unsafeBitCast(MRMediaRemoteGetNowPlayingInfoPointer, to: MRMediaRemoteGetNowPlayingInfoFunction.self)

// Get a Swift function for MRNowPlayingClientGetBundleIdentifier
let MRNowPlayingClientGetBundleIdentifierPointer = CFBundleGetFunctionPointerForName(bundle, "MRNowPlayingClientGetBundleIdentifier" as CFString)
typealias MRNowPlayingClientGetBundleIdentifierFunction = @convention(c) (AnyObject?) -> String
let MRNowPlayingClientGetBundleIdentifier = unsafeBitCast(MRNowPlayingClientGetBundleIdentifierPointer, to: MRNowPlayingClientGetBundleIdentifierFunction.self)

MRMediaRemoteGetNowPlayingInfo(DispatchQueue.global(qos: DispatchQoS.QoSClass.utility), { (information) in
    for (key, value) in information {
        if key != "kMRMediaRemoteNowPlayingInfoArtworkData" {
            print(key)
            print(value)
        }
    }
})

sleep(300)

