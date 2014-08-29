//
//  NSString+DeviceToken.m
//
//  Created by Viktor Gubriienko on 24.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSString+DeviceToken.h"

@implementation NSString (DeviceToken)

- (NSString*)stringByRemovingTagsAndSpaces {
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"<> "];
    return [[self componentsSeparatedByCharactersInSet:set] componentsJoinedByString:@""];
}

@end
