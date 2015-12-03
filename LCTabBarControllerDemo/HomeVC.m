//
//  HomeVC.m
//  LCTabBarControllerDemo
//
//  Created by Leo on 15/12/3.
//  Copyright © 2015年 Leo. All rights reserved.
//

#import "HomeVC.h"
#import "LCTabBarCONST.h"

@interface HomeVC ()

@end

@implementation HomeVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"HomeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = indexPath.row % 2 ? @"You can click cell" : @"Leo";
    cell.backgroundColor = indexPath.row % 2 ? LCColorForTabBar(235, 235, 235) : [UIColor whiteColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIViewController *someVC = [[UIViewController alloc] init];
    someVC.title = @"tabBar hide ok?";
    someVC.view.backgroundColor = [UIColor greenColor];
    someVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:someVC animated:YES];
}

@end
