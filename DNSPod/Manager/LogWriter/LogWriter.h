//
//  LogWriter.h
//
//
//  Created by Jakey on 16/4/11.
//  Copyright © 2016年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LogWriter : NSObject
+ (void)writeLog:(NSString*)log type:(NSString*)type;
@end
