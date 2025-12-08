import Foundation

internal enum SuperSDKForceLoader {
    static func loadAllModules() {
        // Tenta encontrar e invocar loaders expostos pelos subspecs (Chat, Network, etc)
        tryCallLoader(named: "SuperSDKChatLoader")
        // Se tiver Network: tryCallLoader(named: "SuperSDKNetworkLoader")
    }

    private static func tryCallLoader(named className: String) {
        guard let cls = NSClassFromString(className) as? NSObject.Type else {
            // Classe não encontrada no runtime -> provavelmente o módulo não foi compilado
            return
        }
        let selector = NSSelectorFromString("registerModule")
        if cls.responds(to: selector) {
            // Invoca o método estático registerModule
            // Uso perform porque é NSObject.Type (metaclass)
            _ = cls.perform(selector)
        }
    }
}

public final class SuperSDKMain {
    public static func start() {
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
