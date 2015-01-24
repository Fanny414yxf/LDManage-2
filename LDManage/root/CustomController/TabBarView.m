//
//  TabBarView.m
//  LDManage
//
//  Created by rimi on 15-1-20.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import "TabBarView.h"

@implementation TabBarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self intailizeUserInterface];
    
    //接收通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifySwitchTabBar:) name:NOTIFY_SWITCH_TAB_BAR object:nil];
    return self;
}


/**
 初始化
 */

- (void)intailizeUserInterface
{
    CGFloat buttonWidth = SCREEN_WIDTH / 5;
    CGFloat buttonHight = TAB_HIGTH;
    
    NSArray * array = @[@"我的人脉未点击_03.png",@"人脉库未点击_03.png",@"可能未点击_05.png",@"添加关系未点击_03",@"关于未点击_03.png"];
    
    NSArray * selecteaArray = @[@"我的人脉点击_03.png",@"人脉库点击_03.png",@"可能点击_05.png",@"添加关系点击_03.png",@"关于点击_03.png"];
    
    for (int i = 0; i < 5; i ++) {
        UIButton * button  = [[UIButton alloc]initWithFrame:CGRectMake(10 + buttonWidth * i, 0, buttonWidth - 20, 50)];
        [button setImage:[UIImage imageNamed:array[i]] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:selecteaArray[i]] forState:UIControlStateSelected];
        button.titleLabel.font = FONT(16);
        button.titleLabel.textColor = COLOR(222,144,33,1);
        button.tag = TAB_BAR_TAG_BASE + i;
        [button addTarget:self action:@selector(buttonPrecess:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
    }
}


- (void)buttonPrecess:(UIButton *)sender
{
    
    if (sender.selected) {
        return;
    }
    [self resetButtonState];
    sender.selected = YES;
    
    if (_delegate && [_delegate respondsToSelector:@selector(tabBarDidSelectedWithIndex:)]) {
        [_delegate tabBarDidSelectedWithIndex:sender.tag - TAB_BAR_TAG_BASE ];
    }
    
}

- (void)resetButtonState
{
    for ( int i = 0; i < 5; i ++) {
        UIButton * button = (UIButton *)[self viewWithTag:TAB_BAR_TAG_BASE + i];
        button.selected = NO;
        button.backgroundColor = [UIColor clearColor];
        
    }
}

#pragma mark --通知要做的事
- (void)notifySwitchTabBar:(NSNotification *)notifucatiaon
{
    
    NSInteger index = [[notifucatiaon object] integerValue];
    [self buttonPrecess:(UIButton *)[self viewWithTag:TAB_BAR_TAG_BASE + index]];
}



@end
