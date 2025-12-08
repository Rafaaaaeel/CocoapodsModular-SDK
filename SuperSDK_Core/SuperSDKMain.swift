import Foundation

public final class SuperSDKMain {
    private static let loaderClassNames = [
        "SuperSDKChatLoader",
        "SuperSDKNetworkLoader"
        // Adicione aqui loaders de novos módulos
    ]

    private static func runLoaders() {
        for name in loaderClassNames {
            if let cls = NSClassFromString(name) as? NSObject.Type,
               cls.responds(to: Selector(("registerModule"))) {
                print("🔵 Found loader: \(name)")
                cls.perform(Selector(("registerModule")))
            } else {
                print("⚪️ Loader NOT found: \(name)")
            }
        }
    }

    public static func start() {
        print("🚀 SuperSDKMain.start() called")

        // 🔥 Agora os módulos serão carregados
        runLoaders()

        let names = ModuleRegistry.shared.registeredModuleNames()
        print("Modules: \(names)")

        if names.isEmpty {
            print("⚠️ No modules registered!")
        }

        ModuleRegistry.shared.executeAll()
    }
}
