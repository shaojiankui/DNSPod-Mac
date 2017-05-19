//
//  Monitor.m
//  DNSPod
//
//  Created by www.skyfox.org on 2017/5/19.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import "Monitor.h"

@implementation Monitor
#pragma mark 列出包含A记录的子域名
+ (NSURLSessionDataTask*)MonitorListsubdomain:(id)domain
                                    domain_id:(id)domain_id
                                      success:(void (^)(NSURLResponse *response,id responseObject))success
                                      failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"domain_id":domain_id,@"domain":domain};
    return [[APIManager sharedManager] POST:@"Monitor.Listsubdomain" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 列出子域名的A记录
+ (NSURLSessionDataTask*)MonitorListsubvalue:(id)domain
                                   domain_id:(id)domain_id
                                   subdomain:(id)subdomain
                                     success:(void (^)(NSURLResponse *response,id responseObject))success
                                     failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    
    NSDictionary *parameters = @{@"domain_id":domain_id,@"domain":domain,@"subdomain":subdomain};
    return [[APIManager sharedManager] POST:@"Monitor.Listsubdomain" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 监控列表
+ (NSURLSessionDataTask*)MonitorList:(id)domain_id
                             success:(void (^)(NSURLResponse *response,id responseObject))success
                             failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"domain_id":domain_id};
    return [[APIManager sharedManager] POST:@"Monitor.List" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 监控添加
+ (NSURLSessionDataTask*)MonitorCreate:(id)domain_id
                             record_id:(id)record_id
                                  port:(id)port
                      monitor_interval:(id)monitor_interval
                                  host:(id)host
                          monitor_type:(id)monitor_type
                                points:(id)points
                                bak_ip:(id)bak_ip
                              keep_ttl:(id)keep_ttl
                            sms_notice:(id)sms_notice
                          email_notice:(id)email_notice
                           less_notice:(id)less_notice
                          callback_url:(id)callback_url
                          callback_key:(id)callback_key
                               success:(void (^)(NSURLResponse *response,id responseObject))success
                               failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    
    NSDictionary *parameters = @{@"domain_id":domain_id,@"record_id":record_id,@"port":port,@"monitor_interval":monitor_interval,@"host":host,@"monitor_type":monitor_type,@"points":points,@"bak_ip":bak_ip,@"keep_ttl":keep_ttl,@"sms_notice":sms_notice,@"email_notice":email_notice,@"less_notice":less_notice,@"callback_url":callback_url,@"callback_key":callback_key};
    return [[APIManager sharedManager] POST:@"Monitor.Create" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 监控修改
+ (NSURLSessionDataTask*)MonitorModify:(id)monitor_id
                                  port:(id)port
                      monitor_interval:(id)monitor_interval
                          monitor_type:(id)monitor_type
                          monitor_path:(id)monitor_path
                                points:(id)points
                                bak_ip:(id)bak_ip
                                  host:(id)host
                              keep_ttl:(id)keep_ttl
                            sms_notice:(id)sms_notice
                          email_notice:(id)email_notice
                           less_notice:(id)less_notice
                          callback_url:(id)callback_url
                          callback_key:(id)callback_key
                               success:(void (^)(NSURLResponse *response,id responseObject))success
                               failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"monitor_id":monitor_id,@"port":port,@"port":port,@"monitor_interval":monitor_interval,@"monitor_type":monitor_type,@"monitor_type":monitor_type,@"monitor_path":monitor_path,@"points":points,@"bak_ip":bak_ip,@"host":host,@"keep_ttl":keep_ttl,@"sms_notice":sms_notice,@"email_notice":email_notice,@"less_notice":less_notice,@"callback_url":callback_url,@"callback_key":callback_key};
    return [[APIManager sharedManager] POST:@"Monitor.Modify" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 监控删除
+ (NSURLSessionDataTask*)MonitorRemove:(id)monitor_id
                               success:(void (^)(NSURLResponse *response,id responseObject))success
                               failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"monitor_id":monitor_id};
    return [[APIManager sharedManager] POST:@"Monitor.Remove" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 获取监控信息
+ (NSURLSessionDataTask*)MonitorInfo:(id)monitor_id
                             success:(void (^)(NSURLResponse *response,id responseObject))success
                             failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"monitor_id":monitor_id};
    return [[APIManager sharedManager] POST:@"Monitor.Info" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 设置监控状态
+ (NSURLSessionDataTask*)MonitorSetstatus:(id)monitor_id
                                   status:(id)status
                                  success:(void (^)(NSURLResponse *response,id responseObject))success
                                  failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"monitor_id":monitor_id,@"status":status};
    return [[APIManager sharedManager] POST:@"Monitor.Setstatus" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 获取监控历史
+ (NSURLSessionDataTask*)MonitorGethistory:(id)monitor_id
                                     hours:(id)hours
                                   success:(void (^)(NSURLResponse *response,id responseObject))success
                                   failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"monitor_id":monitor_id,@"hours":hours};
    return [[APIManager sharedManager] POST:@"Monitor.Gethistory" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 获取监控概况
+ (NSURLSessionDataTask*)MonitorUserdesc:(void (^)(NSURLResponse *response,id responseObject))success
                                 failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    return [[APIManager sharedManager] POST:@"Monitor.Userdesc" parameters:nil success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 获取监控概况
+ (NSURLSessionDataTask*)MonitorGetdowns:(id)offset
                                  length:(id)length
                                 success:(void (^)(NSURLResponse *response,id responseObject))success
                                 failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"offset":offset,@"length":length};
    return [[APIManager sharedManager] POST:@"Monitor.Getdowns" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

@end
