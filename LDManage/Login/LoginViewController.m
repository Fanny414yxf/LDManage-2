//
//  LoginViewController.m
//  LDManage
//
//  Created by rimi on 15-1-21.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import "LoginViewController.h"
#import "NetWork+Login.h"
#import "LoginInformation.h"

#define KEY_NAME @"username"
#define KEY_PASSWORD @"password"


@interface LoginViewController ()
{
    NSInteger flag;
    NSMutableArray * _inforArray;
    NSMutableDictionary * _inforDic;
}

@property (nonatomic,strong)UIImageView * background;
@property (nonatomic,retain)UITextField * textFieldPassWord;
@property (nonatomic,retain)UITextField * textFieldUserName;
@property (nonatomic,retain)UIButton * remenberBurron;

//@property (nonatomic,retain)NSString * username;
//@property (nonatomic,retain)NSString * password;
@property (nonatomic,retain)NSMutableArray * array;





@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Default-568h@2x 2.png"]];
    
    _inforArray = [[NSMutableArray alloc]init];
   

    _background = [[UIImageView alloc]initWithFrame:CGRectMake(50, 200, 280, 200)];
    _background.image = [UIImage imageNamed:@"登录框_03.png"];
    _background.userInteractionEnabled = YES;
    [self.view addSubview:_background];
    
    _textFieldUserName = [[UITextField alloc] initWithFrame:CGRectMake(70, 50, 180, 30)];
    _textFieldUserName.textColor = COLOR(149, 181, 61, 1);
    _textFieldUserName.clearButtonMode = UITextFieldViewModeWhileEditing;
    _textFieldUserName.clearsOnBeginEditing = YES;
    _textFieldUserName.font = FONT(18);
    [_background addSubview:_textFieldUserName];
    
    
    _textFieldPassWord = [[UITextField alloc] initWithFrame:CGRectMake(70, 90, 180, 30)];
    _textFieldPassWord.textColor = COLOR(149, 181, 61, 1);
    _textFieldPassWord.clearButtonMode = UITextFieldViewModeWhileEditing;
    _textFieldPassWord.clearsOnBeginEditing = YES;
    _textFieldPassWord.font = FONT(18);
    _textFieldPassWord.secureTextEntry = YES;
    [_background addSubview:_textFieldPassWord];

    _remenberBurron = [[UIButton alloc]initWithFrame:CGRectMake(30, 120, 25, 25)];
    _remenberBurron.selected = NO;
    [_remenberBurron setImage:[UIImage imageNamed:@"选中_03.png"] forState:UIControlStateSelected];
    [_remenberBurron setImage:[UIImage imageNamed:@"未选中_03.png"] forState:UIControlStateNormal];
    [_remenberBurron addTarget:self action:@selector(processRemenberButton) forControlEvents:UIControlEventTouchUpInside];
    [_background addSubview:_remenberBurron];
    

    
    UIButton * loginBurron = [[UIButton alloc]initWithFrame:CGRectMake(100, 150, 85, 30)];
    [loginBurron setImage:[UIImage imageNamed:@"登录_03 2.png"] forState:UIControlStateNormal];
    [loginBurron addTarget:self action:@selector(processLoginBurron) forControlEvents:UIControlEventTouchUpInside];
    [_background addSubview:loginBurron];
    
    
}



#pragma mark == 记住密码
- (void)processRemenberButton
{
    _remenberBurron.selected = !_remenberBurron.selected;
    if (_remenberBurron.selected) {
        flag = 1;
//       [LoginInformation shearLoginInformation].flag = 1;
    }else{
        flag = 0;
//        [LoginInformation shearLoginInformation].flag = 0;
    }
    
}
#pragma mark == 记住密码
- (void)viewDidAppear:(BOOL)animated
{
    NSMutableDictionary * userInfor = [[NSUserDefaults standardUserDefaults] objectForKey:@"Infor"];
    if (userInfor != nil) {
        _textFieldUserName.text = userInfor[KEY_NAME];
        _textFieldPassWord.text = userInfor[KEY_PASSWORD];
    }
    
    
}


#pragma  mark == 网络请求
- (void)processLoginBurron
{
    NSString * userName = _textFieldUserName.text;
    NSString * passWord = _textFieldPassWord.text;
    // login - 》 NetWork - 》 NetWork+Login
    [NetWork sendLoginRequestWithUserName:userName passWord:passWord callback:^(id result) {
        
         // 刷新界面 50
        NSLog(@"%@",result);
        if ([result[@"status"] integerValue] == 1) {
            [LoginInformation shearLoginInformation].isLogin = YES;
            if (flag == 1) {
                NSMutableDictionary * userInfo = [[NSMutableDictionary alloc]init];
                [userInfo setObject:userName forKey:@"username"];
                
                [userInfo setObject:passWord forKey:@"password"];
                
                [[NSUserDefaults standardUserDefaults] setObject:userInfo forKey:@"Infor"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                
                
                NSMutableDictionary *arrayDataSourse = [[NSUserDefaults standardUserDefaults] objectForKey:@"Infor"];
                NSLog(@"%@",arrayDataSourse);
                NSLog(@"%@",[[[NSUserDefaults standardUserDefaults] objectForKey:@"Infor"] class]);
            }else if (flag == 0){
                NSMutableDictionary *arrayDataSourse =[[NSUserDefaults standardUserDefaults] objectForKey:@"Infor"];
                NSLog(@"%@",arrayDataSourse);
                
            }
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFY_SWITCH_TAB_BAR object:@0];

            [self dismissViewControllerAnimated:YES completion:nil];
        }
        
    }];
        
}
     


- (void)notifyKeybaardWillChangeFram:(NSNotification *)notificaton
{
    //ChangeFram  中英文的高度切换
    //    NSLog(@"%@",notificaton);
    
    NSDictionary * userInfor = [notificaton object];
    NSValue * value = [userInfor objectForKey: UIKeyboardFrameEndUserInfoKey];
    CGRect keyBoardRect = [value CGRectValue];
    NSLog(@"%f", keyBoardRect.origin.y);
    [UIView animateWithDuration:0.3 animations:^{
        CGRect f = self.view.frame;
        f.origin.y = keyBoardRect.origin.y - 80;
        // 监测到键盘改变了 根据keyBoardRect动态改变self.view.frame的orige.y的位置
        // self.view.frame;
        self.view.frame = f;
    }];
}



- (UIColor *)firstResponser
{
    //获得所有控件
    NSArray * subView = self.view.subviews;
    NSInteger count = subView.count;
    //遍历所有控件
    for ( int i = 0 ; i < count; i++) {
        //判断谁否位第一响应者
        if ([subView[i] isFirstResponder]) {
            return subView[i];
        }
    }
    return nil;
}



#pragma mark 监测到了键盘将要隐藏的时候执行
- (void)notifyKeybaardWillHide:(NSNotification *)notificaton
{
    // 监测到了键盘将要隐藏的时候 把self.view.frame 复原 等于 {{0, 0}, {0, 0}}
    NSLog(@"%@",notificaton);
    [UIView animateWithDuration:0.3 animations:^{
        CGRect f = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        self.view.frame = f;
    }];
}


#pragma marl - --touch
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];//所有的输入框收起
    
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
