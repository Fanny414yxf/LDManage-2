//
//  BaseViewControll.m
//  LDManage
//
//  Created by rimi on 15-1-20.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import "BaseViewControll.h"

@interface BaseViewControll ()

@end

@implementation BaseViewControll

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUserInterface];
}


- (void)initUserInterface
{
//    _navc = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
//    _navc.image = [UIImage imageNamed:@"顶.png"];
//    [self.view addSubview:_navc];
    
    _contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - TAB_BAR_HEIGHT)];
    _contentView.backgroundColor = [UIColor clearColor];
    _contentView.clipsToBounds = YES;
    [self.view addSubview:_contentView];
    
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
