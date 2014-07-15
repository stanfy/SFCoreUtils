//
//  NSMutableArray+SFNonRetaining.h
//  StanfyCore
// 
//  Created by Slavik Bubnov on 08.11.11.
//  Copyright (c) 2011 Stanfy, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSMutableArray (SFNonRetaining)


/**
 Creates mutable array that doesn't retain values in it
 @return NSMutableArray
 */
+ (NSMutableArray *)nonRetainingArray;


@end