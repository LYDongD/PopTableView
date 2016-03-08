//
//  LYPopViewController.h
//  PopTableViewDemo
//
//  Created by 李民舟 on 16/3/8.
//  Copyright © 2016年 com.fengdikeji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYCover.h"


@interface LYPopViewController : UIViewController


@property (nonatomic, weak) LYCover *cover;

/**
 *  监听cell点击
 */
@property (nonatomic,copy) void(^cellChooseHandle)(NSString *address);

@end
