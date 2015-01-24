//
//  TimerCell.m
//  LDManage
//
//  Created by rimi on 15-1-23.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import "TimerCell.h"
@interface TimerCell ()

@property (nonatomic,strong)UIImageView * photo;
@property (nonatomic,strong)UILabel * informationLabel;
@property (nonatomic,strong)UILabel * timeLabel;
@property (nonatomic,strong)UIImageView * type;

@end

@implementation TimerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUserInerface];
    }
    return self;
}

- (void)initUserInerface
{

    _photo = [[UIImageView alloc]initWithFrame:CGRectMake(8, 0, 60, 60)];
    _photo.layer.cornerRadius = 30;
    _photo.clipsToBounds = YES;
    [self.contentView addSubview:_photo];
    
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(80, 0, 10, 80)];
    line.image = IMAGE_WITH_NAME(@"线_03.png");
    [self.contentView addSubview:line];

    _type = [[UIImageView alloc]initWithFrame:CGRectMake(70, 30, 30, 30)];
    _type.layer.cornerRadius = 15;
    _type.clipsToBounds = YES;
    [self.contentView addSubview:_type];

    
    
    
    _informationLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 20, 200, 20)];
//    _informationLabel.text = @"dddd";
    _informationLabel.textColor = [UIColor blackColor];
    _informationLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:_informationLabel];
    
    _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 50, 200, 20)];
//    _timeLabel.text = @"dsfsf";
    _timeLabel.textColor = [UIColor grayColor];
    _timeLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:_timeLabel];
    
    
    

    
    
}


- (void)setContentWithInfo:(NSDictionary *)info
{
    
    _photo.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:info[@"relate_people_avatar"]]]];
    _informationLabel.text = [NSString stringWithFormat:@"%@ 和%@",info[@"people_name"],info[@"type_name"]];
    _timeLabel.text = info[@"time"];
    if ([info[@"type"] integerValue] == 51) {
        _type.image = IMAGE_WITH_NAME(@"1_03.png");
    }else if ([info[@"type"] integerValue] == 52){
        _type.image = IMAGE_WITH_NAME(@"2_03.png");

    }else if ([info[@"type"] integerValue] == 53){
        _type.image = IMAGE_WITH_NAME(@"3_03.png");
        
    }else if ([info[@"type"] integerValue] == 54){
        _type.image = IMAGE_WITH_NAME(@"4_03.png");
        
    }else if ([info[@"type"] integerValue] == 100){
        _type.image = IMAGE_WITH_NAME(@"其他_03.png");
        
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
