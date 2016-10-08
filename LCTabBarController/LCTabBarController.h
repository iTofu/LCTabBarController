//
//  LCTabBarController.h
//  LCTabBarControllerDemo
//
//  Created by Leo on 15/12/2.
//  Copyright © 2015年 Leo. All rights reserved.
//
//  GitHub: https://github.com/iTofu/LCTabBarController
//  Blog:   http://LeoDev.me
//
//  V 1.3.5

#import <UIKit/UIKit.h>

@interface LCTabBarController : UITabBarController

/**
 *  Tabbar item title color
 */
@property (nonatomic, strong) UIColor *itemTitleColor;

/**
 *  Tabbar selected item title color
 */
@property (nonatomic, strong) UIColor *selectedItemTitleColor;

/**
 *  Tabbar item title font
 */
@property (nonatomic, strong) UIFont *itemTitleFont;

/**
 *  Tabbar item's badge title font
 */
@property (nonatomic, strong) UIFont *badgeTitleFont;

/**
 *  Tabbar item image ratio
 */
@property (nonatomic, assign) CGFloat itemImageRatio;

/**
 *  Remove origin controls, for `- popToRootViewController`
 */
- (void)removeOriginControls;

@end
