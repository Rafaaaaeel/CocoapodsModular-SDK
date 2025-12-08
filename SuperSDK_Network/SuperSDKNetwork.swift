import Foundation

@objcMembers
public final class SuperSDKNetwork: NSObject, SuperSDKModule {
    public override init() { super.init() }

    public func execute() {
        print("🟢 SuperSDKNetwork.execute() — Network module executed!")
    }
}

@objc public final class SuperSDKNetworkLoader: NSObject {
    @objc public override class func load() {
        ModuleRegistry.shared.register(SuperSDKNetwork())
        print("🟡 SuperSDKNetworkLoader.load() — Network module registered.")
    }
}
