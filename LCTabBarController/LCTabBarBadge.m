//
//  LCTabBarBadge.m
//  LCTabBarControllerDemo
//
//  Created by Leo on 15/12/2.
//  Copyright © 2015年 Leo. All rights reserved.
//

#import "LCTabBarBadge.h"
#import "LCTabBarCONST.h"

@implementation LCTabBarBadge

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = NO;
        self.hidden = YES;
        self.titleLabel.font = [UIFont systemFontOfSize:LCTabBarBadgeTitleFontSize];
//        self.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
        
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"LCTabBarController" ofType:@"bundle"];
        NSString *imagePath = [bundlePath stringByAppendingPathComponent:@"LCTabBarBadge@2x.png"];
        [self setBackgroundImage:[self resizedImageFromMiddle:[UIImage imageWithContentsOfFile:imagePath]]
                        forState:UIControlStateNormal];
    }
    return self;
}

- (void)setBadgeValue:(NSString *)badgeValue {
    
    _badgeValue = [badgeValue copy];
    
    self.hidden = !(BOOL)self.badgeValue;
    
    if (self.badgeValue) {
        
        [self setTitle:badgeValue forState:UIControlStateNormal];
        
        CGRect frame = self.frame;
        
        if (self.badgeValue.length > 0) {
            
            CGFloat badgeW = self.currentBackgroundImage.size.width;
            CGFloat badgeH = self.currentBackgroundImage.size.height;
            
            CGSize titleSize = [badgeValue sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:LCTabBarBadgeTitleFontSize]}];
            frame.size.width = MAX(badgeW, titleSize.width + 10);
            frame.size.height = badgeH;
            self.frame = frame;
            
        } else {
            
            frame.size.width = 12.0f;
            frame.size.height = frame.size.width;
        }
        
        frame.origin.x = 58.0f * [UIScreen mainScreen].bounds.size.width / 375;
        frame.origin.y = 2.0f;
        self.frame = frame;
    }
}

- (UIImage *)resizedImageFromMiddle:(UIImage *)image {
    
    return [self resizedImage:image width:0.5f height:0.5f];
}

- (UIImage *)resizedImage:(UIImage *)image width:(CGFloat)width height:(CGFloat)height {
    
    return [image stretchableImageWithLeftCapWidth:image.size.width * width
                                      topCapHeight:image.size.height * height];
}

@end
