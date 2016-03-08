//
//  LYCover.m
//  PopTableViewDemo
//
//  Created by 李民舟 on 16/3/8.
//  Copyright © 2016年 com.fengdikeji. All rights reserved.
//

#import "LYCover.h"

@interface LYCover () <UIGestureRecognizerDelegate>

//透明度，默认为0.5
@property (nonatomic, assign) CGFloat alpha;

//背景色,默认为blackColor
@property (nonatomic, strong) UIColor *backGroundColor;

//是否点击移除蒙版,默认Yes
@property (nonatomic,assign,getter=isTapRemoved) BOOL tapRemove;

//出现的实现，默认为0.3s
@property (nonatomic, assign) CGFloat duration;


@end

@implementation LYCover

#pragma mark - 构造方法
+ (instancetype)coverWithFrame:(CGRect)frame onSuperView:(UIView*)superView tapHandle:(void(^)(void))coverTapBlock{
    
    LYCover *cover = [[LYCover alloc]init];
    if (superView == nil) { //默认添加到windows上
        superView = [UIApplication sharedApplication].keyWindow;
    }
    [superView addSubview:cover];
    
    if(frame.size.width == 0) { //默认在视图中间
        int margin = 100;
        frame = CGRectMake(margin, margin, superView.frame.size.width - 2 * margin, superView.frame.size.height - 2 * margin);
    }
    cover.frame = frame;

    //默认属性
    cover.alpha = 0.6;
    cover.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
    cover.duration = 0.3;
    cover.tapRemove = YES;
    
    cover.coverTapHandle = coverTapBlock;
    
    
    return cover;
}

/** 快速显示蒙板 **/
+ (void)showCover {
    LYCover *cover = [LYCover coverWithFrame:CGRectZero onSuperView:nil tapHandle:nil];
    [cover show];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}
#pragma mark - 属性setter
- (void)setBackGroundColor:(UIColor *)backGroundColor {
    _backGroundColor = [backGroundColor colorWithAlphaComponent:0];
}

#pragma mark - 主要方法
/** 显示蒙板 **/
- (void)show{
    
    //渐变出现
    [UIView animateWithDuration:self.duration animations:^{
        self.backgroundColor = [self.backgroundColor colorWithAlphaComponent:self.alpha];
    }];
    
    //手势
    if (self.isTapRemoved && self.gestureRecognizers == 0) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(coverTap:)];
        [self addGestureRecognizer:tap];
        tap.delegate = self;
    }
}

/** 点击蒙板处理 **/
- (void)coverTap:(UITapGestureRecognizer*)tap {
    [self removeFromSuperview];
    
    if (self.coverTapHandle) {
        self.coverTapHandle();
    }
}


#pragma mark - gesture delegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    
    if (self.subviews.count) {
        UIView *subView = [self.subviews firstObject];
        CGPoint touchPoint = [touch locationInView:self];
        if (CGRectContainsPoint(subView.frame, touchPoint)) {
            return NO;
        }
    }
    
    return YES;
}


@end
