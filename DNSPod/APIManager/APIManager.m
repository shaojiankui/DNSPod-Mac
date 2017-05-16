//
//  APIManager.m
//  DNSPod
//
//  Created by skyfox on 2017/5/16.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import "APIManager.h"
#import "Constant.h"

static dispatch_once_t onceToken;
static APIManager *_sharedManager = nil;


@implementation APIManager
+ (instancetype)sharedManager {
    dispatch_once(&onceToken, ^{
        _sharedManager = [[APIManager alloc] init];
    });
    return _sharedManager;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        [configuration setAllowsCellularAccess:YES];
        configuration.timeoutIntervalForRequest = 30.0;
        configuration.timeoutIntervalForResource = 60.0;
        configuration.HTTPMaximumConnectionsPerHost = 1;
//        [configuration setHTTPAdditionalHeaders:@{@"Content-Type": @"application/x-www-form-urlencoded"}];
        [configuration setHTTPAdditionalHeaders:@{@"Accept": @"application/json",@"User-Agent":@"DNSPOD DDNS IOS Client/1.0.1(6077782@qq.com)"}];
 
        self.session = [NSURLSession sessionWithConfiguration:configuration];
        //NSURLSession *session = [NSURLSession sharedSession];
    }
    return self;
}

- (NSData *)sendSynchronousDataTaskWithRequest:(NSURLRequest *)request
                             returningResponse:(NSURLResponse **)returnResponse
                                         error:(NSError **)returnError {
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    __block NSData *data = nil;
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *taskData, NSURLResponse *taskResponse, NSError *taskError) {
        data = taskData;
        if (returnResponse) {
            *returnResponse = taskResponse;
        }
        if (returnError) {
            *returnError = taskError;
        }
        dispatch_semaphore_signal(semaphore);
    }] resume];
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    return data;
}

- (NSURLSessionDataTask *)POST:(NSString *)uri
                    parameters:(id)parameters
                       success:(void (^)(NSURLResponse *response,id responseObject))success
                       failure:(void (^)(NSURLResponse *response,NSError *error))failure{
    NSLog(@"client request uri:\n%@",uri);
    NSLog(@"client request parameters:\n%@",parameters);

    NSURL *requestURL = [[NSURL URLWithString:uri relativeToURL:[NSURL URLWithString:BASEURL]] absoluteURL] ;
    
 
    // Send Request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestURL];
    [request setTimeoutInterval:10.0];
    [request setHTTPMethod:@"POST"];
    
//    NSData *JSONData = [NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:nil];
//    [request setHTTPBody:JSONData];
    
    NSMutableDictionary *muParameters = [parameters mutableCopy];
    [muParameters setObject:@"cn" forKey:@"lang"];
    [muParameters setObject:@"no" forKey:@"error_on_empty"];
    [muParameters setObject:@"json" forKey:@"format"];
//    [muParameters setObject:@"" forKey:@"login_token"];

    NSData *postData = [[self createPostBody:muParameters] dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
    [request setHTTPBody:postData];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];

    
    NSURLSessionDataTask *task = [self.session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"server respone parameters:\n%@",result);
        dispatch_async(dispatch_get_main_queue(), ^{
            if (result)
            {
                success(response, result);
            }
            else
            {
                failure(response, error);
            }
        });
    }];
    
    [task resume];
    return task;
}
- (NSString *)createPostBody:(NSDictionary *)params

{
    NSString *postString=@"";
    for(NSString *key in [params allKeys])
    {
        NSString *value= [params objectForKey:key];
        postString =[postString stringByAppendingFormat:@"%@=%@&",key,value];
    }
    if([postString length] > 1)
    {
        postString=[postString substringToIndex:[postString length]-1];
    }
    return postString;
}
@end
