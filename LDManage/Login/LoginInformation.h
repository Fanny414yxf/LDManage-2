//
//  LoginInformation.h
//  LDManage
//
//  Created by rimi on 15-1-21.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginInformation : NSObject

@property (nonatomic,assign)BOOL isLogin;
@property (nonatomic,assign)NSInteger flag;


+ (LoginInformation *)shearLoginInformation;

@end
