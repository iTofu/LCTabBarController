//
//  LCTabBarController.h
//  LCTabBarControllerDemo
//
//  Created by Leo on 15/12/2.
//  Copyright © 2015年 Leo. All rights reserved.
//
//  V 1.2.7

#import <UIKit/UIKit.h>

@interface LCTabBarController : UITabBarController

/**
 *  tabbar item title color
 */
@property (nonatomic, strong) UIColor *itemTitleColor;

/**
 *  tabbar selected item title color
 */
@property (nonatomic, strong) UIColor *selectedItemTitleColor;

/**
 *  tabbar item title font
 */
@property (nonatomic, strong) UIFont *itemTitleFont;

/**
 *  tabbar item's badge title font
 */
@property (nonatomic, strong) UIFont *badgeTitleFont;

/**
 *  tabbar item image ratio
 */
@property (nonatomic, assign) CGFloat itemImageRatio;

/**
 *  Remove origin controls, for `- popToRootViewController`
 */
- (void)removeOriginControls;

@end
