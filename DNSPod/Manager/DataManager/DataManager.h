//
//  DataManager.h
//  DNSPod
//
//  Created by www.skyfox.org on 2017/6/1.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject
+(NSMutableDictionary*)ddnsList;
+(BOOL)saveDdnsList:(NSMutableDictionary*)ddnsList;
@end
