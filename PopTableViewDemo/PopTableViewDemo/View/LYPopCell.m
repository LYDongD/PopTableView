//
//  LYPopCell.m
//  PopTableViewDemo
//
//  Created by 李民舟 on 16/3/8.
//  Copyright © 2016年 com.fengdikeji. All rights reserved.
//

#import "LYPopCell.h"

@interface LYPopCell ()

@property (weak, nonatomic) IBOutlet UILabel *addressLabel;


@end

@implementation LYPopCell

+ (instancetype)cellWithTableView:(UITableView*)tableView {
    static NSString* reuseIdentifier = @"LYPopCell";
    LYPopCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"LYPopCell" owner:nil options:nil][0];
    }
    
    return cell;
}


- (void)setAddress:(NSString *)address {
    _address = address;
    self.addressLabel.text = address;
}

+ (CGFloat)getHeight {
    return 34;
}
@end
