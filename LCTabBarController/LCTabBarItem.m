//
//  LCTabBarItem.m
//  LCTabBarControllerDemo
//
//  Created by Leo on 15/12/2.
//  Copyright © 2015 Leo <leodaxia@gmail.com>
//
//  Copyright (c) 2015-2017 Leo
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

#import "LCTabBarItem.h"
#import "LCTabBarBadge.h"
#import "LCTabBarCONST.h"

@interface LCTabBarItem ()

@property (nonatomic, weak) LCTabBarBadge *tabBarBadge;

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
        CGSize size = self.bounds.size;
        
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image        = self.tabBarItem.image;
        imageView.contentMode  = UIViewContentModeCenter;
        imageView.frame        = CGRectMake(0, 0, size.width, size.height * self.itemImageRatio);
        [self addSubview:imageView];
        
        UILabel *titleLabel      = [[UILabel alloc] init];
        titleLabel.font          = self.itemTitleFont;
        titleLabel.textColor     = self.itemTitleColor;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        CGFloat titleY           = size.height * self.itemImageRatio + (self.itemImageRatio == 1.0f ? 100.0f : -5.0f);
        titleLabel.frame         = CGRectMake(0, titleY, size.width, size.height - titleY);
        [self addSubview:titleLabel];
        
        LCTabBarBadge *tabBarBadge = [[LCTabBarBadge alloc] init];
        [self addSubview:tabBarBadge];
        
        _imageView   = imageView;
        _titleLabel  = titleLabel;
        _tabBarBadge = tabBarBadge;
    }
    return self;
}

- (instancetype)initWithItemImageRatio:(CGFloat)itemImageRatio {
    if (self = [super init]) {
        self.itemImageRatio = itemImageRatio;
    }
    return self;
}

- (void)updateViewContent {
    if (self.isSelected) {
        self.imageView.image      = self.tabBarItem.selectedImage;
        self.titleLabel.textColor = self.selectedItemTitleColor;
    } else {
        self.imageView.image      = self.tabBarItem.image;
        self.titleLabel.textColor = self.itemTitleColor;
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGSize size           = self.bounds.size;
    self.imageView.frame  = CGRectMake(0, 0, size.width, size.height * self.itemImageRatio);
    CGFloat titleY        = size.height * self.itemImageRatio + (self.itemImageRatio == 1.0f ? 100.0f : -5.0f);
    self.titleLabel.frame = CGRectMake(0, titleY, size.width, size.height - titleY);
}

#pragma mark -

- (void)setSelected:(BOOL)selected {
    _selected = selected;
    
    [self updateViewContent];
}

- (void)setTabBarItemCount:(NSInteger)tabBarItemCount {
    _tabBarItemCount = tabBarItemCount;
    
    self.tabBarBadge.tabBarItemCount = tabBarItemCount;
}

- (void)setItemImageRatio:(CGFloat)itemImageRatio {
    _itemImageRatio = itemImageRatio;
    
    [self setNeedsLayout];
}

- (void)setItemTitleFont:(UIFont *)itemTitleFont {
    _itemTitleFont = itemTitleFont;
    
    self.titleLabel.font = itemTitleFont;
}

- (void)setItemTitleColor:(UIColor *)itemTitleColor {
    _itemTitleColor = itemTitleColor;
}

- (void)setSelectedItemTitleColor:(UIColor *)selectedItemTitleColor {
    _selectedItemTitleColor = selectedItemTitleColor;
}

- (void)setBadgeTitleFont:(UIFont *)badgeTitleFont {
    
    _badgeTitleFont = badgeTitleFont;
    
    self.tabBarBadge.badgeTitleFont = badgeTitleFont;
}

#pragma mark -


- (void)setTabBarItem:(UITabBarItem *)tabBarItem {
    
    _tabBarItem = tabBarItem;
    
    [tabBarItem addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [tabBarItem addObserver:self forKeyPath:@"title" options:0 context:nil];
    [tabBarItem addObserver:self forKeyPath:@"image" options:0 context:nil];
    [tabBarItem addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:LCNotificationTabBarItemChanged object:nil];
    
    [self updateViewContent];
    
    self.titleLabel.text = self.tabBarItem.title;
    self.tabBarBadge.badgeValue = self.tabBarItem.badgeValue;
}

#pragma mark - Reset TabBarItem

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    
    CGFloat imageX = 0.f;
    CGFloat imageY = 0.f;
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * self.itemImageRatio;
    
    return CGRectMake(imageX, imageY, imageW, imageH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    
    CGFloat titleX = 0.f;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleY = contentRect.size.height * self.itemImageRatio + (self.itemImageRatio == 1.0f ? 100.0f : -5.0f);
    CGFloat titleH = contentRect.size.height - titleY;
    
    return CGRectMake(titleX, titleY, titleW, titleH);
}

- (void)setHighlighted:(BOOL)highlighted {}

@end
