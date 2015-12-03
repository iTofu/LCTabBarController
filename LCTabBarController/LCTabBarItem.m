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
        
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:LCTabBarItemTitleFontSize];
        [self setTitleColor:LC_TABBAR_ITEM_TITLE_COLOR forState:UIControlStateNormal];
        [self setTitleColor:LC_TABBAR_ITEM_TITLE_COLOR_HL forState:UIControlStateSelected];
        
        [self addSubview:({
            
            LCTabBarBadge *tabBarBadge = [[LCTabBarBadge alloc] init];
            tabBarBadge.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
            self.tabBarBadge = tabBarBadge;
        })];
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
    
    CGRect frame = self.tabBarBadge.frame;
    CGFloat badgeX = self.frame.size.width - frame.size.width - 12.0f;
    CGFloat badgeY = 2.0f;
    frame.origin.x = badgeX;
    frame.origin.y = badgeY;
    self.tabBarBadge.frame = frame;
}

#pragma mark - Reset TabBarItem

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * LCTabBarItemImageRatio;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    
    CGFloat titleX = 0;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleY = contentRect.size.height * LCTabBarItemImageRatio - 5.0f;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(titleX, titleY, titleW, titleH);
}

- (void)setHighlighted:(BOOL)highlighted {}

@end
