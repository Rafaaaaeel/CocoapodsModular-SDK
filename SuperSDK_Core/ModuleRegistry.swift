import Foundation

@objcMembers
public final class ModuleRegistry: NSObject {
    public static let shared = ModuleRegistry()
    private override init() {}
    private var modules: [NSObject] = []

    @objc public func registerModule(_ module: NSObject) {
        modules.append(module)
    }

    public func executeAll() {
        for m in modules {
            let sel = NSSelectorFromString("execute")
            if m.responds(to: sel) { m.perform(sel) }
        }
    }

    @objc public func registeredModuleNames() -> [String] {
        modules.map { String(describing: type(of: $0)) }
    }
}
