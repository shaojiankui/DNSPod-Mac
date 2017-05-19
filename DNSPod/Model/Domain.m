//
//  Domain.m
//  DNSPod
//
//  Created by www.skyfox.org on 2017/5/19.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import "Domain.h"

@implementation Domain

#pragma mark 添加新域名
+(NSURLSessionDataTask*)DomainCreate:(NSString *)domain
                             success:(void (^)(NSURLResponse *response,id responseObject))success
                             failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    return [[APIManager sharedManager] POST:@"Domain.Create" parameters:@{@"domain":domain?:[NSNull null]} success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}
#pragma mark 添加新域名 + 指定域名分组
+(NSURLSessionDataTask*) DomainCreate:(NSString *)domain
                             group_id:(NSString *)group_id
                              success:(void (^)(NSURLResponse *response,id responseObject))success
                              failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    return [[APIManager sharedManager] POST:@"Domain.Create" parameters:@{@"domain":domain?:[NSNull null],@"group_id":group_id?:[NSNull null]} success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 添加新域名 + 指定域名分组 + 是否星标域名
+(NSURLSessionDataTask*) DomainCreate:(NSString *)domain
                             group_id:(NSString *)group_id
                              is_mark:(NSString *)is_mark
                              success:(void (^)(NSURLResponse *response,id responseObject))success
                              failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    
    return [[APIManager sharedManager] POST:@"Domain.Create" parameters:@{@"domain":domain?:[NSNull null],@"group_id":group_id?:[NSNull null],@"is_mark":is_mark?:[NSNull null]} success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 获取域名列表
+(NSURLSessionDataTask*) DomainList:(id)type
                             offset:(id)offset
                             length:(id)length
                           group_id:(id)group_id
                            keyword:(id)keyword
                            success:(void (^)(NSURLResponse *response,id responseObject))success
                            failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    
    NSDictionary *parameters = @{@"types":type?:[NSNull null],@"offset":offset?:[NSNull null],@"length":length?:[NSNull null],@"group_id":group_id?:[NSNull null],@"keyword":keyword?:[NSNull null]};
    return [[APIManager sharedManager] POST:@"Domain.List" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 删除域名
+(NSURLSessionDataTask*) DomainRemove:(id)domain_id
                               domain:(id)domain
                              success:(void (^)(NSURLResponse *response,id responseObject))success
                              failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"domain_id":domain_id,@"domain":domain};
    return [[APIManager sharedManager] POST:@"Domain.Remove" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 设置域名状态
+(NSURLSessionDataTask*) DomainStatus:(id)domain_id
                               domain:(id)domain
                               status:(id)status
                              success:(void (^)(NSURLResponse *response,id responseObject))success
                              failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"domain_id":domain_id,@"domain":domain,@"status":status};
    return [[APIManager sharedManager] POST:@"Domain.Status" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 获取域名信息
+(NSURLSessionDataTask*) DomainInfo:(id)domain_id
                             domain:(id)domain
                            success:(void (^)(NSURLResponse *response,id responseObject))success
                            failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"domain_id":domain_id,@"domain":domain};
    return [[APIManager sharedManager] POST:@"Domain.Info" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 获取域名日志
+(NSURLSessionDataTask*) DomainLog:(id)domain_id
                            domain:(id)domain
                            offset:(id)offset
                            length:(id)length
                           success:(void (^)(NSURLResponse *response,id responseObject))success
                           failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"domain_id":domain_id,@"domain":domain,@"offset":offset,@"length":length};
    return [[APIManager sharedManager] POST:@"Domain.Log" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 设置搜索引擎推送
+(NSURLSessionDataTask*) DomainSearchenginepush:(id)domain_id
                                         domain:(id)domain
                                         status:(id)status
                                        success:(void (^)(NSURLResponse *response,id responseObject))success
                                        failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"domain_id":domain_id,@"domain":domain,@"status":status};
    return [[APIManager sharedManager] POST:@"Domain.Searchenginepush" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 添加域名共享
+(NSURLSessionDataTask*) DomainshareCreate:(id)domain_id
                                    domain:(id)domain
                                     email:(id)email
                                      mode:(id)mode
                                sub_domain:(id)sub_domain
                                   success:(void (^)(NSURLResponse *response,id responseObject))success
                                   failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    
    NSDictionary *parameters = @{@"domain_id":domain_id,@"domain":domain,@"mode":mode,@"sub_domain":sub_domain};
    return [[APIManager sharedManager] POST:@"Domainshare.Create" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 域名共享列表
+(NSURLSessionDataTask*) DomainshareList:(id)domain_id
                                  domain:(id)domain
                                 success:(void (^)(NSURLResponse *response,id responseObject))success
                                 failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"domain_id":domain_id,@"domain":domain};
    return [[APIManager sharedManager] POST:@"Domainshare.List" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 修改域名共享
+(NSURLSessionDataTask*) DomainshareModify:(id)domain_id
                                    domain:(id)domain
                                     email:(id)email
                                      mode:(id)mode
                            old_sub_domain:(id)old_sub_domain
                            new_sub_domain:(id)new_sub_domain
                                   success:(void (^)(NSURLResponse *response,id responseObject))success
                                   failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    
    NSDictionary *parameters = @{@"domain_id":domain_id,@"domain":domain,@"email":email,@"mode":mode,@"old_sub_domain":old_sub_domain,@"new_sub_domain":new_sub_domain};
    return [[APIManager sharedManager] POST:@"Domainshare.Modify" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 删除域名共享
+(NSURLSessionDataTask*) DomainshareRemove:(id)domain_id
                                    domain:(id)domain
                                     email:(id)email
                                   success:(void (^)(NSURLResponse *response,id responseObject))success
                                   failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"domain_id":domain_id,@"domain":domain,@"email":email};
    return [[APIManager sharedManager] POST:@"Domainshare.Remove" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 域名过户
+(NSURLSessionDataTask*) DomainTransfer:(id)domain_id
                                 domain:(id)domain
                                  email:(id)email
                                success:(void (^)(NSURLResponse *response,id responseObject))success
                                failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"domain_id":domain_id,@"domain":domain,@"email":email};
    return [[APIManager sharedManager] POST:@"Domain.Transfer" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 锁定域名
+(NSURLSessionDataTask*) DomainLock:(id)domain_id
                             domain:(id)domain
                               days:(id)days
                            success:(void (^)(NSURLResponse *response,id responseObject))success
                            failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"domain_id":domain_id,@"domain":domain,@"days":days};
    return [[APIManager sharedManager] POST:@"Domain.Lock" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 锁定状态
+(NSURLSessionDataTask*) DomainLockstatus:(id)domain_id
                                   domain:(id)domain
                                  success:(void (^)(NSURLResponse *response,id responseObject))success
                                  failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"domain_id":domain_id,@"domain":domain};
    return [[APIManager sharedManager] POST:@"Domain.Lockstatus" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 锁定解锁
+(NSURLSessionDataTask*) DomainUnlock:(id)domain_id
                               domain:(id)domain
                            lock_code:(id)lock_code
                              success:(void (^)(NSURLResponse *response,id responseObject))success
                              failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"domain_id":domain_id,@"domain":domain,@"lock_code":lock_code};
    return [[APIManager sharedManager] POST:@"Domain.Unlock" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 域名绑定列表
+(NSURLSessionDataTask*) DomainaliasList:(id)domain_id
                                  domain:(id)domain
                                 success:(void (^)(NSURLResponse *response,id responseObject))success
                                 failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"domain_id":domain_id,@"domain":domain};
    return [[APIManager sharedManager] POST:@"Domainalias.List" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 添加域名绑定
+(NSURLSessionDataTask*) DomainaliasCreate:(id)domain_id
                                    domain:(id)domain
                                   success:(void (^)(NSURLResponse *response,id responseObject))success
                                   failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"domain_id":domain_id,@"domain":domain};
    return [[APIManager sharedManager] POST:@"Domainalias.Create" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 删除域名绑定
+(NSURLSessionDataTask*) DomainaliasRemove:(id)domain_id
                                    domain:(id)domain
                                  alias_id:(id)alias_id
                                   success:(void (^)(NSURLResponse *response,id responseObject))success
                                   failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"domain_id":domain_id,@"domain":domain,@"alias_id":alias_id};
    return [[APIManager sharedManager] POST:@"Domainalias.Remove" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}
#pragma mark - 分组(vip)
#pragma mark 获取域名分组
+(NSURLSessionDataTask*) DomaingroupList:(void (^)(NSURLResponse *response,id responseObject))success
                                 failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    return [[APIManager sharedManager] POST:@"Domaingroup.List" parameters:nil success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 添加域名分组
+(NSURLSessionDataTask*) DomaingroupCreate:(id)group_name
                                   success:(void (^)(NSURLResponse *response,id responseObject))success
                                   failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"group_name":group_name};
    return [[APIManager sharedManager] POST:@"Domaingroup.Create" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 修改域名分组
+(NSURLSessionDataTask*) DomaingroupModify:(id)group_id
                                group_name:(id)group_name
                                   success:(void (^)(NSURLResponse *response,id responseObject))success
                                   failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"group_id":group_id,@"group_name":group_name};
    return [[APIManager sharedManager] POST:@"Domaingroup.Create" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 删除域名分组
+(NSURLSessionDataTask*) DomaingroupRemove:(id)group_id
                                   success:(void (^)(NSURLResponse *response,id responseObject))success
                                   failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"group_id":group_id};
    return [[APIManager sharedManager] POST:@"Domaingroup.Remove" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 设置域名分组
+(NSURLSessionDataTask*) DomainChangegroup:(id)domain_id
                                    domain:(id)domain
                                  group_id:(id)group_id
                                   success:(void (^)(NSURLResponse *response,id responseObject))success
                                   failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"domain_id":domain_id,@"domain":domain,@"group_id":group_id};
    return [[APIManager sharedManager] POST:@"Domain.Changegroup" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark - 设置域名标记及其他
#pragma mark 设置域名星标
+(NSURLSessionDataTask*) DomainIsmark:(id)domain_id
                               domain:(id)domain
                              is_mark:(id)is_mark
                              success:(void (^)(NSURLResponse *response,id responseObject))success
                              failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"domain_id":domain_id,@"domain":domain,@"is_mark":is_mark};
    return [[APIManager sharedManager] POST:@"Domain.Ismark" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 设置域名备注
+(NSURLSessionDataTask*) DomainRemark:(id)domain_id
                               domain:(id)domain
                               remark:(id)remark
                              success:(void (^)(NSURLResponse *response,id responseObject))success
                              failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"domain_id":domain_id,@"domain":domain,@"remark":remark};
    return [[APIManager sharedManager] POST:@"Domain.Remark" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 获取域名权限
+(NSURLSessionDataTask*) DomainPurview:(id)domain_id
                                domain:(id)domain
                               success:(void (^)(NSURLResponse *response,id responseObject))success
                               failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"domain_id":domain_id,@"domain":domain};
    return [[APIManager sharedManager] POST:@"Domain.Purview" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 域名取回获取邮箱列表
+(NSURLSessionDataTask*) DomainAcquire:(id)domain
                               success:(void (^)(NSURLResponse *response,id responseObject))success
                               failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"domain":domain};
    return [[APIManager sharedManager] POST:@"Domain.Acquire" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 域名取回发送验证码
+(NSURLSessionDataTask*) DomainAcquiresend:(id)domain
                                     email:(id)email
                                   success:(void (^)(NSURLResponse *response,id responseObject))success
                                   failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"email":email,@"domain":domain};
    return [[APIManager sharedManager] POST:@"Domain.Acquiresend" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 验证域名取回的验证码
+(NSURLSessionDataTask*) DomainAcquirevalidate:(id)domain
                                         email:(id)email
                                          code:(id)code
                                       success:(void (^)(NSURLResponse *response,id responseObject))success
                                       failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"email":email,@"domain":domain,@"code":code};
    return [[APIManager sharedManager] POST:@"Domain.Acquirevalidate" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 获取等级允许的记录类型
+(NSURLSessionDataTask*) RecordType:(id)domain_grade
                            success:(void (^)(NSURLResponse *response,id responseObject))success
                            failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"domain_grade":domain_grade};
    return [[APIManager sharedManager] POST:@"Record.Type" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 获取等级允许的线路线路
+(NSURLSessionDataTask*) RecordLine:(id)domain_id
                             domain:(id)domain
                       domain_grade:(id)domain_grade
                            success:(void (^)(NSURLResponse *response,id responseObject))success
                            failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"domain_id":domain_id,@"domain":domain,@"domain_grade":domain_grade};
    return [[APIManager sharedManager] POST:@"Record.Line" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}


@end
