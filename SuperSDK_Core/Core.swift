
import Foundation

public protocol SuperSDKModule {
    func execute()
}

public final class ModuleRegistry {
    public static let shared = ModuleRegistry()
    private init() {}

    private var modules: [SuperSDKModule] = []

    /// Register a module. Called by modules during static initialization.
    public func register(_ module: SuperSDKModule) {
        modules.append(module)
    }

    /// Execute all registered modules in registration order.
    public func executeAll() {
        modules.forEach { $0.execute() }
    }

    /// Returns list of registered module type names (for debugging)
    public func registeredModuleNames() -> [String] {
        return modules.map { String(describing: type(of: $0)) }
    }
}

/// Helper used by modules to auto-register on load.
public struct ModuleAutoRegister {
    public init(_ module: SuperSDKModule) {
        ModuleRegistry.shared.register(module)
    }
}
