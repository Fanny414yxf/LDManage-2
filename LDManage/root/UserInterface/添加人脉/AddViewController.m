//
//  AddViewController.m
//  LDManage
//
//  Created by rimi on 15-1-20.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@property (nonatomic, strong)UIImageView * navcView;
@property (nonatomic, strong)UIImageView * navcTitleImage;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _navcView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    _navcView.image = [UIImage imageNamed:@"顶.png"];
    [self.view addSubview:_navcView];
    _navcTitleImage = [[UIImageView alloc]init];
    [_navcView addSubview:_navcTitleImage];

    _navcTitleImage.image = [UIImage imageNamed:@"人脉关系建立_03.png"];
    _navcTitleImage.frame = CGRectMake(100, 20, 140, 30);

    
}
































- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
