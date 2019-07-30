//
//  UIImage+FDUtils.h
//  FDTool
//
//  Created by ddSoul on 2019/7/30.
//  Copyright © 2019 dxl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (FDUtils)

/**
 UIImage更改颜色

 @param color 颜色
 @return UIImage
 */
+ (UIImage *)imageWithColor:(UIColor *)color;


/**
 UIImage更改颜色
 
 @param color 颜色
 @param size 更改的大小
 @return UIImage
 */
+ (UIImage *)imageWithColor:(UIColor *)color
                       size:(CGSize)size;

@end

#pragma mark - UIColor
@interface UIColor (FDUtils)

+ (UIColor *)colorForHex:(NSString *)hexColor;

@end


NS_ASSUME_NONNULL_END
