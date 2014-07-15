//
//  NSObject+SFPropertiesCoding.h
//  StanfyCore
//
//  Created by Paul Taykalo on 2/18/12.
//  Copyright (c) 2012 Stanfy, LLC. All rights reserved.
//


@interface NSObject (NSPropertiesCoding)

/*
 Encodes ALL properties with specified coder
 This can be useful when implementing NSCoding proptocol on small objects
 */
- (void)encodePropertiesWithCoder:(NSCoder *)aCoder;

/*
 Decodes ALL properties with specified coder.
 This can be useful when implementing NSCoding proptocol on small objects
 
 WARNING : Nil values woudn't be set.
 This can be OK, on object iniitalization, but this is obviously NOT OK, when
 you're trying to re-set properties on object.
 */
- (void)decodePropertiesWithCoder:(NSCoder *)aDecoder;

@end
