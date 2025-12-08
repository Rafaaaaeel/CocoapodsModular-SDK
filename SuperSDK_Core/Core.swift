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

/// ------------------------------------------------------------
/// 🎯 Força o linker a incluir módulos Swift (evita dead-strip)
/// ------------------------------------------------------------
internal enum SuperSDKForceLoader {
    static func loadAllModules() {
        _ = _ForceLoadChatModuleImpl.self   // força carregar o Chat
        // Se tiver outros módulos:
        // _ = _ForceLoadNetworkModuleImpl.self
    }
}

public final class SuperSDKMain {
    public static func start() {
        // MUITO IMPORTANTE → força execução dos auto-registradores
        SuperSDKForceLoader.loadAllModules()

        print("🚀 SuperSDKMain.start() called — executing registered modules...")

        let names = ModuleRegistry.shared.registeredModuleNames()
        if names.isEmpty {
            print("⚠️ No SuperSDK modules registered. Did you install subspecs?")
        } else {
            print("Registered modules: \(names)")
        }

        ModuleRegistry.shared.executeAll()
    }
}
