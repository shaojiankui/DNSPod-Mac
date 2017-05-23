//
//  Record.h
//  DNSPod
//
//  Created by www.skyfox.org on 2017/5/19.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import "BaseModel.h"

@interface Record : BaseModel
#pragma mark 添加记录
+ (NSURLSessionDataTask*)RecordCreate:(id)domain_id
          sub_domain:(id)sub_domain
               value:(id)value
         record_type:(id)record_type
         record_line:(id)record_line
                  mx:(id)mx
                 ttl:(id)ttl
             success:(void (^)(NSURLResponse *response,id responseObject))success
             failure:(void (^)(NSURLResponse *response,NSError *error))failure;

#pragma mark 记录列表
+ (NSURLSessionDataTask*)RecordList:(id)domain_id
            offset:(id)offset
            length:(id)length
        sub_domain:(id)sub_domain
           keyword:(id)keyword
           success:(void (^)(NSURLResponse *response,id responseObject))success
           failure:(void (^)(NSURLResponse *response,NSError *error))failure;

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
             failure:(void (^)(NSURLResponse *response,NSError *error))failure;

#pragma mark 删除记录
+ (NSURLSessionDataTask*)RecordRemove:(id)domain_id
           record_id:(id)record_id
             success:(void (^)(NSURLResponse *response,id responseObject))success
             failure:(void (^)(NSURLResponse *response,NSError *error))failure;

#pragma mark 更新动态DNS记录
+ (NSURLSessionDataTask*)RecordDdns:(id)domain_id
                          record_id:(id)record_id
                         sub_domain:(id)sub_domain
                        record_line:(id)record_line
                     record_line_id:(id)record_line_id
                              value:(id)value
                            success:(void (^)(NSURLResponse *response,id responseObject))success
                            failure:(void (^)(NSURLResponse *response,NSError *error))failure;

#pragma mark 设置记录备注
+ (NSURLSessionDataTask*)RecordRemark:(id)domain_id
           record_id:(id)record_id
              remark:(id)remark
             success:(void (^)(NSURLResponse *response,id responseObject))success
             failure:(void (^)(NSURLResponse *response,NSError *error))failure;

#pragma mark 获取记录信息
+ (NSURLSessionDataTask*)RecordInfo:(id)domain_id
         record_id:(id)record_id
           success:(void (^)(NSURLResponse *response,id responseObject))success
           failure:(void (^)(NSURLResponse *response,NSError *error))failure;

#pragma mark 设置记录状态
+ (NSURLSessionDataTask*)RecordStatus:(id)domain_id
           record_id:(id)record_id
              status:(id)status
             success:(void (^)(NSURLResponse *response,id responseObject))success
             failure:(void (^)(NSURLResponse *response,NSError *error))failure;

#pragma mark 获取等级允许的记录类型
+(NSURLSessionDataTask*) RecordType:(id)domain_grade
                            success:(void (^)(NSURLResponse *response,id responseObject))success
                            failure:(void (^)(NSURLResponse *response,NSError *error))failure;

#pragma mark 获取等级允许的线路线路
+(NSURLSessionDataTask*) RecordLine:(id)domain_id
                             domain:(id)domain
                       domain_grade:(id)domain_grade
                            success:(void (^)(NSURLResponse *response,id responseObject))success
                            failure:(void (^)(NSURLResponse *response,NSError *error))failure;
@end
