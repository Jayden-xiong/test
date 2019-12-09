//
//  ViewController.m
//  TableViewTest
//
//  Created by Nothing on 2019/12/9.
//  Copyright © 2019 Nothing. All rights reserved.
//

#import "ViewController.h"
// 屏幕的高度
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height
// 屏幕的宽度
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
@interface ViewController ()<UITableViewDelegate , UITableViewDataSource>
@property (nonatomic , strong)UITableView * userCenterTabelView;
@property (strong ,nonatomic) UIView *userCenterHeaderView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self credteUI];
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)credteUI{
    
    [self.view addSubview:self.userCenterTabelView];
}

-(UITableView *)userCenterTabelView{
    
    if (!_userCenterTabelView) {
        
        _userCenterTabelView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, kScreenWidth, kScreenHeight+64) style:UITableViewStyleGrouped];
        _userCenterTabelView.showsVerticalScrollIndicator = NO;
        _userCenterTabelView.showsHorizontalScrollIndicator = NO;
        _userCenterTabelView.tableHeaderView = self.userCenterHeaderView;
        _userCenterTabelView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        //iOS11默认开启Self-Sizing，关闭Self-Sizing即可
        _userCenterTabelView.estimatedRowHeight = 0;
        _userCenterTabelView.estimatedSectionHeaderHeight = 0;
        _userCenterTabelView.estimatedSectionFooterHeight = 0;
//        _userCenterTabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _userCenterTabelView.dataSource = self;
        _userCenterTabelView.delegate = self;
        _userCenterTabelView.backgroundColor = [UIColor yellowColor];
        if (@available(iOS 11.0, *)) {
             _userCenterTabelView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
         } else {
             _userCenterTabelView.automaticallyAdjustsScrollIndicatorInsets = NO;
         }
    }
    return _userCenterTabelView;
}

//header和第一个cell的间距
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}
//设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * idf = @"cell123";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idf];
        if(!cell){
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:idf];
            //去掉点击效果
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            //设置cell右侧样式
//            cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
            cell.backgroundColor = [UIColor redColor];
        }
    return cell;
}

#pragma mark - deletegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
        return 4;
    
    
}

- (UIView *)userCenterHeaderView{
    if (!_userCenterHeaderView) {
        _userCenterHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 230)];//300
        _userCenterHeaderView.backgroundColor = [UIColor whiteColor];
//        _userCenterHeaderView.backgroundColor = [UIColor darkGrayColor];
    }
    return _userCenterHeaderView;
}
@end
