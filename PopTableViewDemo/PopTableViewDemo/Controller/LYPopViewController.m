//
//  LYPopViewController.m
//  PopTableViewDemo
//
//  Created by 李民舟 on 16/3/8.
//  Copyright © 2016年 com.fengdikeji. All rights reserved.
//

#import "LYPopViewController.h"

#import "LYPopCell.h"
#import "LYSectionHead.h"


@interface LYPopViewController () <UITableViewDataSource,UITableViewDelegate>



@property (nonatomic, strong) NSMutableArray *addressList;
@property (nonatomic, strong) UITableView *tableView;


@end

@implementation LYPopViewController

#pragma mark - 懒加载
- (NSMutableArray *)addressList {
    if (!_addressList) {
        _addressList = [@[@"深圳人民医院",@"福田中医院",@"龙华人民医院",@"深圳北大协和医院"] mutableCopy];
    }
    
    return _addressList;
}

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //视图
    [self initView];
}


#pragma mark  视图
- (void)initView
{
    
    //1 cover
    LYCover *cover = [LYCover coverWithFrame:[UIScreen mainScreen].bounds onSuperView:nil tapHandle:^{
        [self willMoveToParentViewController:nil];
        [self removeFromParentViewController];
        [self.view removeFromSuperview];
    }];
    _cover = cover;
    
    //2 tableView
    int margin = 80;
    int screenWidth = [UIScreen mainScreen].bounds.size.width;
    int screenHeight = [UIScreen mainScreen].bounds.size.height;
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(margin, margin + 64,screenWidth - 2 * margin,screenHeight - 4 * margin - 64) style:UITableViewStylePlain];
    tableView.layer.cornerRadius = 5;
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.bounces = NO;
    [cover addSubview:tableView];
    _tableView = tableView;
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    if ([self.tableView rectForSection:0].size.height <= self.tableView.frame.size.height) {
        self.tableView.frame = CGRectMake(self.tableView.frame.origin.x, self.tableView.frame.origin.y,self.tableView.frame.size.width, [self.tableView rectForSection:0].size.height);
    }
}


#pragma mark - 代理
#pragma mark - tableView dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.addressList.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LYPopCell *cell = [LYPopCell cellWithTableView:tableView];
    cell.address = self.addressList[indexPath.row];
    return cell;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"请添加预约地址";
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [LYPopCell getHeight];
}


- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [LYSectionHead sectionHead];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [LYSectionHead getHeight];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.cellChooseHandle) {
        self.cellChooseHandle(self.addressList[indexPath.row]);
    }
}


#pragma mark - 其他

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
