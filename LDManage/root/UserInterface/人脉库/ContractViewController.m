//
//  ContractViewController.m
//  LDManage
//
//  Created by rimi on 15-1-20.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import "ContractViewController.h"
#import "MyContractCell.h"

@interface ContractViewController () <UITableViewDataSource,UITableViewDelegate,MyTableViewCellDelegate>

@property (nonatomic, strong)UIImageView * navcView;
@property (nonatomic, strong)UIImageView * navcTitleImage;
@property (nonatomic,strong)UIButton * outContract;
@property (nonatomic,strong)UIButton * inContract;
@property (nonatomic,strong)UITableView * tableView;//列表
@property (nonatomic,strong)NSMutableDictionary * outContractData;//外部人脉
@property (nonatomic,strong)NSMutableDictionary * inContractData;//内部人脉
@property (nonatomic,retain)NSMutableArray * isOpenArray;//和cell的行数一样多的



@end

@implementation ContractViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.clipsToBounds = YES;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"背景_03.png"]];
    [self initUserInterface];
    [self initDataWithRequest];
    
    

}

- (void)initUserInterface
{
    
    _outContractData = [[NSMutableDictionary alloc] init];
    _inContractData = [[NSMutableDictionary alloc] init];
    
    
    _navcView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    _navcView.image = [UIImage imageNamed:@"顶.png"];
    [self.view addSubview:_navcView];
    
    _navcTitleImage = [[UIImageView alloc]init];
    _navcTitleImage.image = [UIImage imageNamed:@"人脉库_03.png"];
    _navcTitleImage.frame = CGRectMake(140, 20, 80, 30);
    [_navcView addSubview:_navcTitleImage];
    
    UIButton * searchButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 40, 50)];
    [searchButton setImage:[UIImage imageNamed:@"搜索_03.png"] forState:UIControlStateNormal];
    [self.view addSubview:searchButton];
    
    
    _outContract = [[UIButton alloc] initWithFrame:CGRectMake(100, 75, 80, 30)];
    [_outContract setImage:[UIImage imageNamed:@"外部未点击11_03.png"] forState:UIControlStateNormal];
    [_outContract setImage:[UIImage imageNamed:@"外部点击11_03.png"] forState:UIControlStateSelected];
    [_outContract addTarget:self action:@selector(processOutContractButton) forControlEvents:UIControlEventTouchUpInside];
    _outContract.selected = YES;
    [self.view addSubview:_outContract];
    
    _inContract = [[UIButton alloc] initWithFrame:CGRectMake(180, 75, 80, 30)];
    [_inContract setImage:[UIImage imageNamed:@"内部点击_03.png"] forState:UIControlStateNormal];
    [_inContract setImage:[UIImage imageNamed:@"内部点击_03.png"] forState:UIControlStateSelected];
    [_inContract addTarget:self action:@selector(processInContractButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_inContract];
    
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 110, SCREEN_WIDTH, SCREEN_HEIGHT - 100) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[MyContractCell class] forCellReuseIdentifier:@"cell"];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:_tableView];

    
    
    NSLog(@"ssss%@",self.view.subviews);
}









- (void)processOutContractButton
{
    
}


- (void)processInContractButton
{
    
}


#pragma mark -- 网络请求
- (void)initDataWithRequest
{

    [NetWork sendOutContractRequestCallback:^(id result) {
        NSLog(@"________out--------%@",result);
        _outContractData = result[@"content"];
        
        for (int i = 0; i < ((NSMutableArray *)_outContractData[@"people_list"]).count; i ++) {
            [_isOpenArray addObject:@0];
        }
        [_tableView reloadData];
    }];
    
    
//    [NetWork sendInContractRequestCallback:^(id result) {
//        NSLog(@"********  in ****%@",result);
//        _inContractData = result[@"content"];
//    }];
    
    
    
}








#pragma mark --<UITableViewDelegate,UITableViewDataSource>
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyContractCell * cell = [tableView  dequeueReusableCellWithIdentifier:@"cell"];
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"背景_03.png"]];
    [cell setCellContentWithInfo:_outContractData[@"people_list"][indexPath.row]];
    cell.delegate = self;
    cell.indexPath = indexPath;
    cell.isOpen = [_isOpenArray[indexPath.row] boolValue];
    
    return cell;
};
//组数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return [_outContractData[@"people_list"] count];
}
//高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BOOL isOpen = [_isOpenArray[indexPath.row] boolValue];
    if (isOpen) {
        return 240;
    }
    return 180;

}
//选中某行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}





#pragma mark ----------<MyTableViewCellDelegate>
- (void)dropButtonPressedWithIndexPata:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);
    BOOL isOpen = [_isOpenArray[indexPath.row] boolValue];
    isOpen = !isOpen;
    [_isOpenArray replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithBool:isOpen]];
    MyContractCell * cell = (MyContractCell *)[_tableView cellForRowAtIndexPath:indexPath];
    cell.isOpen = isOpen;
    [_tableView reloadData];

}
- (void)insideCellDidSelectedWithInsideIndexPath:(NSIndexPath *)insidIndexPath myIndexPath:(NSIndexPath *)myIndexPath
{
    
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
