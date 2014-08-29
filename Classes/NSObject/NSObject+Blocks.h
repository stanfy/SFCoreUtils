//
//  NSObject+Blocks.h
//
//  Created by phvasilchenko on 11.10.12.
//  Copyright (c) 2012 Stanfy LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Blocks)

+ (id)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay;
+ (id)performBlock:(void (^)(id arg))block withObject:(id)anObject afterDelay:(NSTimeInterval)delay;
- (id)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay;
- (id)performBlock:(void (^)(id arg))block withObject:(id)anObject afterDelay:(NSTimeInterval)delay;

+ (void)cancelBlock:(id)block;

@end
