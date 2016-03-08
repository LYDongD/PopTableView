//
//  LYCover.h
//  PopTableViewDemo
//
//  Created by 李民舟 on 16/3/8.
//  Copyright © 2016年 com.fengdikeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYCover : UIView

/** 快速显示蒙板 **/
+ (void)showCover;

/** 构造方法 **/
+ (instancetype)coverWithFrame:(CGRect)frame onSuperView:(UIView*)superView tapHandle:(void(^)(void))coverTapBlock;

/** 显示蒙板 **/
- (void)show;

/**
 *  监听蒙板点击
 */
@property (nonatomic,copy) void(^coverTapHandle)(void);
@end
