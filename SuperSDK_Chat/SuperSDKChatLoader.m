#import <Foundation/Foundation.h>
#import <SuperSDK_Core/SuperSDK_Core-Swift.h>

@implementation SuperSDKChatLoader

+ (void)load {
    Class chatClass = NSClassFromString(@"SuperSDKChat");
    if (chatClass) {
        id chatInstance = [[chatClass alloc] init];
        if (chatInstance) {
            [[ModuleRegistry shared] registerModule:chatInstance];
            NSLog(@"🔵 SuperSDKChatLoader.load() — Chat module registered.");
        }
    }
}

@end
