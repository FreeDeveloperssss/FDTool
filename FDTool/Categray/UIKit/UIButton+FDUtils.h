//
//  UIButton+FDUtils.h
//  FDTool
//
//  Created by ddSoul on 2019/7/30.
//  Copyright © 2019 dxl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (FDUtils)

/**
 夸大按钮作用域

 @param top .
 @param right .
 @param bottom .
 @param left .
 */
- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;


/**
 扩大按钮作用域

 @param size .
 */
- (void)setEnlargeEdge:(CGFloat)size;

@end

NS_ASSUME_NONNULL_END
