# SFCoreUtils

Number of useful beans: DateFormatter, UIView macroses, non-retaining arrays etc

## Utils


### VersionSupportHelper
Say 'yes' to easy maintaining of several iOS versions at the same moment!

Run code only on iOS7 like this:

``` objective-c
    [SFVersionSupportHelper onDeviceVersionGreaterOrEqualToVersion:7.0 do:^{
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.view.tintColor = [UIColor whiteColor];
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    }];
```

Or on both iOS7 and iOS6:
``` objective-c
    [VersionSupportHelper onDeviceVersionGreaterOrEqualToVersion:7.0 do:^{
        UIImage * image = [UIImage imageNamed:@"navigation-bar-blue-transparent-ios7"];
        [navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    } elseDo:^{
        navigationBar.barStyle = UIBarStyleBlackTranslucent;
        UIImage * image = [[UIImage imageNamed:@"navigation-bar-blue-transparent"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 8, 0, 8)];
        [navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    }];

```

Easy to use! 

Supports different conditions:
* if-greater-than-do
* if-less-than-do 
* if-greater-than-do-else-do.

Useful even for minor releases!

Compatible with iOS8! (but I haven't example yet =) )
