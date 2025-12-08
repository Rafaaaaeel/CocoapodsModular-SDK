import Foundation

@objcMembers
public final class SuperSDKChat: NSObject /* <- NOTE: subclass NSObject */ , SuperSDKModule {
    public override init() { super.init() }

    public func execute() {
        print("🟣 SuperSDKChat.execute() — Chat module executed via CocoaPods!")
    }
}

/// Loader Objective-C visible — será buscado pelo Core via NSClassFromString
@objc public final class SuperSDKChatLoader: NSObject {
    @objc public static func registerModule() {
        ModuleRegistry.shared.register(SuperSDKChat())
    }
}
