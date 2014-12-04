//
//  SFVersionSupportHelper
//
//
//  Created by Paul Taykalo on 9/11/13.
//  Copyright (c) 2012 Stanfy LLC. All rights reserved.
//
#import <Foundation/Foundation.h>


@interface SFVersionSupportHelper : NSObject

+ (void)onDeviceVersionGreaterOrEqualToVersion:(float)version do:(BHActionBlock)block;

+ (void)onDeviceVersionLessThan:(float)version do:(BHActionBlock)block;

+ (void)onDeviceVersionGreaterOrEqualToVersion:(float)version do:(BHActionBlock)block elseDo:(BHActionBlock)elseBlock;

@end