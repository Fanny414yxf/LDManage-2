//
//  MayViewController.m
//  LDManage
//
//  Created by rimi on 15-1-20.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import "MayViewController.h"
#import "MainBaseViewController.h"

@interface MayViewController ()

@property (nonatomic, strong)UIImageView * navcView;
@property (nonatomic, strong)UIImageView * navcTitleImage;

@end

@implementation MayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    
    _navcView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    _navcView.image = [UIImage imageNamed:@"顶.png"];
    [self.view addSubview:_navcView];
    _navcTitleImage = [[UIImageView alloc]init];
    [_navcView addSubview:_navcTitleImage];

    _navcTitleImage.image = [UIImage imageNamed:@"可能认识的人_03.png"];
    _navcTitleImage.frame = CGRectMake(100, 20, 140, 30);

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
