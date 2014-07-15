//
//  NSObject+SFPropertiesCoding.m
//  StanfyCore
//
//  Created by Paul Taykalo on 2/18/12.
//  Copyright (c) 2012 Stanfy, LLC. All rights reserved.
//

#import "NSObject+SFPropertiesCoding.h"
#import <objc/runtime.h>
//#import <StanfyCore/StanfyCore.h>

@implementation NSObject (NSPropertiesCoding)

- (void)encodePropertiesWithCoder:(NSCoder *)aCoder {
   Class clz = [self class];
   while (clz) {

      NSUInteger propertiesCount;
      objc_property_t * properties = class_copyPropertyList(clz, &propertiesCount);
      for (int i = 0; i < propertiesCount; i++) {
         objc_property_t property = properties[i];
         const char * propertyNameC = property_getName(property);
         NSString * propertyName = [NSString stringWithCString:propertyNameC encoding:NSUTF8StringEncoding];
         NSString * autoencodedPropertyName = [NSString stringWithFormat:@"autoencoded_%s", propertyNameC];

         id value = [self valueForKey:propertyName];
         if (value) {
            [aCoder encodeObject:value forKey:autoencodedPropertyName];
         }
      }

      free(properties);

      clz = class_getSuperclass(clz);
   }

}


- (void)decodePropertiesWithCoder:(NSCoder *)aDecoder {
   Class clz = [self class];
   while (clz) {
      NSUInteger propertiesCount;
      objc_property_t * properties = class_copyPropertyList(clz, &propertiesCount);
      for (int i = 0; i < propertiesCount; i++) {
         objc_property_t property = properties[i];
         const char * propertyNameC = property_getName(property);
         NSString * propertyName = [NSString stringWithCString:propertyNameC encoding:NSUTF8StringEncoding];
         NSString * autoencodedPropertyName = [NSString stringWithFormat:@"autoencoded_%s", propertyNameC];

         id decodedObject = [aDecoder decodeObjectForKey:autoencodedPropertyName];
         if (decodedObject) {
            [self setValue:decodedObject forKey:propertyName];
         }
      }

      free(properties);

      clz = class_getSuperclass(clz);

   }
}


@end
