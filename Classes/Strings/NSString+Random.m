//
//  NSString(Random)
//  LadyBug
//
//  Created by Paul Taykalo on 1/21/13.
//  Copyright (c) 2012 Stanfy LLC. All rights reserved.
//
#import "NSString+Random.h"


@implementation NSString (Random)

NSString * letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";


+ (NSString *)randomStringWithLength:(NSUInteger)len {
   NSMutableString * randomString = [NSMutableString stringWithCapacity:len];
   for (int i = 0; i < len; i++) {
      [randomString appendFormat:@"%C", [letters characterAtIndex:arc4random() % [letters length]]];
   }
   return randomString;
}
@end