//
//  ViewController.m
//  bugDemo
//
//  Created by 彭帅 on 16/6/1.
//  Copyright © 2016年 彭帅. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 64;
    self.navigationController.navigationBar.translucent = NO;
    self.tableView.tableFooterView = [UIView new];
}

//去掉组头的粘滞性----正常情况下
/**
 原理：
    该方法，其实是将tableView的contentInset向上挪动了一个组头的高度，因此，
 并不是实际意义上的将组头给干掉了，而是把显示组头视图的位置向上挪动了个组头的高度，
 挪出了眼睛的可视距离之外，因此，实现了取消组头粘滞性的效果。
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat headerHeight = 44;
    if (scrollView == self.tableView) {
        if (scrollView.contentOffset.y <= headerHeight && scrollView.contentOffset.y >= 0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        }else{
            
            if (scrollView.contentOffset.y > headerHeight) {
                scrollView.contentInset = UIEdgeInsetsMake(-headerHeight, 0, 0, 0);
            }
        }
        NSLog(@"%@",NSStringFromUIEdgeInsets(scrollView.contentInset));
    
    NSLog(@"%@",NSStringFromCGPoint(scrollView.contentOffset));
    }
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger num = 0;
    if (section == 0) {
        num = 3;
    }else{
        num = 8;
    }
    
    return num;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *cellID = @"CELL";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"这是第%ld组第%ld行",indexPath.section,indexPath.row];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *currentView = nil;
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
    switch (section) {
        case 0:
//            headView.backgroundColor = [UIColor orangeColor];
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
    if (section == 0) {
        height = 0;
    }else{
        height = 44;
    }
    return height;
}



@end
