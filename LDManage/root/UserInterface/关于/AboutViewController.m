//
//  AboutViewController.m
//  LDManage
//
//  Created by rimi on 15-1-20.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import "AboutViewController.h"
#import "LoginViewController.h"

@interface AboutViewController () <UIAlertViewDelegate>

@property (nonatomic, strong)UIImageView * navcView;
@property (nonatomic, strong)UIImageView * navcTitleImage;

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"背景_03.png"]];
    _navcView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    _navcView.image = [UIImage imageNamed:@"顶.png"];
    [self.view addSubview:_navcView];
    _navcTitleImage = [[UIImageView alloc]init];
    [_navcView addSubview:_navcTitleImage];

    _navcTitleImage.image = [UIImage imageNamed:@"关于title.png"];
    _navcTitleImage.frame = CGRectMake(130, 20, 90, 30);
    
    
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 54, 350, 558)];
    imageView.image = [UIImage imageNamed:@"设置_02.png"];
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
    
    UIButton * shuaxinButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 460, 350, 30)];
    [shuaxinButton setImage:[UIImage imageNamed:@"检查更新_03.png"] forState:UIControlStateNormal];
    [shuaxinButton addTarget:self action:@selector(processShuaXinButton) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:shuaxinButton];
    
    
    UIButton * tuiChuButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 510, 350, 30)];
    [tuiChuButton setImage:[UIImage imageNamed:@"退出登录_03.png"] forState:UIControlStateNormal];
    [tuiChuButton addTarget:self action:@selector(processTuiChuButton) forControlEvents:UIControlEventTouchUpInside];
    
    [imageView addSubview:tuiChuButton];


}



- (void)processShuaXinButton
{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"已是最新版本" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    alert.delegate = self;
    [alert show];
    
}
- (void)processTuiChuButton
{
    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"确定退出登录？" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alert.delegate = self;
    
    [alert show];
    
}



#pragma  mark -- UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
{
    if (buttonIndex == 1) {
        LoginViewController * loginVC = [[LoginViewController alloc]init];
        [self presentViewController:loginVC animated:YES completion:nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFY_SWITCH_TAB_BAR object:@0];

    }else{
        [alertView dismissWithClickedButtonIndex:0 animated:YES];
    }
    
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
