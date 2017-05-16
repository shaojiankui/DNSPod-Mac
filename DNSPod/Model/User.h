//
//  User.h
//  DNSPod
//
//  Created by skyfox on 2017/5/16.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
@interface User : BaseModel

#pragma mark 获取账户信息
+ (void)UserDetail:(NSString*)login_email
    login_password:(NSString*)login_password
           success:(void (^)(NSURLResponse *response,id responseObject))success
           failure:(void (^)(NSURLResponse *response,NSError *error))failure;
+ (void)autoLogin;
@end
