//
//  Record.m
//  DNSPod
//
//  Created by www.skyfox.org on 2017/5/19.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import "Record.h"

@implementation Record
#pragma mark 添加记录
+ (NSURLSessionDataTask*)RecordCreate:(id)domain_id
          sub_domain:(id)sub_domain
               value:(id)value
         record_type:(id)record_type
         record_line:(id)record_line
                  mx:(id)mx
                 ttl:(id)ttl
             success:(void (^)(NSURLResponse *response,id responseObject))success
             failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"domain_id":domain_id,@"sub_domain":sub_domain,@"value":value,@"record_type":record_type,@"record_line":record_line,@"mx":mx,@"ttl":ttl};
    return [[APIManager sharedManager] POST:@"Record.Create" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

+ (NSURLSessionDataTask*)RecordList:(id)domain_id
            offset:(id)offset
            length:(id)length
        sub_domain:(id)sub_domain
           keyword:(id)keyword
           success:(void (^)(NSURLResponse *response,id responseObject))success
           failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"domain_id":domain_id?:[NSNull null],@"offset":offset?:[NSNull null],@"length":length?:[NSNull null],@"sub_domain":sub_domain?:[NSNull null],@"keyword":keyword?:[NSNull null]};
    return [[APIManager sharedManager] POST:@"Record.List" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 修改记录
+ (NSURLSessionDataTask*)RecordModify:(id)domain_id
           record_id:(id)record_id
          sub_domain:(id)sub_domain
         record_type:(id)record_type
         record_line:(id)record_line
               value:(id)value
                  mx:(id)mx
                 ttl:(id)ttl
             success:(void (^)(NSURLResponse *response,id responseObject))success
             failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"domain_id":domain_id,@"record_id":record_id,@"sub_domain":sub_domain,@"record_type":record_type,@"record_line":record_line,@"value":value,@"mx":mx,@"ttl":ttl};
    return [[APIManager sharedManager] POST:@"Record.Modify" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 删除记录
+ (NSURLSessionDataTask*)RecordRemove:(id)domain_id
           record_id:(id)record_id
             success:(void (^)(NSURLResponse *response,id responseObject))success
             failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"domain_id":domain_id,@"record_id":record_id};
    return [[APIManager sharedManager] POST:@"Record.Remove" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}


#pragma mark 更新动态DNS记录
+ (NSURLSessionDataTask*)RecordDdns:(id)domain_id
         record_id:(id)record_id
        sub_domain:(id)sub_domain
       record_line:(id)record_line
             value:(id)value
           success:(void (^)(NSURLResponse *response,id responseObject))success
           failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"domain_id":domain_id,@"record_id":record_id,@"sub_domain":sub_domain,@"record_line":record_line,@"value":value};
    return [[APIManager sharedManager] POST:@"Record.Ddns" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 设置记录备注
+ (NSURLSessionDataTask*)RecordRemark:(id)domain_id
           record_id:(id)record_id
              remark:(id)remark
             success:(void (^)(NSURLResponse *response,id responseObject))success
             failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"domain_id":domain_id,@"record_id":record_id,@"remark":remark};
    return [[APIManager sharedManager] POST:@"Record.Remark" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 获取记录信息
+ (NSURLSessionDataTask*)RecordInfo:(id)domain_id
         record_id:(id)record_id
           success:(void (^)(NSURLResponse *response,id responseObject))success
           failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"domain_id":domain_id,@"record_id":record_id};
    return [[APIManager sharedManager] POST:@"Record.Info" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

#pragma mark 设置记录状态
+ (NSURLSessionDataTask*)RecordStatus:(id)domain_id
           record_id:(id)record_id
              status:(id)status
             success:(void (^)(NSURLResponse *response,id responseObject))success
             failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"domain_id":domain_id,@"record_id":record_id,@"status":status};
    return [[APIManager sharedManager] POST:@"Record.Status" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

@end
