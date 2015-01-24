//
//  BackBaseViewController.m
//  LDManage
//
//  Created by rimi on 15-1-20.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import "BackBaseViewController.h"

@interface BackBaseViewController ()

@end

@implementation BackBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialzeNaigationBar];
}


- (void)initialzeNaigationBar
{
    UIButton * backButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 69, 40)];
    [backButton setImage:[UIImage imageNamed:@"非常重要_03.png"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //UIBarButtonItem的item必须是UIBarButtonItem类型 所有用button来装饰
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = item;
    
}

- (void)backButtonPressed:(UIButton *)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


























- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
