//
//  SFDateFormatterUtils.h
//  StanfyCore
//
//  Created by Paul Taykalo on 2/21/12.
//  Copyright (c) 2012 Stanfy, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


/*
 This class is responsibly to for saving one number formatter for each specified dateFormat string
 Main idea is that NSDateFormatter creation is toooo expensive, to create them every time,
 So we reoslving some meomory to cache them.
 
 Another idea is that there's not so much dateFormat strings in application.
 
 If application actively uses different dateFormat strings, you SHOULD NOT use it.
 
 */
@interface SFDateFormatterUtils : NSObject

/*
 Returns cached dateFormateter for specified dateFormat strings.
 Will create new dateFormatter, if there was no cached values
 */
+ (NSDateFormatter *)dateFormatterWithFormat:(NSString *)dateFormat;

/*
 Returns cached dateFormatter for specified dateFormat string and localeString
 if localeString is nil, this method will call dateFormatterWithFormat: method.
 Will create new dateFormatter, if there was no cached values
 */
+ (NSDateFormatter *)dateFormatterWithFormat:(NSString *)dateFormat andLocale:(NSString *)localeString;

/*
 Returns cached dateFormatter for specified dateFormat string and timeZoneAbbreviation
 if timeZoneAbbreviation is nil, local timeZone will be used.
 Will create new dateFormatter, if there was no cached values
 */
+ (NSDateFormatter *)dateFormatterWithFormat:(NSString *)dateFormat andTimeZoneAbbreviation:(NSString *)timeZoneAbbreviation;


@end

