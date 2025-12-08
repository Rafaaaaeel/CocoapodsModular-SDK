import Foundation

public protocol SuperSDKModule {
    func execute()
}

public final class ModuleRegistry {
    public static let shared = ModuleRegistry()
    private init() {}

    private var modules: [SuperSDKModule] = []

    public func register(_ module: SuperSDKModule) {
        modules.append(module)
    }

    public func executeAll() {
        modules.forEach { $0.execute() }
    }

    public func registeredModuleNames() -> [String] {
        modules.map { String(describing: type(of: $0)) }
    }
}
