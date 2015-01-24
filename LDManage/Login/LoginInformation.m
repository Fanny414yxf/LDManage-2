//
//  LoginInformation.m
//  LDManage
//
//  Created by rimi on 15-1-21.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import "LoginInformation.h"

static LoginInformation * login = nil;

@implementation LoginInformation

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.isLogin = NO;
        
    }
    return self;
}

+ (LoginInformation *)shearLoginInformation
{
    
    if (!login) {
        login = [[LoginInformation alloc] init];
    }
    return login;
    
}

//+ (instancetype)allocWithZone:(struct _NSZone *)zone
//{
//    @synchronized(self){
//        if (login == nil) {
//            login = [super allocWithZone:zone];
//            return login;
//        }
//        return nil;
//    }
//}


//- (instancetype)retain
//{
//    return self;
//}


//- (id)copyWithZone:(NSZone *)zone
//{
//    return self;
//}

//- (oneway void)release
//{
//    return self;
//}

//- (NSUInteger)retainCount
//{
//    return NSUIntegerMax;
//}

//- (instancetype)autorelease
//{
//    return self;
//}

@end
