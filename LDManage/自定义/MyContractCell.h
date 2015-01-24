//
//  MyContractCell.h
//  LDManage
//
//  Created by rimi on 15-1-22.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol MyTableViewCellDelegate <NSObject>
/**按钮选中的行数*/
- (void)dropButtonPressedWithIndexPata:(NSIndexPath *)indexPath;
//**被选中的大cell的行数myIndexPath  和小cell选中的行数insidIndexPath*/
- (void)insideCellDidSelectedWithInsideIndexPath:(NSIndexPath *)insidIndexPath myIndexPath:(NSIndexPath *)myIndexPath;


@end


@interface MyContractCell : UITableViewCell

//@property (nonatomic,retain)NSArray * insidData;

@property (nonatomic,assign) id <MyTableViewCellDelegate> delegate;
@property (nonatomic,retain)NSIndexPath * indexPath;//自身的位数

@property (nonatomic,assign)BOOL isOpen;//告诉cell现在的展开状态

@property (nonatomic,retain)NSDictionary * dataSource;//数据


- (void)setCellContentWithInfo:(NSDictionary *)info;


@end
