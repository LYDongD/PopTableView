//
//  LYPopCell.h
//  PopTableViewDemo
//
//  Created by 李民舟 on 16/3/8.
//  Copyright © 2016年 com.fengdikeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYPopCell : UITableViewCell

/**
 *  地址
 */
@property (nonatomic,copy) NSString *address;

+ (instancetype)cellWithTableView:(UITableView*)tableView;

+ (CGFloat)getHeight;
@end
