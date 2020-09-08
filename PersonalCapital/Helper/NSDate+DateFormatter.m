//
//  NSDate+DateFormatter.m
//  PersonalCapital
//
//  Created by Dinesh Kumar Dhanekula on 9/7/20.
//  Copyright © 2020 Dinesh Kumar Dhanekula. All rights reserved.
//

#import "NSDate+DateFormatter.h"

@implementation NSDate (DateFormatter)
+ (NSString*) formetDate:(NSString*)dateString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZZZZZ";
    dateFormatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    NSString *string = dateString;
    NSDate *date = [dateFormatter dateFromString:string];
    dateFormatter.dateStyle = kCFDateFormatterLongStyle;
    dateFormatter.timeStyle = NSDateFormatterNoStyle;
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    return [dateFormatter stringFromDate:date];
}
@end
