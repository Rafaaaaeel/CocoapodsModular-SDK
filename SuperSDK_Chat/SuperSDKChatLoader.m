#import <Foundation/Foundation.h>
@import SuperSDK_Core; // importa o Core do seu SDK
@import SuperSDK_Chat; // importa o módulo atual

@interface SuperSDKChatLoader : NSObject
@end

@implementation SuperSDKChatLoader

+ (void)load {
    // registra automaticamente
    [ModuleRegistry.shared register:[[SuperSDKChat alloc] init]];
    NSLog(@"🔵 SuperSDKChatLoader.load() — Chat module registered.");
}

@end
