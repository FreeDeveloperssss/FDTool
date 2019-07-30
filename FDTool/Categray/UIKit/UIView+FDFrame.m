//
//  UIView+FDFrame.m
//  FDTool
//
//  Created by ddSoul on 2019/7/30.
//  Copyright © 2019 dxl. All rights reserved.
//

#import "UIView+FDFrame.h"

@implementation UIView (FDFrame)

- (void)setFd_size:(CGSize)fd_size {
    CGRect frame = self.frame;
    frame.size = fd_size;
    self.frame = frame;
}
- (CGSize)fd_size {
    return self.frame.size;
}

- (void)setFd_x:(CGFloat)fd_x {
    CGRect frame = self.frame;
    frame.origin.x = fd_x;
    self.frame = frame;
}

- (CGFloat)fd_x {
    return self.frame.origin.x;
}

- (void)setFd_y:(CGFloat)fd_y {
    CGRect frame = self.frame;
    frame.origin.y = fd_y;
    self.frame = frame;
}

- (CGFloat)fd_y {
    return self.frame.origin.y;
}

- (void)setFd_width:(CGFloat)fd_width {
    CGRect frame = self.frame;
    frame.size.width = fd_width;
    self.frame = frame;
}

- (CGFloat)fd_width
{
    return self.frame.size.width;
}

- (void)setFd_height:(CGFloat)fd_height {
    CGRect frame = self.frame;
    frame.size.height = fd_height;
    self.frame = frame;
}

- (CGFloat)fd_height
{
    return self.frame.size.height;
}

- (void)setfd_CenterX:(CGFloat)fd_centerX
{
    CGPoint center = self.center;
    center.x = fd_centerX;
    self.center = center;
}

- (CGFloat)fd_centerX
{
    return self.center.x;
}

- (void)setfd_centerY:(CGFloat)fd_centerY
{
    CGPoint center = self.center;
    center.y = fd_centerY;
    self.center = center;
}

- (CGFloat)fd_centerY
{
    return self.center.y;
}

@end
