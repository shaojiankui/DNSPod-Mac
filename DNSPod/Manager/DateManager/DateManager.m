//
//  DateManager.m
//  
//
//  Created by Jakey on 15/7/13.
//  Copyright © 2015年 www.skyfox.org. All rights reserved.
//
#define FORMATER_YYMMDD
#import "DateManager.h"
@interface DateManager ()
@property (nonatomic, strong) NSDateFormatter *dateForrmatter;
@end
@implementation DateManager
+ (DateManager *) sharedManager
{
    static DateManager *dateManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateManager = [[self alloc] init];
    });
    return dateManager;
}
- (id)init
{
    self = [super init];
    if (self) {
        _dateForrmatter = [[NSDateFormatter alloc] init];
        [_dateForrmatter setLocale:[NSLocale currentLocale]];
//       [_dateForrmatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
//        [_dateForrmatter setTimeZone:[NSTimeZone localTimeZone]];
       [_dateForrmatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:3600*8]];
//       [_dateForrmatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];

    }
    return self;
}

- (NSString *)stringConvertFromDate:(NSDate *)date format:(NSString *)format
{
    [_dateForrmatter setDateFormat:format];
    NSString *dateString = [_dateForrmatter stringFromDate:date];
    return dateString;
}
+ (NSString *)stringConvert_YMDHMS_FromDate:(NSDate *)date{
    return [[DateManager sharedManager] stringConvertFromDate:date format:@"yyyy-MM-dd HH:mm:ss"];
}
@end
