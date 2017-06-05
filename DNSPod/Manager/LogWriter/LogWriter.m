//
//  LogWriter.m
//
//
//  Created by Jakey on 16/4/11.
//  Copyright © 2016年 www.skyfox.org. All rights reserved.
//

#import "LogWriter.h"
#import "DateManager.h"
@implementation LogWriter

+ (void)writeLog:(NSString*)log type:(NSString*)type
{
    //如果已经连接Xcode调试则不输出到文件
//    if (isatty(STDOUT_FILENO)) {
//        return;
//    }
    //    //判定如果是模拟器就不输出
    //    UIDevice *device = [UIDevice currentDevice];
    //    if ([[device model]hasSuffix:@"Simulator"]) {
    //        return;
    //    }

    //将NSLog打印信息保存到Document目录下的Log文件夹下
    NSString *logPath = [[[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"Logs"] stringByAppendingPathComponent:@"ddns.log"];
    NSLog(@"ddns log path:%@",logPath);
    
    NSMutableString *string = [NSMutableString string];
    [string appendString:[NSString stringWithFormat:@"LogDate:%@\r\n",[DateManager stringConvert_YMDHMS_FromDate:[NSDate date]]]];
    [string appendString:[NSString stringWithFormat:@"Type%@\r\n",type]];

    [string appendString:[NSString stringWithFormat:@"Log%@\r\n",log]];
    
    //把错误日志写到文件中
    if (![[NSFileManager defaultManager] fileExistsAtPath:logPath]) {
        [string writeToFile:logPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }else{
        NSFileHandle *outFile = [NSFileHandle fileHandleForWritingAtPath:logPath];
        [outFile seekToEndOfFile];
        [outFile writeData:[string dataUsingEncoding:NSUTF8StringEncoding]];
        [outFile closeFile];
    }
    
}

@end
