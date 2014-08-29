//
//  NSObject+ClassCast.m
//
//  Created by Paul Taykalo on 1/23/12.
//  Copyright (c) 2012 Stanfy LLC. All rights reserved.
//

#import "NSObject+ClassCast.h"

@implementation NSObject (ClassCast)

- (id)castOrNil:(Class)clz {
   if ([self isKindOfClass:clz]) {
      return self;
   }
   return nil;
}


- (id)castToProtocolOrNil:(Protocol * )protocol {
   if ([self conformsToProtocol:protocol]) {
      return self;
   }
   return nil;
}


- (id)castOrNilWithNullCheck:(Class)clz {
   if ([self isKindOfClass:clz] && (id)clz != [NSNull null]) {
      return self;
   }
   return nil;
}


@end
