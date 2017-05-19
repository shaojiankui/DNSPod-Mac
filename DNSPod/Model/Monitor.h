//
//  Monitor.h
//  DNSPod
//
//  Created by www.skyfox.org on 2017/5/19.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import "BaseModel.h"

@interface Monitor : BaseModel
#pragma mark 列出包含A记录的子域名
+ (NSURLSessionDataTask*)MonitorListsubdomain:(id)domain
                   domain_id:(id)domain_id
                     success:(void (^)(NSURLResponse *response,id responseObject))success
                     failure:(void (^)(NSURLResponse *response,NSError *error))failure;

#pragma mark 列出子域名的A记录
+ (NSURLSessionDataTask*)MonitorListsubvalue:(id)domain
                  domain_id:(id)domain_id
                  subdomain:(id)subdomain
                    success:(void (^)(NSURLResponse *response,id responseObject))success
                    failure:(void (^)(NSURLResponse *response,NSError *error))failure;

#pragma mark 监控列表
+ (NSURLSessionDataTask*)MonitorList:(id)domain_id
            success:(void (^)(NSURLResponse *response,id responseObject))success
            failure:(void (^)(NSURLResponse *response,NSError *error))failure;

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
              failure:(void (^)(NSURLResponse *response,NSError *error))failure;

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
              failure:(void (^)(NSURLResponse *response,NSError *error))failure;

#pragma mark 获取监控信息
+ (NSURLSessionDataTask*)MonitorInfo:(id)monitor_id
            success:(void (^)(NSURLResponse *response,id responseObject))success
            failure:(void (^)(NSURLResponse *response,NSError *error))failure;

#pragma mark 设置监控状态
+ (NSURLSessionDataTask*)MonitorSetstatus:(id)monitor_id
                  status:(id)status
                 success:(void (^)(NSURLResponse *response,id responseObject))success
                 failure:(void (^)(NSURLResponse *response,NSError *error))failure;

#pragma mark 获取监控历史
+ (NSURLSessionDataTask*)MonitorGethistory:(id)monitor_id
                    hours:(id)hours
                  success:(void (^)(NSURLResponse *response,id responseObject))success
                  failure:(void (^)(NSURLResponse *response,NSError *error))failure;

#pragma mark 获取监控概况
+ (NSURLSessionDataTask*)MonitorUserdesc:(void (^)(NSURLResponse *response,id responseObject))success
                failure:(void (^)(NSURLResponse *response,NSError *error))failure;

@end
