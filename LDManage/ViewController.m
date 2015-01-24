//
//  ViewController.m
//  LDManage
//
//  Created by rimi on 15-1-20.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import "ViewController.h"

#import "ViewController.h"
#import "TabBarView.h"
#import "MyContractViewController.h"
#import "AddViewController.h"
#import "MayViewController.h"
#import "AboutViewController.h"
#import "ContractViewController.h"

#import "LoginViewController.h"
#import "LoginInformation.h"

#define LEFTVIEW_WIDTH SCREEN_WIDTH - 50 * PROPORTANT
@interface ViewController () <TabBarViewDelegate>


//为根控制器 ，在非arc
@property (nonatomic, strong)UIView * leftView;//
@property (nonatomic, strong)UIView * centerView;//一直存在
//@property (nonatomic, strong)UIImageView * navcView;
//@property (nonatomic, strong)UIImageView * navcTitleImage;
@property (nonatomic,strong)TabBarView * tabbar;

@property (nonatomic,strong)UINavigationController * curentNave;//

- (void)initView;
@end

@implementation ViewController




- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}
//在什么地方初始化就什么适合加上

- (void)viewDidLoad
{
//    self.view.backgroundColor = [UIColor orangeColor];
    [super viewDidLoad];
    [self     initView];
}

- (void)initView
{
    _leftView = [[UIView alloc]initWithFrame:CGRectMake(-SCREEN_WIDTH + 60, 0, LEFTVIEW_WIDTH , SCREEN_HEIGHT)];
    _leftView.backgroundColor = [UIColor redColor];
    
    _centerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
//    _centerView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:_centerView];
    [self.view addSubview:_leftView];
    
    
    //手势
    UISwipeGestureRecognizer * swipeGestur = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(moveForSwipeGestureRecognizer)];
    [_centerView addGestureRecognizer:swipeGestur];
    
    
    
    //tabBar
    _tabbar = [[TabBarView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - TAB_BAR_HEIGHT, SCREEN_WIDTH, TAB_BAR_TAG_BASE)];
    _tabbar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"底部_02.png"]];
    _tabbar.delegate = self;
    [_centerView addSubview:_tabbar];
    
    
    //接收通知 去干什么
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginSuccess:) name:NOTIFY_LOGIN_SUCCESS object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(logoutSuccess:) name:NOTIFY_LONOUT_SUCCESS object:nil];
    
    
    //发送通知给tabBar 默认选中第0个按钮  @0 对象
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFY_SWITCH_TAB_BAR object:@0];
    
    
    //    [self performSelector:@selector(test) withObject:@"fsd" afterDelay:4];//延时调用NSObject的方法
}

//- (void)test
//{
//    NSLog(@"dfggghdhjjjjjjjjj");
//}


#pragma mark --- <TabBarViewDelegate>

- (void)tabBarDidSelectedWithIndex:(NSInteger)selectedIndex
{
    
    
    //每点击一个按钮 创建一个ViewController 移除之前的ViewController
    if (_curentNave != nil) {
        [_curentNave.view removeFromSuperview];  // 移除navc 同时移除vc
        [_curentNave removeFromParentViewController];
        self.curentNave = nil;
    }
    switch (selectedIndex) {
        case 0:
        {
            MyContractViewController * myVC = [[MyContractViewController alloc]init];// myVC 1
            UINavigationController * myNavc = [[UINavigationController alloc]initWithRootViewController:myVC]; //      VC 2      navc 1
            [self addChildViewController:myNavc];//       VC 2      Navc 2
            [self.centerView addSubview:myNavc.view];//   VC 2      Navc 2
            _curentNave = myNavc;
        }
            break;
        case 1:
        {
            ContractViewController * contactVC = [[ContractViewController alloc] init];
            UINavigationController * contactNavc = [[UINavigationController alloc]initWithRootViewController:contactVC];
            contactNavc.navigationBarHidden = YES;
            [self addChildViewController:contactNavc];
            [self.centerView addSubview:contactNavc.view];
            _curentNave = contactNavc;
            
        }
            break;
        case 2:
        {
            
           MayViewController  * contactVC = [[MayViewController alloc] init];
            UINavigationController * contactNavc = [[UINavigationController alloc]initWithRootViewController:contactVC];
            contactNavc.navigationBarHidden = YES;
            [self addChildViewController:contactNavc];
            [self.centerView addSubview:contactNavc.view];
            _curentNave = contactNavc;
            
        }
            break;
        case 3:
        {
            AddViewController * addVC = [[AddViewController alloc] init];
            UINavigationController * addNavc = [[UINavigationController alloc]initWithRootViewController:addVC];
            addNavc.navigationBarHidden = YES;
            [self addChildViewController:addNavc];
            [self.centerView addSubview:addNavc.view];
            _curentNave = addNavc;
            
        }
            
            break;
        case 4:
        {
            AboutViewController * contactVC = [[AboutViewController alloc] init];
            UINavigationController * contactNavc = [[UINavigationController alloc]initWithRootViewController:contactVC];
            contactNavc.navigationBarHidden = YES;
            [self addChildViewController:contactNavc];
            [self.centerView addSubview:contactNavc.view];
            _curentNave = contactNavc;
            
        }
        default:
            break;
    }
    
    [_centerView bringSubviewToFront:_tabbar];//把tabBar 放在视图最上面
    
}


#pragma mark -- NSNotification
- (void)loginSuccess:(NSNotification *)notification
{
    
    
}

- (void)logoutSuccess:(NSNotification *)notification
{
    
}


//左视图的滑动
- (void)moveForSwipeGestureRecognizer
{
    [UIView animateWithDuration:0.5 animations:^{
        _leftView.center = CGPointMake(_leftView.center.x == SCREEN_WIDTH * 0.4 ? -SCREEN_WIDTH + 50 : SCREEN_WIDTH * 0.4, self.view.center.y);
 
    }];
    
    [UIView animateWithDuration:0.3 animations:^{
        _centerView.center = CGPointMake(_centerView.center.x == self.view.center.x ? self.view.center.x * 2.6 : self.view.center.x, self.view.center.y);
    }];
    
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
   
    
}



- (void)viewDidAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    LoginViewController * loginVC = [[LoginViewController alloc]init];
    if (!([LoginInformation shearLoginInformation].isLogin)) {
        [self presentViewController:loginVC animated:YES completion:nil];
    }
    
}



@end
