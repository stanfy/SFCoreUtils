//
//  NSObject+ClassCast.h
//
//  Created by Paul Taykalo on 1/23/12.
//  Copyright (c) 2012 Stanfy LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ClassCast)

- (id)castOrNil:(Class)clz;

- (id)castToProtocolOrNil:(Protocol * )protocol;

- (id)castOrNilWithNullCheck:(Class)clz;

@end
