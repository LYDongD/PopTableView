//
//  TestCell.h
//  off-screen test
//
//  Created by 李民舟 on 16/3/7.
//  Copyright © 2016年 com.fengdikeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestCell : UITableViewCell

+ (CGFloat)getHeight;
+ (instancetype)cellWithTableView:(UITableView*)tableView;

@end
