//
//  UIView+FDFrame.h
//  FDTool
//
//  Created by ddSoul on 2019/7/30.
//  Copyright © 2019 dxl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/**
 * 快速获取frame一些属性
 */
@interface UIView (FDFrame)

@property (nonatomic, assign) CGFloat fd_x;
@property (nonatomic, assign) CGFloat fd_y;
@property (nonatomic, assign) CGFloat fd_centerX;
@property (nonatomic, assign) CGFloat fd_centerY;
@property (nonatomic, assign) CGFloat fd_width;
@property (nonatomic, assign) CGFloat fd_height;
@property (nonatomic, assign) CGSize fd_size;

@end

NS_ASSUME_NONNULL_END
