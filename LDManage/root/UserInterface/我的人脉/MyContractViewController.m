//
//  MyContractViewController.m
//  LDManage
//
//  Created by rimi on 15-1-20.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import "MyContractViewController.h"
#import "BackBaseViewController.h"
#import "AddViewController.h"
#import "DetailViewController.h"
#import "TabBarView.h"
#import "MyContractCell.h"
#import "TimerCell.h"

@interface MyContractViewController () <UITableViewDelegate,UITableViewDataSource,MyTableViewCellDelegate>
{
    NSInteger isContract;
}

@property (nonatomic, strong)UIImageView * navcView;
@property (nonatomic, strong)UIImageView * navcTitleImage;
@property (nonatomic,strong)UIButton * myContractButton;
@property (nonatomic,strong)UIButton * timeButton;

//tableView
@property (nonatomic,strong)UITableView * tabbleViewTimer;
@property (nonatomic,strong)UITableView * tabbleViewContractList;
//数据源
@property(nonatomic,strong) NSMutableDictionary * myContractListData;
@property (nonatomic,strong)NSMutableArray * timeListData;
@property (nonatomic,retain)NSMutableArray * isOpenArray;//和cell的行数一样多的
//时间轴
@property (nonatomic,strong)UIView * timerView;
@property (nonatomic,strong)UIImageView * photo;




@end

@implementation MyContractViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    [self initUserInterface];
    [self initData];
    [self initDataSourceWithRequst];
    self.view.clipsToBounds = YES;
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"背景_03.png"]]];

}


- (void)initData
{
    _myContractListData = [[NSMutableDictionary alloc] init];
    _timeListData = [[NSMutableArray alloc]init];
    _isOpenArray = [[NSMutableArray alloc] init];
}

- (void)initUserInterface
{
#pragma mark ---- 我的人脉
    _navcView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    _navcView.image = [UIImage imageNamed:@"顶.png"];
    [self.view addSubview:_navcView];
    _navcTitleImage = [[UIImageView alloc]init];
    _navcTitleImage.image = [UIImage imageNamed:@"我的人脉_03.png"];
    _navcTitleImage.frame = CGRectMake(110, 20, 120, 30);
    [_navcView addSubview:_navcTitleImage];
    
    
    UIButton * searchButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 40, 50)];
    [searchButton setImage:[UIImage imageNamed:@"搜索_03.png"] forState:UIControlStateNormal];
    [self.view addSubview:searchButton];
    
    UIButton * addButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 60, 10, 40, 50)];
    [addButton setImage:[UIImage imageNamed:@"新增人脉_03.png"] forState:UIControlStateNormal];
    [self.view addSubview:addButton];
    
    
    
    _myContractButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 75, 80, 30)];
    _myContractButton.tag = 1;
    [_myContractButton setImage:[UIImage imageNamed:@"我的人脉未点击11_03.png"] forState:UIControlStateNormal];
    [_myContractButton setImage:[UIImage imageNamed:@"我的人脉点击11_03.png"] forState:UIControlStateSelected];
    [_myContractButton addTarget:self action:@selector(processWodeRenmaiButton) forControlEvents:UIControlEventTouchUpInside];
    _myContractButton.selected = YES;
    [self.view addSubview:_myContractButton];
    
    _timeButton = [[UIButton alloc] initWithFrame:CGRectMake(180, 75, 80, 30)];
    _timeButton.tag = 2;
    [_timeButton setImage:[UIImage imageNamed:@"时间轴未点击_03.png"] forState:UIControlStateNormal];
    [_timeButton setImage:[UIImage imageNamed:@"时间轴点击_03.png"] forState:UIControlStateSelected];
       [_timeButton addTarget:self action:@selector(processShiJianZhouButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_timeButton];
    
    UIImageView * fengexianView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 110,SCREEN_WIDTH,20)];
    fengexianView.image = [UIImage imageNamed:@"分割线_03.png"];
    [self.view addSubview:fengexianView];
    
    _tabbleViewContractList = [[UITableView alloc]initWithFrame:CGRectMake(0, 130, SCREEN_WIDTH, SCREEN_HEIGHT - 150) style:UITableViewStylePlain];
    _tabbleViewContractList.separatorColor = [UIColor clearColor];
    _tabbleViewContractList.delegate  = self;
    _tabbleViewContractList.dataSource = self;
    _tabbleViewContractList.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    //注册cell的模式
    [_tabbleViewContractList registerClass:[MyContractCell class] forCellReuseIdentifier:@"ContractCell"];
    [self.view addSubview:_tabbleViewContractList];



