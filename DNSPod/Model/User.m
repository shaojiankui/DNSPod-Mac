//
//  User.m
//  DNSPod
//
//  Created by skyfox on 2017/5/16.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import "User.h"

@implementation User
#pragma mark DNSPOD API 版本号
+ (NSURLSessionDataTask*)InfoVersion:(void (^)(NSURLResponse *response,id responseObject))success
                             failure:(void (^)(NSURLResponse *response,NSError *error))failure{
    return [[APIManager sharedManager] POST:@"Info.Version" parameters:nil success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}
#pragma mark 获取账户信息
+ (NSURLSessionDataTask*)UserDetail:(NSString*)login_email
                     login_password:(NSString*)login_password
                            success:(void (^)(NSURLResponse *response,id responseObject))success
                            failure:(void (^)(NSURLResponse *response,NSError *error))failure{
    NSDictionary *parameters = @{@"login_email": login_email,
                                 @"login_password" :login_password};
    return [[APIManager sharedManager] POST:@"User.Detail" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}
#pragma mark 修改资料
-(NSURLSessionDataTask*) UserModify:(id)real_name
                               nick:(id)nick
                          telephone:(id)telephone
                                 im:(id)im
                            success:(void (^)(NSURLResponse *response,id responseObject))success
                            failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"real_name": real_name, @"nick" :nick,@"telephone":telephone,@"im":im};
    return [[APIManager sharedManager] POST:@"User.Modify" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 修改密码
-(NSURLSessionDataTask*) UserpasswdModify:(id)old_password
                             new_password:(id)new_password
                                  success:(void (^)(NSURLResponse *response,id responseObject))success
                                  failure:(void (^)(NSURLResponse *response,NSError *error))failure
{

    NSDictionary *parameters = @{@"old_password": old_password, @"new_password" :new_password};
    return [[APIManager sharedManager] POST:@"Userpasswd.Modify" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 修改邮箱
-(NSURLSessionDataTask*) UseremailModify:(id)old_email
                               new_email:(id)new_email
                                password:(id)password
                                 success:(void (^)(NSURLResponse *response,id responseObject))success
                                 failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"old_email": old_email, @"new_email" :new_email,@"password":@"password"};
    return [[APIManager sharedManager] POST:@"Useremail.Modify" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 获取手机验证码
-(NSURLSessionDataTask*) TelephoneverifyCode:(id)telephone
                                     success:(void (^)(NSURLResponse *response,id responseObject))success
                                     failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"telephone":telephone};
    return [[APIManager sharedManager] POST:@"Telephoneverify.Code" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 获取用户日志
-(NSURLSessionDataTask*) UserLog:(void (^)(NSURLResponse *response,id responseObject))success
                         failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
  
    return [[APIManager sharedManager] POST:@"User.Log" parameters:nil success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

@end
