//
//  SFCoreMacroses.h
//  StanfyCore
//
//  Taken from Three20
//
//  Created by Slavik Bubnov on 01.11.11.
//  Copyright (c) 2011 Stanfy, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


/** 
 No-ops for non-retaining objects.1
 */
static const void * SFRetainNoOp(CFAllocatorRef allocator, const void *value) { return value; }
static void SFReleaseNoOp(CFAllocatorRef allocator, const void *value) { }


/**
 Creates a mutable array which does not retain references to the objects it contains.
 Typically used with arrays of delegates.
 */
static NSMutableArray * SFCreateNonRetainingArray() {
   CFArrayCallBacks callbacks = kCFTypeArrayCallBacks;
   callbacks.retain = SFRetainNoOp;
   callbacks.release = SFReleaseNoOp;
   return (__bridge_transfer NSMutableArray *)CFArrayCreateMutable(nil, 0, &callbacks);
}


/**
 Creates a mutable dictionary which does not retain references to the values it contains.
 Typically used with dictionaries of delegates.
 */
static NSMutableDictionary * SFCreateNonRetainingDictionary() {
   CFDictionaryKeyCallBacks keyCallbacks = kCFTypeDictionaryKeyCallBacks;
   CFDictionaryValueCallBacks callbacks = kCFTypeDictionaryValueCallBacks;
   callbacks.retain = SFRetainNoOp;
   callbacks.release = SFReleaseNoOp;
   return (__bridge_transfer NSMutableDictionary *)CFDictionaryCreateMutable(nil, 0, &keyCallbacks, &callbacks);
}