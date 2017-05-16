//
//  APIManager.h
//  DNSPod
//
//  Created by skyfox on 2017/5/16.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDictionary+JKSafeAccess.h"

@interface APIManager : NSObject
@property(nonatomic,strong)  NSURLSession *session;
+ (instancetype)sharedManager;

- (NSURLSessionDataTask *)POST:(NSString *)uri
                    parameters:(id)parameters
                       success:(void (^)(NSURLResponse *response,id responseObject))success
                       failure:(void (^)(NSURLResponse *response,NSError *error))failure;
@end
