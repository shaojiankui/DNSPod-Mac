//
//  User.m
//  DNSPod
//
//  Created by skyfox on 2017/5/16.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import "User.h"

@implementation User
+ (void)UserDetail:(NSString*)login_email
    login_password:(NSString*)login_password
           success:(void (^)(NSURLResponse *response,id responseObject))success
           failure:(void (^)(NSURLResponse *response,NSError *error))failure{
    NSDictionary *parameters = @{@"login_email": login_email,
                                 @"login_password" :login_password,
                                 @"format":@"json"};
    [[APIManager sharedManager] POST:INTERFACE_URI_USER_DETAIL parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

@end
