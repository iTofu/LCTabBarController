//
//  OtherVC.m
//  LCTabBarControllerDemo
//
//  Created by Leo on 16/1/18.
//  Copyright © 2016年 Leo. All rights reserved.
//

#import "OtherVC.h"
#import "LCTabBarController.h"

@interface OtherVC ()

@end

@implementation OtherVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    addBtn.frame = CGRectMake(100, 100, 100, 100);
    [addBtn addTarget:self action:@selector(addBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addBtn];
}

- (void)addBtnClicked {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    /**
     * Call this for iOS 11.0-
     *
     * You could also add this method to your custom navigationController's method: `-popToRootViewControllerAnimated:`, like this:
     *
     * - (NSArray *)popToRootViewControllerAnimated:(BOOL)animated {
     *     [super popToRootViewControllerAnimated:animated];
     *
     *     if ([UIDevice currentDevice].systemVersion.floatValue < 11.0) {
     *         [(LCTabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController removeOriginControls];
     *     }
     * }
     */
    if ([UIDevice currentDevice].systemVersion.floatValue < 11.0) {
        [(LCTabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController removeOriginControls];
    }
}

@end
