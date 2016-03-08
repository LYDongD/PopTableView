//
//  ViewController.m
//  PopTableViewDemo
//
//  Created by 李民舟 on 16/3/8.
//  Copyright © 2016年 com.fengdikeji. All rights reserved.
//

#import "ViewController.h"

#import "LYCover.h"
#import "LYPopViewController.h"

@interface ViewController ()

@property (nonatomic, strong) LYPopViewController *popVC;


- (IBAction)showPopTableView:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showPopTableView:(UIButton *)sender {
    
    //1 添加popView
    self.popVC = [[LYPopViewController alloc]init];
    [self addChildViewController:self.popVC];
    [self.view addSubview:self.popVC.view];
    [self.popVC didMoveToParentViewController:self];
    
    //2 显示
    [self.popVC.cover show];
    
    //3 监听地址选择
    self.popVC.cellChooseHandle = ^(NSString* address) {
        NSLog(@"address --> %@",address);
    };
    
}
@end
