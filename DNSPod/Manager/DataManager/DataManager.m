//
//  DataManager.m
//  DNSPod
//
//  Created by www.skyfox.org on 2017/6/1.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import "DataManager.h"
#import "NSDictionary+JKJSONString.h"
#import "NSString+JKDictionaryValue.h"
@implementation DataManager
+(NSMutableDictionary*)ddnsList{
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"ddns.json"];
    NSString *JSONString=[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];

    return [[JSONString jk_dictionaryValue] mutableCopy]?:[NSMutableDictionary dictionary];

}
+(BOOL)saveDdnsList:(NSMutableDictionary*)ddnsList{
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"ddns.json"];

    NSString *JSONString = [ddnsList jk_JSONString];
    NSError *error = nil;
    BOOL result = [JSONString writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:&error];
    NSLog(@"%@",error);
    return result;
}
@end
