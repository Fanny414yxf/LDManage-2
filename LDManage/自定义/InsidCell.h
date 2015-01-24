//
//  InsidCell.h
//  LDManage
//
//  Created by rimi on 15-1-22.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InsidCell : UITableViewCell


@property (nonatomic,retain)UIImageView * photoImage;
@property (nonatomic,retain)UIImageView * pentagramImage;
@property (nonatomic,retain)UIImageView * peachPentagramImage;
@property (nonatomic,retain)UILabel * nameLable;
@property (nonatomic,retain)UILabel * guanxiLable;
@property (nonatomic,retain)UILabel * zhongyaoLable;
@property (nonatomic,retain)UILabel * qinmiLable;

- (void)setContentWithInfo:(NSDictionary *)info;

@end
