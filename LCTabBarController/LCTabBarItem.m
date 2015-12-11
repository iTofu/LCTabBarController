//
//  LCTabBarItem.m
//  LCTabBarControllerDemo
//
//  Created by Leo on 15/12/2.
//  Copyright © 2015年 Leo. All rights reserved.
//

#import "LCTabBarItem.h"
#import "LCTabBarBadge.h"
#import "LCTabBarCONST.h"

@interface LCTabBarItem ()

@property (nonatomic, strong) LCTabBarBadge *tabBarBadge;

@end

@implementation LCTabBarItem

- (void)dealloc {
    
    [self.tabBarItem removeObserver:self forKeyPath:@"badgeValue"];
    [self.tabBarItem removeObserver:self forKeyPath:@"title"];
    [self.tabBarItem removeObserver:self forKeyPath:@"image"];
    [self.tabBarItem removeObserver:self forKeyPath:@"selectedImage"];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:LCTabBarItemTitleFontSize];
        [self setTitleColor:LC_TABBAR_ITEM_TITLE_COLOR forState:UIControlStateNormal];
        [self setTitleColor:LC_TABBAR_ITEM_TITLE_COLOR_SEL forState:UIControlStateSelected];
        
        LCTabBarBadge *tabBarBadge = [[LCTabBarBadge alloc] init];
        self.tabBarBadge = tabBarBadge;
        [self addSubview:tabBarBadge];
    }
    return self;
}

- (void)setTabBarItem:(UITabBarItem *)tabBarItem {
    
    _tabBarItem = tabBarItem;
    
    [tabBarItem addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [tabBarItem addObserver:self forKeyPath:@"title" options:0 context:nil];
    [tabBarItem addObserver:self forKeyPath:@"image" options:0 context:nil];
    [tabBarItem addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    [self setTitle:self.tabBarItem.title forState:UIControlStateNormal];
    [self setImage:self.tabBarItem.image forState:UIControlStateNormal];
    [self setImage:self.tabBarItem.selectedImage forState:UIControlStateSelected];
    
    self.tabBarBadge.badgeValue = self.tabBarItem.badgeValue;
}

#pragma mark - Reset TabBarItem

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    
    CGFloat imageX = 5.0f;
    CGFloat imageY = 5.0f;
    CGFloat imageW = contentRect.size.width - 10.0f;
    CGFloat imageH = contentRect.size.height * LCTabBarItemImageRatio - 10.0f;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    
    CGFloat titleX = 0;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleY = contentRect.size.height * LCTabBarItemImageRatio + (LCTabBarItemImageRatio == 1.0f ? 100.0f : -5.0f);
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(titleX, titleY, titleW, titleH);
}

- (void)setHighlighted:(BOOL)highlighted {}

@end
