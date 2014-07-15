//
//  NSMutableDictionary+SFNonRetaining.m
//  LadyBug
//
//  Created by Paul Taykalo on 1/23/13.
//  Copyright (c) 2013 Stanfy. All rights reserved.
//

#import "NSMutableDictionary+SFNonRetaining.h"
#import "SFNonRetainingFunctions.h"

@implementation NSMutableDictionary (SFNonRetaining)

+ (NSMutableDictionary *)nonRetainingDictionary {
   return SFCreateNonRetainingDictionary();
}

@end
