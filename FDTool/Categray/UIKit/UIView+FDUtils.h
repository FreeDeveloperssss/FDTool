//
//  UIView+FDUtils.h
//  FDTool
//
//  Created by ddSoul on 2019/7/30.
//  Copyright © 2019 dxl. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, FDAdaptScreenWidthType) {
    FDAdaptScreenWidthTypeNone = 0,
    FDAdaptScreenWidthTypeConstraint = 1<<0, /**< 对约束的constant等比例 */
    FDAdaptScreenWidthTypeFontSize = 1<<1, /**< 对字体等比例 */
    FDAdaptScreenWidthTypeCornerRadius = 1<<2, /**< 对圆角等比例 */
    FDAdaptScreenWidthTypeAll = 1<<3, /**< 对现有支持的属性等比例 */
};


/**
 * UIView的一些常用的工具方法
 */
NS_ASSUME_NONNULL_BEGIN

@interface UIView (FDUtils)

/**
 *  找到当前view所在的viewcontroler
 */
@property (readonly) UIViewController *viewController;

/**
 *  移除子视图
 */
- (void)removeAllSubviews;

/**
 *  设置圆角
 */
-(void)makeCornerRadius:(float)radius borderColor:(UIColor*)bColor borderWidth:(float)bWidth;

/**
 *  设置一边圆角
 */
- (UIView *)roundCornersOnView:(UIView *)view onTopLeft:(BOOL)tl topRight:(BOOL)tr bottomLeft:(BOOL)bl bottomRight:(BOOL)br radius:(float)radius;

/**
 遍历当前view对象的subviews和constraints，对目标进行等比例换算
 
 @param type 想要和基准屏幕等比例换算的属性类型
 @param exceptViews 需要对哪些类进行例外
 */
- (void)adaptScreenWidthWithType:(FDAdaptScreenWidthType)type
                     exceptViews:(NSArray<Class> *)exceptViews;

/**
 给UIView视图加渐变色
 
 @param fromColor 开始颜色
 @param toColor 结束颜色
 */
- (void)setColorFrom:(UIColor *)fromColor toColor:(UIColor *)toColor;

@end

NS_ASSUME_NONNULL_END
