//
//  SFVersionSupportHelper
//
//
//  Created by Paul Taykalo on 9/11/13.
//  Copyright (c) 2012 Stanfy LLC. All rights reserved.
//
#import "SFVersionSupportHelper.h"


@implementation SFVersionSupportHelper

+ (void)onDeviceVersionGreaterOrEqualToVersion:(float)version do:(BHActionBlock)block {
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= version) {
        if (block) {
            block();
        }
    }
}


+ (void)onDeviceVersionLessThan:(float)version do:(BHActionBlock)block {
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < version) {
        if (block) {
            block();
        }
    }
}


+ (void)onDeviceVersionGreaterOrEqualToVersion:(float)version do:(BHActionBlock)block elseDo:(BHActionBlock)elseBlock {
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= version) {
        if (block) {
            block();
        }
    } else {
        if (elseBlock) {
            elseBlock();
        }
    }
}


@end