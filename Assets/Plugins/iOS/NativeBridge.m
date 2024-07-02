#import "NativeBridge.h"

@implementation NativeBridge

+ (void)updateWidgetWithLevel:(int)level {
    if (@available(iOS 14.0, *)) {
        NSUserDefaults *shared = [[NSUserDefaults alloc] initWithSuiteName:@"group.yourAppGroupIdentifier"];
        [shared setInteger:level forKey:@"currentLevel"];
        [shared synchronize];

        [[WidgetCenter sharedCenter] reloadAllTimelines];
    }
}

@end