//
//  TestCell.m
//  off-screen test
//
//  Created by 李民舟 on 16/3/7.
//  Copyright © 2016年 com.fengdikeji. All rights reserved.
//

#import "TestCell.h"

@interface TestCell ()

@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
@property (weak, nonatomic) IBOutlet UIImageView *rightImageVIew;
@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;


@end

@implementation TestCell

+ (instancetype)cellWithTableView:(UITableView*)tableView {
    static NSString *identifier = @"TestCell";
    TestCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"TestCell" owner:nil options:nil]firstObject];
        cell.leftImageView.image = [UIImage imageNamed:@"皇家马德里.jpg"];
        cell.rightImageVIew.image = [UIImage imageNamed:@"皇家马德里.jpg"];
    }
    
    return cell;
}

+ (CGFloat)getHeight {
    return 71;
}

@end
