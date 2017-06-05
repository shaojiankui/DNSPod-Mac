//
//  DateManager.h
//
//
//  Created by Jakey on 15/7/13.
//  Copyright © 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateManager : NSObject
+ (DateManager *)sharedManager;
- (NSString *)stringConvertFromDate:(NSDate *)date format:(NSString *)format;
+ (NSString *)stringConvert_YMDHMS_FromDate:(NSDate *)date;
@end
