//
//  SFRuntime.h
//  StanfyCore
//
//  Created by Slavik Bubnov on 13.10.11.
//  Copyright (c) 2011 Stanfy, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>


/**
 Class, used to handle runtime-specific tasks, e.g. getting object's protocol 
 list array or method swizzling.
 */
@interface SFRuntime : NSObject


/**
 Perform object's methods swizling
 If original method is not exists - it will be added 
 and then replaced with new one (if |ifExists| flag is YES).
 Otherwise, methods will be exchanged.
 */
+ (void)swizzleSelector:(SEL)originalSelector 
           withSelector:(SEL)newSelector 
          atObjectClass:(Class)objectClass 
               ifExists:(BOOL)ifExists;


/**
 Same as the method above, swizzling will perform 
 no matter original selector is exists or not.
 */
+ (void)swizzleSelector:(SEL)originalSelector 
           withSelector:(SEL)newSelector 
          atObjectClass:(Class)objectClass;


/**
 Identifies type of the |propertyName| in |objectClass|
 @return NSString string name of the property type
 */
+ (NSString *)typeForProperty:(NSString *)propertyName ofClass:(Class)objectClass;


@end


// TODO: add swizzling for class methods