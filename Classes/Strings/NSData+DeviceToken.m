//
//  NSData+DeviceToken.m
//
//  Created by Viktor Gubriienko on 24.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSData+DeviceToken.h"
#import "NSString+DeviceToken.h"

@implementation NSData (DeviceToken)

- (NSString*)stringByRemovingTagsAndSpaces {
    return [[self description] stringByRemovingTagsAndSpaces];
}

@end
