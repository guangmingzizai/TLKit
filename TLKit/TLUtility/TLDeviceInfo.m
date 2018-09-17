//
//  TLDeviceInfo.m
//  AFNetworking
//
//  Created by ypf on 2018/9/17.
//

#import "TLDeviceInfo.h"

@implementation TLDeviceInfo

+ (BOOL)isIPhoneXSeries
{
    if ([UIDevice currentDevice].userInterfaceIdiom != UIUserInterfaceIdiomPhone) {
        return NO;
    }
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        if (mainWindow.safeAreaInsets.bottom > 0.0) {
            return YES;
        }
    }
    return NO;
}

@end
