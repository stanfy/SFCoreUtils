//
//  UsefulQueues.h
//  SwivlCommonApp
//
//  Created by Sergey Kovalenko on 5/5/14.
//  Copyright (c) 2014 Stanfy LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

#define HIGH_PRIORITY_QUEUE dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,0)
#define DEFAULT_QUEUE dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0)
#define LOW_PRIORITY_QUEUE dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW,0)
#define BACKGROUND_QUEUE dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND,0)
#define MAIN_QUEUE dispatch_get_main_queue()