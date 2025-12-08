import Foundation

public final class SuperSDKChat: SuperSDKModule {
    public init() {}

    public func execute() {
        print("🟣 SuperSDKChat.execute() — Chat module executed via CocoaPods!")
    }
}

/// ------------------------------------------------------------
/// 🎯 Classe “fantasma” usada apenas para evitar dead-strip
///
/// O Swift só executa variáveis globais SE a unidade de
/// compilação for realmente usada. Esta classe é o “gatilho”.
/// ------------------------------------------------------------
public protocol _ForceLoadChatModule {}
public final class _ForceLoadChatModuleImpl: _ForceLoadChatModule {}

/// ------------------------------------------------------------
/// 🎯 Auto-registro (agora garantido que será executado)
/// ------------------------------------------------------------
private let _chat_auto_register: Void = {
    ModuleRegistry.shared.register(SuperSDKChat())
}()
