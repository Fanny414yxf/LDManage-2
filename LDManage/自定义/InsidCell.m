//
//  InsidCell.m
//  LDManage
//
//  Created by rimi on 15-1-22.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import "InsidCell.h"

@implementation InsidCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUserInterface];
    }
    return self;
}

- (void)initUserInterface
{
    
    
    _photoImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    _photoImage.layer.cornerRadius = 15;//圆角角度
    _photoImage.clipsToBounds = YES;//圆角显示
    [self.contentView addSubview:_photoImage];
    _nameLable = [[UILabel alloc] initWithFrame:CGRectMake(35, 5, 100, 15)];
    _nameLable.textAlignment = NSTextAlignmentLeft;
    _nameLable.font = [UIFont systemFontOfSize:13];
    _nameLable.textColor = [UIColor colorWithRed:147/255.0 green:179/255.0 blue:57/255.0 alpha:1];
    [self.contentView addSubview:_nameLable];
    
    _pentagramImage = [[UIImageView alloc]initWithFrame:CGRectMake(135, 5, 15, 15)];
    [self.contentView addSubview:_pentagramImage];
    
    _zhongyaoLable = [[UILabel alloc] initWithFrame:CGRectMake(152, 5, 50, 15)];
    _zhongyaoLable.textAlignment = NSTextAlignmentLeft;
    _zhongyaoLable.font = [UIFont systemFontOfSize:11];
    [self addSubview:_zhongyaoLable];
    
    _peachPentagramImage = [[UIImageView alloc] initWithFrame:CGRectMake(210, 5, 15, 14)];
    [self.contentView addSubview:_peachPentagramImage];
    
    _qinmiLable = [[UILabel alloc] initWithFrame:CGRectMake(230, 5, 50, 15)];
    _qinmiLable.textAlignment = NSTextAlignmentLeft;
    _qinmiLable.font = [UIFont systemFontOfSize:11];
    [self addSubview:_qinmiLable];
    

}
- (void)setContentWithInfo:(NSDictionary *)info
{
    
    NSArray * qinMiImage = @[@"不亲密_03.png",@"亲密_03.png",@"一般亲密_03.png",@"非常亲密_03.png"];
    NSArray * zhongyaoImage = @[@"不重要_03.png",@"重要_03.png",@"一般重要_03.png",@"非常重要_03.png"];
    _photoImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:info[@"avatar"]]]];
    _nameLable.text = [NSString stringWithFormat:@"%@ 的%@",info[@"real_name"],info[@"relation_type"]];
    
    if ([info[@"importance"] integerValue] == 1) {
        _zhongyaoLable.text = @"不重要";
        _pentagramImage.image = IMAGE_WITH_NAME(zhongyaoImage[0]);
        
    }else if ([info[@"importance"] integerValue] == 2){
        _zhongyaoLable.text = @"一般重要";
        _pentagramImage.image = IMAGE_WITH_NAME(zhongyaoImage[1]);
        
    }else if ([info[@"importance"] integerValue] == 3){
        _zhongyaoLable.text = @"重要";
        _pentagramImage.image = IMAGE_WITH_NAME(zhongyaoImage[2]);
        
    }else if ([info[@"importance"] integerValue] == 4){
        _zhongyaoLable.text = @"非常重要";
        _pentagramImage.image = IMAGE_WITH_NAME(zhongyaoImage[3]);
    }else{
        _zhongyaoLable.text = @"非常重要";
        _pentagramImage.image = IMAGE_WITH_NAME(zhongyaoImage[3]);
    }
        

    if ([info[@"relationship"] integerValue] == 1) {
        _qinmiLable.text = @"不亲密";
        _peachPentagramImage.image = IMAGE_WITH_NAME(@"不亲密_大图.png");
        
    }else if ([info[@"relationship"] integerValue] == 2){
        _qinmiLable.text = @"一般亲密";
        _peachPentagramImage.image = IMAGE_WITH_NAME(@"亲密_大图.png");

    }else if ([info[@"relationship"] integerValue] == 3){
        _qinmiLable.text = @"亲密";
        _peachPentagramImage.image = IMAGE_WITH_NAME(@"一般亲密_大图.png");

    }else if ([info[@"relationship"] integerValue] == 4){
        _qinmiLable.text = @"非常亲密";
        _peachPentagramImage.image = IMAGE_WITH_NAME(@"非常亲密_大图.png");

    }else{
        _qinmiLable.text = @"非常亲密";
        _peachPentagramImage.image = IMAGE_WITH_NAME(@"非常亲密_大图.png");

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
