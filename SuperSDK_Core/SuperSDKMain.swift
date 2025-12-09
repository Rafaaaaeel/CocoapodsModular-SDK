import Foundation

public enum SuperSDKMain {
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
