//
//  NetWork+Login.h
//  网络请求1
//
//  Created by rimi on 15-1-21.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import "NetWork.h"

@interface NetWork (Login)
/**登录请求*/
+ (void)sendLoginRequestWithUserName:(NSString *)userName passWord:(NSString*)passWord callback:(Callback)callback;

/**时间轴请求*/
+ (void)sendTimerRequestCallback:(Callback)callback;

/**内部人脉请求*/
+ (void)sendInContractRequestCallback:(Callback)callback;

/**外部人脉*/
+ (void)sendOutContractRequestCallback:(Callback)callback;

@end
