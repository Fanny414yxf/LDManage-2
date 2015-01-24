//
//  MyContractCell.m
//  LDManage
//
//  Created by rimi on 15-1-22.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import "MyContractCell.h"
#import "InsidCell.h"

@interface MyContractCell () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,retain)UITableView * tableView;
//@property (nonatomic,retain)UIButton * button;
@property (nonatomic,retain)NSDictionary * insideInfo;//小tabble数据


@property (nonatomic,retain)UIImageView * photo;
@property (nonatomic,retain)UIImageView * sex;
@property (nonatomic,retain)UIImageView * line;
@property (nonatomic,retain)UILabel * userName;
@property (nonatomic,retain)UIButton * buttonChangeHigth;//下拉按钮
@property (nonatomic,retain)UITableView * insidTableView;//内部table


@end

@implementation MyContractCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUserInterFace];
    }
    return self;
}

- (void)initUserInterFace
{
#pragma  mark -- 视图范围
    self.clipsToBounds = YES;
    self.contentView.clipsToBounds = YES;
    
    _photo = [[UIImageView alloc]initWithFrame:CGRectMake(8, 0, 60, 60)];
    _photo.layer.cornerRadius = 30;
    _photo.clipsToBounds = YES;
    [self.contentView addSubview:_photo];
    _photo.backgroundColor = [UIColor cyanColor];
    
    
    _sex = [[UIImageView alloc] initWithFrame:CGRectMake(70, 5, 30, 30)];
    [self.contentView addSubview:_sex];
    
    _line = [[UIImageView alloc] initWithFrame:CGRectMake(0, 160, 330,10)];
    _line.image = IMAGE_WITH_NAME(@"线_02.png");
    [self.contentView addSubview:_line];
    
    
    _userName = [[UILabel alloc] initWithFrame:CGRectMake(100, 15, 200, 20)];
    _userName.textColor = [UIColor blackColor];
    _userName.font = [UIFont systemFontOfSize:17];
    [self.contentView addSubview:_userName];
    
    
    _buttonChangeHigth = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    _buttonChangeHigth.center = CGPointMake(320, 160);
    [_buttonChangeHigth setImage:[UIImage imageNamed:@"1_03 2.png"] forState:UIControlStateNormal];
    [_buttonChangeHigth setImage: [UIImage imageNamed:@"2_03 2.png"] forState:UIControlStateSelected];
    _buttonChangeHigth.selected = NO;
    [_buttonChangeHigth addTarget:self action:@selector(dropButtonProcess:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_buttonChangeHigth];
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(60, 60, 300, 70) style:UITableViewStylePlain];
    [_tableView registerClass:[InsidCell class] forCellReuseIdentifier:@"InsideCell"];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.bounces = NO;//tabbleView不滚动
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.contentView addSubview:_tableView];
    _tableView.backgroundColor = [UIColor yellowColor];

    
    

    
    
}



- (void)setCellContentWithInfo:(NSDictionary *)info;
{
    self.dataSource = info;
    NSLog(@"info%@",info);
        _photo.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:info[@"avatar"]]]];
        if ([info[@"sex"] integerValue] == 0) {
            _sex.image = IMAGE_WITH_NAME(@"女大图_03.png");
        }else if ([info[@"sex"] integerValue] == 2){
            _sex.image = IMAGE_WITH_NAME(@"男大图_03.png");
        }
        _userName.text = info[@"real_name"];


        
    
    
    
    
}

/**点击按钮执行协议方法*/
- (void)dropButtonProcess:(UIButton *)sender
{
    NSLog(@"zoubuzou");
    sender.selected = !sender.selected;
    if (_delegate && [_delegate respondsToSelector:@selector(dropButtonPressedWithIndexPata:)]) {
        [_delegate dropButtonPressedWithIndexPata:_indexPath];
    }

}



#pragma mark == <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
//    return 4;
    return [_dataSource[@"relate_other_people_list"] count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 35;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    InsidCell * cell= [tableView dequeueReusableCellWithIdentifier:@"InsideCell"];
    NSLog(@"dadadadadadasda%@",_dataSource[@"relate_other_people_list"]);
    [cell setContentWithInfo:_dataSource[@"relate_other_people_list"][indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//点中的阴影
    
    //判断_delegate是否存在== viewcontroller  cell.delegate = self; 并且viewcontroller实现了协议方法
    if (_delegate && [_delegate respondsToSelector:@selector(insideCellDidSelectedWithInsideIndexPath:myIndexPath:)]) {
        //小table选择的行        大cell的行
        [_delegate insideCellDidSelectedWithInsideIndexPath:indexPath myIndexPath:_indexPath];
    }
    
}



- (void)setIsOpen:(BOOL)isOpen
{
    //若果打开  按钮向下移动
    _isOpen = isOpen;
    _buttonChangeHigth.selected = isOpen;
    if (isOpen) {
        
        _buttonChangeHigth.center = CGPointMake(_buttonChangeHigth.center.x, 220);
        _line.center = CGPointMake(_line.center.x, 220);
        _tableView.frame = CGRectMake(70, 60, 290, 140);
        return;
    }
    //关闭  上移
    if (!isOpen) {
        NSLog(@"%f",_buttonChangeHigth.center.y);
        _buttonChangeHigth.center = CGPointMake(_buttonChangeHigth.center.x, 160);
        _line.center = CGPointMake(_line.center.x, 160);
        _tableView.frame = CGRectMake(70, 60, 290, 70);
        NSLog(@"%f",_buttonChangeHigth.center.y);
        return;
    }

}








- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
