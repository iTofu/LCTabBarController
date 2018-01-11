//
//  TwoVC.m
//  LCTabBarControllerDemo
//
//  Created by Leo on 16/1/18.
//  Copyright © 2016年 Leo. All rights reserved.
//

#import "TwoVC.h"
#import "OtherVC.h"

@interface TwoVC ()

@end

@implementation TwoVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    addBtn.frame = CGRectMake(100, 100, 100, 100);
    [addBtn addTarget:self action:@selector(addBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addBtn];
}

- (void)addBtnClicked {
    
    OtherVC *someVC = [[OtherVC alloc] init];
    someVC.title = @"pop to rootVC";
    someVC.view.backgroundColor = [UIColor yellowColor];
    someVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:someVC animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
