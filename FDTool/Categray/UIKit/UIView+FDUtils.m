//
//  UIView+FDUtils.m
//  FDTool
//
//  Created by ddSoul on 2019/7/30.
//  Copyright © 2019 dxl. All rights reserved.
//

#import "UIView+FDUtils.h"
#import <objc/runtime.h>

//基准屏幕宽度
#define kRefereWidth 375.0
//以屏幕宽度为固定比例关系，来计算对应的值。假设：基准屏幕宽度375，floatV=10；当前屏幕宽度为750时，那么返回的值为20
#define AdaptW(floatValue) (floatValue*[[UIScreen mainScreen] bounds].size.width/kRefereWidth)

@implementation UIView (FDUtils)

/**
 *  找到当前view所在的viewcontroler
 */
- (UIViewController *)viewController {
    UIResponder *responder = self.nextResponder;
    do {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
        responder = responder.nextResponder;
    } while (responder);
    return nil;
}


/**
 *  移除子视图
 */
- (void)removeAllSubviews
{
    while (self.subviews.count)
    {
        UIView *child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}

/**
 *  设置圆角
 */
-(void)makeCornerRadius:(float)radius borderColor:(UIColor *)bColor borderWidth:(float)bWidth
{
    self.layer.borderWidth = bWidth;
    
    if (bColor != nil) {
        self.layer.borderColor = bColor.CGColor;
    }
    
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}

/**
 *  设置一边圆角
 */
- (UIView *)roundCornersOnView:(UIView *)view onTopLeft:(BOOL)tl topRight:(BOOL)tr bottomLeft:(BOOL)bl bottomRight:(BOOL)br radius:(float)radius
{
    if (tl || tr || bl || br)
    {
        UIRectCorner corner = 0; //holds the corner
        //Determine which corner(s) should be changed
        if (tl) {
            corner = corner | UIRectCornerTopLeft;
        }
        if (tr) {
            corner = corner | UIRectCornerTopRight;
        }
        if (bl) {
            corner = corner | UIRectCornerBottomLeft;
        }
        if (br) {
            corner = corner | UIRectCornerBottomRight;
        }
        
        UIView *roundedView = view;
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:roundedView.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.frame = roundedView.bounds;
        maskLayer.path = maskPath.CGPath;
        roundedView.layer.mask = maskLayer;
        return roundedView;
    }
    else
    {
        return view;
    }
}

#pragma mark - UIView约束
- (void)adaptScreenWidthWithType:(FDAdaptScreenWidthType)type
                     exceptViews:(NSArray<Class> *)exceptViews {
    if (type == FDAdaptScreenWidthTypeNone)  return;
    if (![self isExceptViewClassWithClassArray:exceptViews]) {
        
        // 是否要对约束进行等比例
        BOOL adaptConstraint = ((type & FDAdaptScreenWidthTypeConstraint) || type == FDAdaptScreenWidthTypeAll);
        
        // 是否对字体大小进行等比例
        BOOL adaptFontSize = ((type & FDAdaptScreenWidthTypeFontSize) || type == FDAdaptScreenWidthTypeAll);
        
        // 是否对圆角大小进行等比例
        BOOL adaptCornerRadius = ((type & FDAdaptScreenWidthTypeCornerRadius) || type == FDAdaptScreenWidthTypeAll);
        
        // 约束
        if (adaptConstraint) {
            [self.constraints enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull subConstraint, NSUInteger idx, BOOL * _Nonnull stop) {
                subConstraint.constant = AdaptW(subConstraint.constant);
            }];
        }
        
        // 字体大小
        if (adaptFontSize) {
            
            if ([self isKindOfClass:[UILabel class]] && ![self isKindOfClass:NSClassFromString(@"UIButtonLabel")]) {
                UILabel *labelSelf = (UILabel *)self;
                labelSelf.font = [UIFont systemFontOfSize:AdaptW(labelSelf.font.pointSize)];
            }
            else if ([self isKindOfClass:[UITextField class]]) {
                UITextField *textFieldSelf = (UITextField *)self;
                textFieldSelf.font = [UIFont systemFontOfSize:AdaptW(textFieldSelf.font.pointSize)];
            }
            else  if ([self isKindOfClass:[UIButton class]]) {
                UIButton *buttonSelf = (UIButton *)self;
                buttonSelf.titleLabel.font = [UIFont systemFontOfSize:AdaptW(buttonSelf.titleLabel.font.pointSize)];
            }
            else  if ([self isKindOfClass:[UITextView class]]) {
                UITextView *textViewSelf = (UITextView *)self;
                textViewSelf.font = [UIFont systemFontOfSize:AdaptW(textViewSelf.font.pointSize)];
            }
        }
        
        // 圆角
        if (adaptCornerRadius) {
            if (self.layer.cornerRadius) {
                self.layer.cornerRadius = AdaptW(self.layer.cornerRadius);
            }
        }
        
        [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull subView, NSUInteger idx, BOOL * _Nonnull stop) {
            // 继续对子view操作
            [subView adaptScreenWidthWithType:type exceptViews:exceptViews];
        }];
    }
}

// 当前view对象是否是例外的视图
- (BOOL)isExceptViewClassWithClassArray:(NSArray<Class> *)classArray {
    __block BOOL isExcept = NO;
    [classArray enumerateObjectsUsingBlock:^(Class  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([self isKindOfClass:obj]) {
            isExcept = YES;
            *stop = YES;
        }
    }];
    return isExcept;
}

#pragma mark - UIView渐变色
/**
 * 渐变色
 */
- (void)setColorLayer:(CAGradientLayer *)colorLayer{
    objc_setAssociatedObject(self, @selector(colorLayer), colorLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CAGradientLayer *)colorLayer{
    return objc_getAssociatedObject(self, @selector(colorLayer));
}

- (void)setColorFrom:(UIColor *)fromColor toColor:(UIColor *)toColor{
    if (self.colorLayer) {
        self.colorLayer.frame = self.bounds;
        self.colorLayer.colors = @[(__bridge id)fromColor.CGColor,(__bridge id)toColor.CGColor];
        self.colorLayer.startPoint = CGPointMake(0, .5);
        self.colorLayer.endPoint = CGPointMake(1, .5);
    }else{
        self.colorLayer = [CAGradientLayer layer];
        self.colorLayer.frame = self.bounds;
        self.colorLayer.colors = @[(__bridge id)fromColor.CGColor,(__bridge id)toColor.CGColor];
        self.colorLayer.startPoint = CGPointMake(0, .5);
        self.colorLayer.endPoint = CGPointMake(1, .5);
        [self.layer insertSublayer:self.colorLayer atIndex:0];
    }
    
}

@end
