
import Foundation

public final class SuperSDKMain {
    /// Start only the modules that were compiled into the app (registered via ModuleAutoRegister)
    public static func start() {
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
