//
//  Header.h
//  LDManage
//
//  Created by rimi on 15-1-20.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#ifndef LDManage_Header_h
#define LDManage_Header_h



#import "LoginInformation.h"
#import "NetWork+Login.h"
#import "NetWork.h"


#define BASE_URL @"http://125.70.10.34:8119/ggc/api.php"


//获取屏幕大小
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height


//判断当前设备是什么  5 6 6PLUS缩放
#define IPHONE4 SCREEN_HEIGHT == 480
#define IPHONE5 SCREEN_HEIGHT == 568
#define IPHONE6 SCREEN_HEIGHT == 667

//定义比例
#define PROPORTANT SCREEN_WIDTH / 320


//tabBar高度 宽度
#define TAB_BAR_HEIGHT 50
#define TAB_HIGTH  64

//字体大小
#define FONT(fontSize) [UIFont systemFontOfSize:fontSize]
//颜色
#define COLOR(redColor, greenColor, blueColor, alphaColor)[UIColor colorWithRed:255.0 green:255.0 blue:255.0 alpha:alphaColor]

//tag值
#define TAB_BAR_TAG_BASE 1000


//通知

#define NOTIFY_LOGIN_SUCCESS @"NotifyLoginSuccess"
#define NOTIFY_LONOUT_SUCCESS @"NotifyLogoutSuccess"
#define NOTIFY_SWITCH_TAB_BAR @"NotifyTabBar"

#define NOTIFY_TAB_BAR_HIDDEN @"hidden"
#define NOTIFY_TAB_BAR_SHOW @"show"

//图片的内存常驻
#define IMAGE_WITH_NAME(name) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForAuxiliaryExecutable:name]];


#define GET_MyPeopleList  @{@"g":@"ApiGGC",@"m":@"People",@"c":@"getMyPeopleList",@"cookie":@"",@"page_index":@"1"}
#define GET_People        @{@"g":@"ApiGGC",@"m":@"People",@"c":@"getPeople",@"cookie":@"",@"people_id":@"491"}
#define GET_MayKonwPeopleList        @{@"g":@"ApiGGC",@"m":@"People",@"c":@"getMayKnowPeopleList",@"people_id":@"491"}

#define GET_PeopleListOUT  @{@"g":@"ApiGGC",@"m":@"People",@"c":@"getPeopleList",@"cookie":@"",@"page_index":@"1",@"type":@"0"}
#define GET_PeopleListIN  @{@"g":@"ApiGGC",@"m":@"People",@"c":@"getPeopleList",@"cookie":@"",@"page_index":@"1",@"type":@"1"}

//查看我的所有人脉
#define GET_AllMyPeopleList  @{@"g":@"ApiGGC",@"m":@"People",@"c":@"getAllMyPeopleList",@"cookie":@""}

#define GET_TimelineList  @{@"g":@"ApiGGC",@"m":@"Timeline",@"c":@"getTimelineList",@"page_index":@"1"}



#endif
