//
//  SFDateFormatterUtils.m
//  StanfyCore
//
//  Created by Paul Taykalo on 2/21/12.
//  Copyright (c) 2012 Stanfy, LLC. All rights reserved.
//

#import "SFDateFormatterUtils.h"

@implementation SFDateFormatterUtils

static NSMutableDictionary * _dateFormattersDictionary;

+ (void)initialize {
   if (self == [SFDateFormatterUtils class]) {
      _dateFormattersDictionary = [NSMutableDictionary dictionary];
   }
}


+ (NSDateFormatter *)dateFormatterWithFormat:(NSString *)dateFormat {
   
   // No dateFormat ? No Date Formatter! :)
   if ( ! dateFormat) {
      return nil;
   }

   // Test
   @synchronized(_dateFormattersDictionary) {
   
       NSDateFormatter * result = [_dateFormattersDictionary objectForKey:dateFormat];
       
       if ( ! result) {
          // Create and cache new dateformatter
          result = [[NSDateFormatter alloc] init];
          [result setDateFormat:dateFormat];
          [_dateFormattersDictionary setObject:result forKey:dateFormat];
       }
       
       return result;

     }
     
}


+ (NSDateFormatter *)dateFormatterWithFormat:(NSString *)dateFormat andLocale:(NSString *)localeString {
   if ( ! localeString) {
      return [self dateFormatterWithFormat:dateFormat];
   }
   
   // No dateFormat ? No Date Formatter! :)
   if ( ! dateFormat) {
      return nil;
   }

   @synchronized(_dateFormattersDictionary) {
   
       // Concatenatig locale + dateFormat strings to receive unique key
       NSString * key = [NSString stringWithFormat:@"%@|!|%@", dateFormat,localeString];
       NSDateFormatter * result = [_dateFormattersDictionary objectForKey:key];
       
       if ( ! result) {
          // Create and cache new dateformatter
          result = [[NSDateFormatter alloc] init];
          [result setDateFormat:dateFormat];
          NSLocale * locale = [[NSLocale alloc] initWithLocaleIdentifier:localeString];
          [result setLocale:locale];
          [_dateFormattersDictionary setObject:result forKey:dateFormat];
       }
       return result;

     }

}


+ (NSDateFormatter *)dateFormatterWithFormat:(NSString *)dateFormat andTimeZoneAbbreviation:(NSString *)timeZoneAbbreviation {
    // No dateFormat ? No Date Formatter! :)
    if ( ! dateFormat) {
        return nil;
    }
    
    // Check and setup default abbreviation if needed
    NSString * internalAbbreviation = timeZoneAbbreviation;
    if (!timeZoneAbbreviation) {
        NSTimeZone * localTimeZone = [NSTimeZone localTimeZone];
        internalAbbreviation = [localTimeZone abbreviation];
    }

    @synchronized(_dateFormattersDictionary) {
    
        // Concatenatig abbreviation + dateFormat strings to receive unique key
        NSString * key = [NSString stringWithFormat:@"%@|TZ|%@", dateFormat,internalAbbreviation];
        NSDateFormatter * result = [_dateFormattersDictionary objectForKey:key];
        
        if (!result) {
            // Create and cache ew dateformatter
            result = [[NSDateFormatter alloc] init];
            [result setDateFormat:dateFormat];
            NSTimeZone * neededTimeZone = [NSTimeZone timeZoneWithAbbreviation:internalAbbreviation];
            [result setTimeZone:neededTimeZone];
            [_dateFormattersDictionary setObject:result forKey:dateFormat];
        }

        return result;

    }
    
}


@end
