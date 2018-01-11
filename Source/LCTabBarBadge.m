//
//  LCTabBarBadge.m
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

#import "LCTabBarBadge.h"
#import "LCTabBarCONST.h"
#import "UIImage+LCTarBarController.h"

@implementation LCTabBarBadge

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = NO;
        self.hidden = YES;
//        self.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
        
        CGFloat badgeR = 16.0;
        UIImage *bgImage = [UIImage lc_imageWithColor:LCColorForTabBar(255.0, 91.0, 54.0) size:CGSizeMake(badgeR, badgeR)];
        [self setBackgroundImage:bgImage forState:UIControlStateNormal];
    }
    return self;
}

- (void)setTabBarItemCount:(NSInteger)tabBarItemCount {
    _tabBarItemCount = tabBarItemCount;
    
    [self updateView];
}

- (void)setBadgeTitleFont:(UIFont *)badgeTitleFont {
    
    _badgeTitleFont = badgeTitleFont;
    
    self.titleLabel.font = badgeTitleFont;
}

- (void)setBadgeValue:(NSString *)badgeValue {
    
    _badgeValue = [badgeValue copy];
    
    self.hidden = !(BOOL)self.badgeValue;
    
    if (self.badgeValue) {
        
        [self setTitle:badgeValue forState:UIControlStateNormal];
        
        [self updateView];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self updateView];
}

- (void)updateView {
    CGRect frame = self.frame;
    
    if (self.badgeValue.length > 0) {
        
        CGFloat badgeW = self.currentBackgroundImage.size.width;
        CGFloat badgeH = self.currentBackgroundImage.size.height;
        
        CGSize titleSize = [self.badgeValue sizeWithAttributes:@{NSFontAttributeName : self.badgeTitleFont}];
        frame.size.width = MAX(badgeW, titleSize.width + 10);
        frame.size.height = badgeH;
        self.frame = frame;
        
    } else {
        
        frame.size.width = 12.0f;
        frame.size.height = frame.size.width;
    }
    
    frame.origin.x = self.superview.bounds.size.width * 0.5 + 12.0;
    frame.origin.y = 2.0f;
    self.frame = frame;
    
    self.layer.cornerRadius = frame.size.height * 0.5;
    self.layer.masksToBounds = YES;
}

- (UIImage *)resizedImageFromMiddle:(UIImage *)image {
    
    return [self resizedImage:image width:0.5f height:0.5f];
}

- (UIImage *)resizedImage:(UIImage *)image width:(CGFloat)width height:(CGFloat)height {
    
    return [image stretchableImageWithLeftCapWidth:image.size.width * width
                                      topCapHeight:image.size.height * height];
}

@end
