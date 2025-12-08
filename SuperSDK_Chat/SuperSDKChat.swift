import Foundation

@objcMembers
public final class SuperSDKChat: NSObject, SuperSDKModule {
    public override init() { super.init() }

    public func execute() {
        print("🟣 SuperSDKChat.execute() — Chat module executed!")
    }
}

@objc public final class SuperSDKChatLoader: NSObject {
    @objc public override class func load() {
        ModuleRegistry.shared.register(SuperSDKChat())
        print("🔵 SuperSDKChatLoader.load() — Chat module registered.")
    }
}
