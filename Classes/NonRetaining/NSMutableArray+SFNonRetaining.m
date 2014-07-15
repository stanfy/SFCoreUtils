//
//  NSMutableArray+SFNonRetaining.m
//  StanfyCore
// 
//  Created by Slavik Bubnov on 08.11.11.
//  Copyright (c) 2011 Stanfy, LLC. All rights reserved.
//

#import "NSMutableArray+SFNonRetaining.h"
#import "SFNonRetainingFunctions.h"


@implementation NSMutableArray (SFNonRetaining)


+ (NSMutableArray *)nonRetainingArray {
   return SFCreateNonRetainingArray();
}


@end


