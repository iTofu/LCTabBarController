//
//  HomeVC.m
//  LCTabBarControllerDemo
//
//  Created by Leo on 15/12/3.
//  Copyright © 2015年 Leo. All rights reserved.
//

#import "HomeVC.h"
#import "LCTabBarCONST.h"
#import "OtherVC.h"
#import "TwoVC.h"
#import "LCTabBarController.h"

@interface HomeVC ()

@end

@implementation HomeVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Change Item" style:UIBarButtonItemStyleDone target:self action:@selector(leftBarButtonItemClicked)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Go Message" style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonItemClicked)];
}

- (void)leftBarButtonItemClicked {
    
    self.tabBarItem.image = [UIImage imageNamed:@"tabbar_discover"];
    self.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_discover_selected"];
    self.tabBarItem.title = @"Woo!";
    
    // Needn't do this now
    // System will display the original controls so you should call this line when you change any tabBar item
//    [(LCTabBarController *)self.tabBarController removeOriginControls];
}

- (void)rightBarButtonItemClicked {
    
    [(LCTabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController setSelectedIndex:1];
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
    
    cell.textLabel.text = indexPath.row % 2 ? @"You could click cell" : @"Leo";
    cell.backgroundColor = indexPath.row % 2 ? LCColorForTabBar(235, 235, 235) : [UIColor whiteColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    TwoVC *someVC = [[TwoVC alloc] init];
    someVC.title = @"tabBar hide ok?";
    someVC.view.backgroundColor = [UIColor greenColor];
    someVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:someVC animated:YES];
}

@end
