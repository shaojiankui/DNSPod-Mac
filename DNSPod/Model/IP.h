//
//  IP.h
//  DNSPod
//
//  Created by www.skyfox.org on 2017/5/23.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import "BaseModel.h"

@interface IP : BaseModel
+ (NSURLSessionDataTask*)whatismyip:(void (^)(NSURLResponse *response,id responseObject))success
                            failure:(void (^)(NSURLResponse *response,NSError *error))failure;
@end
