//
//  UIImage+LCTarBarController.m
//  LCTabBarController
//
//  Created by Leo on 2018/1/11.
//

#import "UIImage+LCTarBarController.h"

@implementation UIImage (LCTarBarController)

+ (instancetype)lc_imageWithColor:(UIColor *)color {
    return [self lc_imageWithColor:color size:CGSizeMake(10, 10)];
}

+ (instancetype)lc_imageWithColor:(UIColor *)color size:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    
//    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, size.width, size.height) cornerRadius:size.height * 0.5];
//
//    [bezierPath fill];
    
    CGContextFillRect(context, (CGRect){.size = size});
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
