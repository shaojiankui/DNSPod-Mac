//
//  IP.m
//  DNSPod
//
//  Created by www.skyfox.org on 2017/5/23.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import "IP.h"

@implementation IP
+ (NSURLSessionDataTask*)whatismyip:(void (^)(NSURLResponse *response,id responseObject))success
                            failure:(void (^)(NSURLResponse *response,NSError *error))failure
{
    return [[APIManager sharedManager] POST:@"http://api.skyfox.org/whatismyip.php" parameters:nil success:^(NSURLResponse *response, id responseObject) {
        success(response,responseObject);
    } failure:^(NSURLResponse *response, NSError *error) {
        failure(response,error);
    }];
}
@end
