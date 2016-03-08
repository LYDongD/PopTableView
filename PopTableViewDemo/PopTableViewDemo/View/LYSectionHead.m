//
//  LYSectionHead.m
//  PopTableViewDemo
//
//  Created by 李民舟 on 16/3/8.
//  Copyright © 2016年 com.fengdikeji. All rights reserved.
//

#import "LYSectionHead.h"

@implementation LYSectionHead

+ (instancetype)sectionHead {
    LYSectionHead *sectionHead = [[NSBundle mainBundle]loadNibNamed:@"LYSctionHead" owner:nil options:nil][0];
    
    return sectionHead;
}

+ (CGFloat)getHeight {
    return 40;
}
@end
