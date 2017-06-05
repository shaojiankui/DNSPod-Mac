//
//  Record.m
//  DNSPod
//
//  Created by www.skyfox.org on 2017/5/19.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import "Record.h"
#import "DataManager.h"
#import "LogWriter.h"
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
    NSDictionary *parameters = @{@"domain_id":domain_id,@"sub_domain":sub_domain?:[NSNull null],@"value":value?:[NSNull null],@"record_type":record_type?:[NSNull null],@"record_line":record_line?:[NSNull null],@"mx":mx?:[NSNull null],@"ttl":ttl?:[NSNull null]};
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
    NSDictionary *parameters = @{@"domain_id":domain_id?:[NSNull null],@"record_id":record_id?:[NSNull null]};
    return [[APIManager sharedManager] POST:@"Record.Remove" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}


#pragma mark 更新动态DNS记录
//domain_id 或 domain, 分别对应域名ID和域名, 提交其中一个即可
//record_id 记录ID，必选
//sub_domain 主机记录, 如 www，可选，如果不传，默认为 @
//record_type 记录类型，通过API记录类型获得，大写英文，比如：A，必选
//record_line 记录线路，通过API记录线路获得，中文，比如：默认，必选
//record_line_id 线路的ID，通过API记录线路获得，英文字符串，比如：‘10=1’ 【record_line 和 record_line_id 二者传其一即可，系统优先取 record_line_id】
//value 记录值, 如 IP:200.200.200.200, CNAME: cname.dnspod.com., MX: mail.dnspod.com.，必选
//mx {1-20} MX优先级, 当记录类型是 MX 时有效，范围1-20, mx记录必选
//ttl {1-604800} TTL，范围1-604800，不同等级域名最小值不同，可选
//status [“enable”, “disable”]，记录状态，默认为”enable”，如果传入”disable”，解析不会生效，也不会验证负载均衡的限制，可选
//weight 权重信息，0到100的整数，可选。仅企业 VIP 域名可用，0 表示关闭，留空或者不传该参数，表示不设置权重信息
+ (NSURLSessionDataTask*)RecordDdns:(id)domain_id
         record_id:(id)record_id
        sub_domain:(id)sub_domain
       record_line:(id)record_line
    record_line_id:(id)record_line_id
             value:(id)value
           success:(void (^)(NSURLResponse *response,id responseObject))success
           failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    NSDictionary *parameters = @{@"domain_id":domain_id?:[NSNull null],@"record_id":record_id?:[NSNull null],@"sub_domain":sub_domain?:[NSNull null],@"record_line":record_line?:[NSNull null],@"record_line_id":record_line_id?:[NSNull null],@"value":value?:[NSNull null],@"ttl":@"10"};
    
//    NSString *okip = [[responseObject jk_dictionaryForKey:@"record"] jk_stringForKey:@"value"];
    
    //如果1小时之内，提交了超过5次没有任何变动的记录修改请求，该记录会被系统锁定1小时，不允许再次修改，所以在开发和测试的过程中，请自行处理IP变动，仅在本地IP发生变动的情况下才调用本接口。
    NSMutableDictionary *ddnsList = [DataManager ddnsList] ?: [NSMutableDictionary dictionary];
    

    
    NSMutableDictionary *domainRecord = [[ddnsList jk_dictionaryForKey:record_id?:@""] mutableCopy];
    if ([[domainRecord objectForKey:@"value"] isEqualToString:value]) {
        NSLog(@"IP无改动,跳过DDNS更新");
        return nil;
    }
    return [[APIManager sharedManager] POST:@"Record.Ddns" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        [ddnsList setObject:parameters forKey:record_id?:@"noid"];
        [DataManager saveDdnsList:ddnsList];

        [LogWriter writeLog:[NSString stringWithFormat:@"域名:%@IP变更为:%@",sub_domain?:@"",[responseObject jk_stringForKey:@"ip"]?:@""] type:@"get ip"];

        
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
    NSDictionary *parameters = @{@"domain_id":domain_id?:[NSNull null],@"record_id":record_id?:[NSNull null],@"remark":remark?:[NSNull null]};
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
    NSDictionary *parameters = @{@"domain_id":domain_id?:[NSNull null],@"record_id":record_id?:[NSNull null]};
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
    NSDictionary *parameters = @{@"domain_id":domain_id?:[NSNull null],@"record_id":record_id?:[NSNull null],@"status":status?:[NSNull null]};
    return [[APIManager sharedManager] POST:@"Record.Status" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
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
    NSDictionary *parameters = @{@"domain_grade":domain_grade?:[NSNull null]};
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
    NSDictionary *parameters = @{@"domain_id":domain_id?:[NSNull null],@"domain":domain?:[NSNull null],@"domain_grade":domain_grade?:[NSNull null]};
    return [[APIManager sharedManager] POST:@"Record.Line" parameters:parameters success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}

@end
