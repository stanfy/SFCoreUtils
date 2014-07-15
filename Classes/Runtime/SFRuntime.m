//
//  SFRuntime.m
//  StanfyCore
//
//  Created by Slavik Bubnov on 13.10.11.
//  Copyright (c) 2011 Stanfy, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SFRuntime.h"


@implementation SFRuntime


+ (void)swizzleSelector:(SEL)originalSelector 
           withSelector:(SEL)newSelector 
          atObjectClass:(Class)objectClass 
               ifExists:(BOOL)ifExists 
{
   // Get both the methods from the object by its selectors
   Method originalMethod = class_getInstanceMethod(objectClass, originalSelector);
   Method newMethod = class_getInstanceMethod(objectClass, newSelector);
   
   // If |ifExists| is YES - perform swizzling only if original selector exists for the object instance
   // Otherwise, original selector will be added if absent.
   if (ifExists && class_getInstanceMethod(objectClass, originalSelector)) {
      method_exchangeImplementations(originalMethod, newMethod);
   } else {
      // Try to add original method. If it is added successfully - replace it with new method.
      // If original method is already exists - just exchange the implementations of both methods.
      if (class_addMethod(objectClass, originalSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod))) {
         class_replaceMethod(objectClass, newSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
      } else {
         method_exchangeImplementations(originalMethod, newMethod);
      }
   }
}


+ (void)swizzleSelector:(SEL)originalSelector 
           withSelector:(SEL)newSelector 
          atObjectClass:(Class)objectClass 
{
   // Swizzle methods no matter original selector is exists or not (default logic)
   [self swizzleSelector:originalSelector withSelector:newSelector atObjectClass:objectClass ifExists:NO];
}



+ (NSString *)typeForProperty:(NSString *)propertyName ofClass:(Class)objectClass {
   const char *attributes;
   objc_property_t property = class_getProperty(objectClass, [propertyName UTF8String]);

   // Searching property
   if (property) {
      attributes = property_getAttributes(property);
   } 
   // Searchng Ivar if property wasn't found
   else {
      Ivar ivar = class_getInstanceVariable(objectClass, [propertyName UTF8String]);
      attributes = ivar_getTypeEncoding(ivar);
   }
   
   // If attributes is nil - we've found nothing. Return nil
   if ( ! attributes) {
      return nil;
   }
   
   NSString *attributesString = [NSString stringWithUTF8String:attributes];
   
   // Class
   if ([attributesString hasPrefix:@"T@\""]) {
      int commaLocation = [attributesString rangeOfString:@","].location;
      NSString *name = [attributesString substringWithRange:NSMakeRange(3, commaLocation - 4)];
      return name;
   }
   
   // Structure
   // T{CGRect="origin"{CGPoint="x"f"y"f}"size"{CGSize="width"f"height"f}},N,V_rectProperty
   if ([attributesString hasPrefix:@"T{"]) {
      int commaLocation = [attributesString rangeOfString:@"="].location;
      NSString *name = [attributesString substringWithRange:NSMakeRange(2, commaLocation - 2 )];
      return name;
   }
   
   // Number
   // BOOL == char
   // Tc,N,V_iPadEnabled
   if ([attributesString hasPrefix:@"Tf"] || 
       [attributesString hasPrefix:@"Ti"] ||
       [attributesString hasPrefix:@"Td"] || 
       [attributesString hasPrefix:@"Ts"]) {
      NSString *name = @"NSNumber";
      return name;
   }
   
   // BOOL
   if ([attributesString hasPrefix:@"Tc"]) {
      return @"BOOL";
   }
   
   return nil;
}


@end
