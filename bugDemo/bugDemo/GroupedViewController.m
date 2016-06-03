//
//  GroupedViewController.m
//  bugDemo
//
//  Created by pengshuai on 16/6/3.
//  Copyright © 2016年 彭帅. All rights reserved.
//

#import "GroupedViewController.h"

@interface GroupedViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation GroupedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 5;
    }else{
        return 6;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *CELLID = @"GROUPEDCELL";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLID forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld组%ld行",indexPath.section,indexPath.row];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:  (NSInteger)section{
    UIView *currentView = nil;
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
    switch (section) {
        case 0:
            currentView = nil;
            break;
        case 1:
        {
            headView.backgroundColor = [UIColor blueColor];
        }
            break;
        case 2:
        {
            headView.backgroundColor = [UIColor redColor];
        }
            break;
        case 3:
        {
            headView.backgroundColor = [UIColor purpleColor];
        }
            break;
        case 4:
        {
            headView.backgroundColor = [UIColor darkGrayColor];
        }
            break;
        default:
            break;
    }
    currentView = headView;
    return currentView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    CGFloat height = 0;
    /** 第一组的组头高度为0 */
    if (section == 0) {
        height = 0.01;//注意如果设置成0,则还会有默认高度出现
    }else{
        height = 44;
    }
    return height;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
@end
