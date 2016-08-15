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
 Creates a mutable array which does not retain references to the objects it contains.
 Typically used with arrays of delegates.
 */
extern NSMutableArray * SFCreateNonRetainingArray();


/**
 Creates a mutable dictionary which does not retain references to the values it contains.
 Typically used with dictionaries of delegates.
 */
extern NSMutableDictionary * SFCreateNonRetainingDictionary();