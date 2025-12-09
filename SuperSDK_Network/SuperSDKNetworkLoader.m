#import <Foundation/Foundation.h>
#import <SuperSDK_Core/SuperSDK_Core-Swift.h>

@implementation SuperSDKNetworkLoader

+ (void)load {
    Class cls = NSClassFromString(@"SuperSDKNetwork");
    if (cls) {
        id instance = [[cls alloc] init];
        if (instance) {
            [[ModuleRegistry shared] registerModule:instance];
            NSLog(@"🟡 SuperSDKNetworkLoader.load() — Network module registered.");
        }
    }
}

@end
