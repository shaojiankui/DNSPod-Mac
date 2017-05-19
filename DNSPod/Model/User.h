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
#pragma mark DNSPOD API 版本号
+ (NSURLSessionDataTask*)InfoVersion:(void (^)(NSURLResponse *response,id responseObject))success
            failure:(void (^)(NSURLResponse *response,NSError *error))failure;

#pragma mark 获取账户信息
+ (NSURLSessionDataTask*)UserDetail:(NSString*)login_email
                     login_password:(NSString*)login_password
                            success:(void (^)(NSURLResponse *response,id responseObject))success
                            failure:(void (^)(NSURLResponse *response,NSError *error))failure;
#pragma mark 修改资料
-(NSURLSessionDataTask*) UserModify:(id)real_name
              nick:(id)nick
         telephone:(id)telephone
                im:(id)im
           success:(void (^)(NSURLResponse *response,id responseObject))success
           failure:(void (^)(NSURLResponse *response,NSError *error))failure;

#pragma mark 修改密码
-(NSURLSessionDataTask*) UserpasswdModify:(id)old_password
            new_password:(id)new_password
                 success:(void (^)(NSURLResponse *response,id responseObject))success
                 failure:(void (^)(NSURLResponse *response,NSError *error))failure;

#pragma mark 修改邮箱
-(NSURLSessionDataTask*) UseremailModify:(id)old_email
              new_email:(id)new_email
               password:(id)password
                success:(void (^)(NSURLResponse *response,id responseObject))success
                failure:(void (^)(NSURLResponse *response,NSError *error))failure;

#pragma mark 获取手机验证码
-(NSURLSessionDataTask*) TelephoneverifyCode:(id)telephone
                    success:(void (^)(NSURLResponse *response,id responseObject))success
                    failure:(void (^)(NSURLResponse *response,NSError *error))failure;
#pragma mark 获取用户日志
-(NSURLSessionDataTask*) UserLog:(void (^)(NSURLResponse *response,id responseObject))success
        failure:(void (^)(NSURLResponse *response,NSError *error))failure;
@end
