//
//  UsefulBlocks
//
//
//  Created by Anastasi Voitova on 26.03.13.
//  Copyright (c) 2013 Stanfy LLC. All rights reserved.
//


typedef void (^SFSuccessBlock)(id result);

typedef void (^SFErrorBlock)(NSError *error);

typedef void (^SFResponseErrorBlock)(id response, NSError *error);


typedef void (^SFActionBlock)();