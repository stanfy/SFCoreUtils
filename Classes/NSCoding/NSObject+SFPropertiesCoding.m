//
//  NSObject+SFPropertiesCoding.m
//  StanfyCore
//
//  Created by Paul Taykalo on 2/18/12.
//  Copyright (c) 2012 Stanfy, LLC. All rights reserved.
//

#import "NSObject+SFPropertiesCoding.h"
#import <objc/runtime.h>

@implementation NSObject (NSPropertiesCoding)

// ios8 workaround, skip readonly properties
// read more
// http://www.redwindsoftware.com/blog/post/2014/08/20/NSObject-has-some-new-properties-in-iOS-8.aspx
- (BOOL)isReadOnly:(objc_property_t)propertyObject {
    // http://stackoverflow.com/a/18455154
    const char *propertyAttributes = property_getAttributes(propertyObject);
    NSArray *attributes = [[NSString stringWithUTF8String:propertyAttributes] componentsSeparatedByString:@","];
    
    return [attributes containsObject:@"R"];
}


- (void)encodePropertiesWithCoder:(NSCoder *)aCoder {
    Class clz = [self class];
    while (clz) {
        
        unsigned int propertiesCount = 0;
        objc_property_t * properties = class_copyPropertyList(clz, &propertiesCount);
        for (int i = 0; i < propertiesCount; i++) {
            objc_property_t propertyObject = properties[i];
            if ( propertyObject ) {
                const char * propertyNameC = property_getName(propertyObject);
                if ( propertyNameC ) {
                    NSString * propertyName = [NSString stringWithCString:propertyNameC encoding:NSUTF8StringEncoding];
                    NSString * autoencodedPropertyName = [NSString stringWithFormat:@"autoencoded_%s", propertyNameC];
                    
                    id value = [self valueForKey:propertyName];
                    BOOL isReadOnly = [self isReadOnly:propertyObject];
                    
                    if (value && !isReadOnly) {
                        [aCoder encodeObject:value forKey:autoencodedPropertyName];
                    }
                }
            }
            
        }
        
        free(properties);
        
        clz = class_getSuperclass(clz);
    }
    
}


- (void)decodePropertiesWithCoder:(NSCoder *)aDecoder {
    Class clz = [self class];
    while (clz) {
        unsigned int propertiesCount = 0;
        objc_property_t * properties = class_copyPropertyList(clz, &propertiesCount);
        for (int i = 0; i < propertiesCount; i++) {
            objc_property_t propertyObject = properties[i];
            const char * propertyNameC = property_getName(propertyObject);
            NSString * propertyName = [NSString stringWithCString:propertyNameC encoding:NSUTF8StringEncoding];
            NSString * autoencodedPropertyName = [NSString stringWithFormat:@"autoencoded_%s", propertyNameC];
            
            id decodedObject = [aDecoder decodeObjectForKey:autoencodedPropertyName];
            BOOL isReadOnly = [self isReadOnly:propertyObject];
            
            if (decodedObject && !isReadOnly) {
                [self setValue:decodedObject forKey:propertyName];
            }
        }
        
        free(properties);
        
        clz = class_getSuperclass(clz);
        
    }
}

@end