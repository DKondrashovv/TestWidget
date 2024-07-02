#import "NativeBridge.h"
@import WidgetKit;

void updateWidget(int level) {
    if (@available(iOS 14.0, *)) {
        NSUserDefaults *shared = [[NSUserDefaults alloc] initWithSuiteName:@"group.AbaldetProduction"];
        [shared setInteger:level forKey:@"currentLevel"];
        [shared synchronize];

        [[WidgetCenter sharedCenter] reloadAllTimelines];
    }
}
