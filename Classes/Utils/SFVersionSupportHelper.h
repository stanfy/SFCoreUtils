//
//  SFVersionSupportHelper
//
//
//  Created by Paul Taykalo on 9/11/13.
//  Copyright (c) 2012 Stanfy LLC. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "UsefulBlocks.h"


@interface SFVersionSupportHelper : NSObject

+ (void)onDeviceVersionGreaterOrEqualToVersion:(float)version do:(SFActionBlock)block;

+ (void)onDeviceVersionLessThan:(float)version do:(SFActionBlock)block;

+ (void)onDeviceVersionGreaterOrEqualToVersion:(float)version do:(SFActionBlock)block elseDo:(SFActionBlock)elseBlock;

@end