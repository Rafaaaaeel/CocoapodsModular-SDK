#import <Foundation/Foundation.h>
#import <SuperSDK/SuperSDK-Swift.h>

// Declare the class and the superclass
@interface SuperSDKChatLoader : NSObject
@end

@implementation SuperSDKChatLoader

+ (void)load {
    // locate the Swift class by name
    Class chatClass = NSClassFromString(@"SuperSDKChat");

    if (chatClass) {
        id chatInstance = [[chatClass alloc] init];

        if (chatInstance) {
            // Call the Swift registry (auto imported via -Swift.h)
            [ModuleRegistry.shared registerModule:chatInstance];

            NSLog(@"🔵 SuperSDKChatLoader.load() — Chat module registered.");
        }
    }
}

@end
