import Foundation

@objc public protocol SuperSDKModule {
    func execute()
}

@objcMembers
public final class ModuleRegistry: NSObject {
    public static let shared = ModuleRegistry()
    private override init() {}

    private var modules: [SuperSDKModule] = []

    @objc public func register(_ module: SuperSDKModule) {
        modules.append(module)
    }

    public func executeAll() {
        modules.forEach { $0.execute() }
    }

    public func registeredModuleNames() -> [String] {
        modules.map { String(describing: type(of: $0)) }
    }
}