#pragma mark --- 时间轴
    
    
    _timerView = [[UIView alloc] initWithFrame:CGRectMake(0, 110, SCREEN_WIDTH, SCREEN_HEIGHT - 110)];
    _timerView.userInteractionEnabled = YES;
    _timerView.hidden = YES;
    _timerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"背景_03.png"]];
    [self.view addSubview:_timerView];
    UIImageView * headView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 130)];
    headView.image = IMAGE_WITH_NAME(@"大头像_02.png");
    [_timerView addSubview:headView];
    
    _photo = [[UIImageView alloc] initWithFrame:CGRectMake(60, 100, 60, 60)];
    _photo.layer.cornerRadius = 30;
    _photo.clipsToBounds = YES;
    _photo.backgroundColor = [UIColor cyanColor];
    [_timerView addSubview:_photo];
    
    
    UIButton * showButton = [[UIButton alloc] initWithFrame:CGRectMake(150, 130, 100, 30)];
    [showButton setImage:[UIImage imageNamed:@"显示全部_03.png"] forState:UIControlStateNormal];
    [showButton addTarget:self action:@selector(processShowTimerView) forControlEvents:UIControlEventTouchUpInside];
    [_timerView addSubview:showButton];
    

    UIView * foot = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
    _tabbleViewTimer = [[UITableView alloc] initWithFrame:CGRectMake(0, 170, SCREEN_WIDTH, 360)   style:UITableViewStylePlain];
    _tabbleViewTimer.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _tabbleViewTimer.delegate = self;
    _tabbleViewTimer.dataSource = self;
//    _tabbleViewTimer.backgroundColor = [UIColor cyanColor];
    _tabbleViewTimer.tableFooterView = foot;
    [_tabbleViewTimer registerClass:[TimerCell class] forCellReuseIdentifier:@"time"];
    [_timerView addSubview:_tabbleViewTimer];
    


}




- (void)processButton
{

    
}

- (void)processWodeRenmaiButton
{
    isContract = _myContractButton.tag;
    _myContractButton.selected = YES;
    if (_myContractButton.selected) {
        _myContractButton.userInteractionEnabled = NO;
        _timeButton.selected = NO;
        _timerView.hidden = YES;
    }
    [_tabbleViewContractList reloadData];
}


- (void)processShiJianZhouButton
{
    isContract = _timeButton.tag;
    _timeButton.selected = YES;
    if (_timeButton.selected) {
        _timeButton.userInteractionEnabled = NO;
        _myContractButton.selected = NO;
        _timerView.hidden = NO;
    }
    [_tabbleViewTimer reloadData];
}

#pragma mark -- 时间轴
- (void)processShowTimerView
{
    
    
}



#pragma mark == 网络请求
- (void)initDataSourceWithRequst
{
  
    NSMutableDictionary * parameters = [[NSMutableDictionary alloc] init];
    [parameters setObject:@"ApiGGC" forKey:@"g"];
    [parameters setObject:@"People" forKey:@"m"];
    [parameters setObject:@"getMyPeopleList" forKey:@"c"];
    [parameters setObject:@"1" forKey:@"page_index"];
    [parameters setObject:@"5" forKey:@"list_row"];
    [parameters setObject:@"dfgfd" forKey:@"cookie"];
    
    [NetWork sendPostRequestWithURL:BASE_URL parameters:parameters callback:^(id result) {
        
        BOOL isLogin = [LoginInformation shearLoginInformation].isLogin;
        if (isLogin) {
                _myContractListData = result[@"content"];
        }
        for (int i = 0; i < ((NSMutableArray *)_myContractListData[@"people_list"]).count; i ++) {
            [_isOpenArray addObject:@0];
        }
        
        [_tabbleViewContractList reloadData];
    }];
#pragma mark -- s时间轴
    [NetWork sendTimerRequestCallback:^(id result) {
        BOOL isLogin = [LoginInformation shearLoginInformation].isLogin;
        if (isLogin) {
            _timeListData = result[@"content"][@"timeline_list"];
            _photo.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_timeListData[0][@"people_avatar"]]]];
            NSLog(@"时间轴%@",result);
        }
        
       
    }];
    
    
}





#pragma mark --<UITableViewDelegate,UITableViewDataSource>
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (isContract == 1) {
        MyContractCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ContractCell"];
        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"背景_03.png"]];
        [cell setCellContentWithInfo:_myContractListData[@"people_list"][indexPath.row]];
        cell.delegate = self;
        cell.indexPath = indexPath;
        cell.isOpen = [_isOpenArray[indexPath.row] boolValue];
        return cell;

    }else{
        TimerCell * tCell = [tableView dequeueReusableCellWithIdentifier:@"time"];
        [tCell setContentWithInfo:_timeListData[indexPath.row]];
        return tCell;
    }
};

//组数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    if (isContract == 1) {
        return [_myContractListData[@"people_list"] count];

    }else{
        return [_timeListData count];
    }
}

//高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:_tabbleViewTimer]) {
        return 80;
    }
    
    BOOL isOpen = [_isOpenArray[indexPath.row] boolValue];
    if (isOpen) {
            return 240;
        }
        return 180;
   
    
    
}
//选中某行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}




#pragma  mark ----------------<MyTableViewCellDelegate>

- (void)dropButtonPressedWithIndexPata:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);
    BOOL isOpen = [_isOpenArray[indexPath.row] boolValue];
    isOpen = !isOpen;
    [_isOpenArray replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithBool:isOpen]];
    MyContractCell * cell = (MyContractCell *)[_tabbleViewContractList cellForRowAtIndexPath:indexPath];
    cell.isOpen = isOpen;
    [_tabbleViewContractList reloadData];
    
}


- (void)insideCellDidSelectedWithInsideIndexPath:(NSIndexPath *)insidIndexPath myIndexPath:(NSIndexPath *)myIndexPath
{

}














- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
