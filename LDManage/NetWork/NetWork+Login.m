//
//  NetWork+Login.m
//  网络请求1
//
//  Created by rimi on 15-1-21.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import "NetWork+Login.h"
#import "NetWork.h"

#define BASE_URL @"http://125.70.10.34:8119/ggc/api.php"

//              给。。。添加  一个叫。。。的
@implementation NetWork (Login)




#pragma mark ---- 登录
/**登录请求*/
+ (void)sendLoginRequestWithUserName:(NSString *)userName passWord:(NSString*)passWord callback:(Callback)callback
{
    
    NSMutableDictionary * parameters = [[NSMutableDictionary alloc]init];
    [parameters setObject:userName forKey:@"user_name"];
    [parameters setObject:passWord forKey:@"password"];
    
    [parameters setObject:@"ApiGGC" forKey:@"g"];
    [parameters setObject:@"Public" forKey:@"m"];
    [parameters setObject:@"login" forKey:@"c"];
    
    [NetWork sendPostRequestWithURL:BASE_URL parameters:parameters callback:callback];//参数不能变callback
    

}

#pragma mark ----- 我的人脉
/**时间轴请求*/
+ (void)sendTimerRequestCallback:(Callback)callback
{
    NSMutableDictionary * parameters = [[NSMutableDictionary alloc] init];
    [parameters setObject:@"ApiGGC" forKey:@"g"];
    [parameters setObject:@"Timeline" forKey:@"m"];
    [parameters setObject:@"getTimelineList" forKey:@"c"];
    [parameters setObject:@"string" forKey:@"cookie"];
    [parameters setObject:@"" forKey:@"people_id"];
    [parameters setObject:@"5" forKey:@"page_index"];
    [parameters setObject:@"5" forKey:@"list_row"];
    
    [NetWork sendPostRequestWithURL:BASE_URL parameters:parameters callback:callback];
    

}



#pragma mark ---- 人脉库
/**人脉库内部请求*/
+ (void)sendInContractRequestCallback:(Callback)callback
{
    NSMutableDictionary * parameters = [[NSMutableDictionary alloc] init];
    [parameters setObject:@"ApiGGC" forKey:@"g"];
    [parameters setObject:@"People" forKey:@"m"];
    [parameters setObject:@"getPeopleList" forKey:@"c"];
    [parameters setObject:@"string" forKey:@"cookie"];
    [parameters setObject:@"4" forKey:@"list_row"];
    [parameters setObject:@"5" forKey:@"page_index"];
    [parameters setObject:@"1" forKey:@"type"];
    
    [NetWork sendPostRequestWithURL:BASE_URL parameters:parameters callback:callback];
    
}
/**外部人脉*/
+ (void)sendOutContractRequestCallback:(Callback)callback
{
    NSMutableDictionary * parameters = [[NSMutableDictionary alloc] init];
    [parameters setObject:@"ApiGGC" forKey:@"g"];
    [parameters setObject:@"People" forKey:@"m"];
    [parameters setObject:@"getPeopleList" forKey:@"c"];
    [parameters setObject:@"string" forKey:@"cookie"];
    [parameters setObject:@"4" forKey:@"list_row"];
    [parameters setObject:@"5" forKey:@"page_index"];
    [parameters setObject:@"0" forKey:@"type"];
    
    [NetWork sendPostRequestWithURL:BASE_URL parameters:parameters callback:callback];
    

}


@end
