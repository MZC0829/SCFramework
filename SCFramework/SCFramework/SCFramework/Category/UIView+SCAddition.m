//
//  UIView+SCAddition.m
//  SCFramework
//
//  Created by Angzn on 3/4/14.
//  Copyright (c) 2014 Richer VC. All rights reserved.
//

#import "UIView+SCAddition.h"
#import "SCAdaptedSystem.h"
#import "SCMath.h"
#import "SCApp.h"

@implementation UIView (SCAddition)

#pragma mark - Frame

- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGFloat)left
{
    return CGRectGetMinX(self.frame);
}

- (void)setLeft:(CGFloat)left
{
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

- (CGFloat)right
{
    return CGRectGetMaxX(self.frame);
}

- (void)setRight:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - CGRectGetWidth(frame);
    self.frame = frame;
}

- (CGFloat)top
{
    return CGRectGetMinY(self.frame);
}

- (void)setTop:(CGFloat)top
{
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

- (CGFloat)bottom
{
    return CGRectGetMaxY(self.frame);
}

- (void)setBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - CGRectGetHeight(frame);
    self.frame = frame;
}

- (CGFloat)width
{
    return CGRectGetWidth(self.frame);
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height
{
    return CGRectGetHeight(self.frame);
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGPoint)topLeft
{
    return CGPointMake(CGRectGetMinX(self.frame),
                       CGRectGetMinY(self.frame));
}

- (void)setTopLeft:(CGPoint)topLeft
{
    CGRect frame = self.frame;
    frame.origin = CGPointMake(topLeft.x,
                               topLeft.y);
    self.frame = frame;
}

- (CGPoint)topRight
{
    return CGPointMake(CGRectGetMaxX(self.frame),
                       CGRectGetMinY(self.frame));
}

- (void)setTopRight:(CGPoint)topRight
{
    CGRect frame = self.frame;
    frame.origin = CGPointMake(topRight.x - CGRectGetWidth(frame),
                               topRight.y);
    self.frame = frame;
}

- (CGPoint)bottomLeft
{
    return CGPointMake(CGRectGetMinX(self.frame),
                       CGRectGetMaxY(self.frame));
}

- (void)setBottomLeft:(CGPoint)bottomLeft
{
    CGRect frame = self.frame;
    frame.origin = CGPointMake(bottomLeft.x,
                               bottomLeft.y - CGRectGetHeight(frame));
    self.frame = frame;
}

- (CGPoint)bottomRight
{
    return CGPointMake(CGRectGetMaxX(self.frame),
                       CGRectGetMaxY(self.frame));
}

- (void)setBottomRight:(CGPoint)bottomRight
{
    CGRect frame = self.frame;
    frame.origin = CGPointMake(bottomRight.x - CGRectGetWidth(frame),
                               bottomRight.y - CGRectGetHeight(frame));
    self.frame = frame;
}

- (CGPoint)middle
{
    return CGPointMake(CGRectGetWidth(self.frame) / 2.0,
                       CGRectGetHeight(self.frame) / 2.0);
}

- (CGSize)orientationSize
{
    BOOL swap = !SCiOS8OrLater() && [SCApp landscape];
    return swap ? SCSizeSWAP(self.size) : self.size;
}

- (CGFloat)orientationWidth
{
    return self.orientationSize.width;
}

- (CGFloat)orientationHeight
{
    return self.orientationSize.height;
}

- (CGPoint)orientationMiddle
{
    return CGPointMake(self.orientationSize.width / 2.0,
                       self.orientationSize.height / 2.0);
}

- (void)setWidth:(CGFloat)width rightAlignment:(BOOL)rightAlignment
{
    if (rightAlignment) {
        CGFloat right = self.right;
        self.width = width;
        self.right = right;
    } else {
        self.width = width;
    }
}

- (void)setHeight:(CGFloat)height bottomAlignment:(BOOL)bottomAlignment
{
    if (bottomAlignment) {
        CGFloat bottom = self.bottom;
        self.height = height;
        self.bottom = bottom;
    } else {
        self.height = height;
    }
}

- (void)setSize:(CGSize)size anchor:(SCUIViewAnchorPosition)anchor
{
    switch (anchor) {
        case SCUIViewAnchorTopLeft: {
            CGPoint topLeft = self.topLeft;
            self.size = size;
            self.topLeft = topLeft;
            break;
        }
        case SCUIViewAnchorTopRight: {
            CGPoint topRight = self.topRight;
            self.size = size;
            self.topRight = topRight;
            break;
        }
        case SCUIViewAnchorBottomLeft: {
            CGPoint bottomLeft = self.bottomLeft;
            self.size = size;
            self.bottomLeft = bottomLeft;
            break;
        }
        case SCUIViewAnchorBottomRight: {
            CGPoint bottomRight = self.bottomRight;
            self.size = size;
            self.bottomRight = bottomRight;
            break;
        }
        case SCUIViewAnchorCenter: {
            CGPoint center = self.center;
            self.size = size;
            self.center = center;
            break;
        }
        default:
            break;
    }
}

#pragma mark - Border radius

/**
 *  @brief 设置圆角
 *
 *  @param cornerRadius 圆角半径
 */
- (void)rounded:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}

/**
 *  @brief 设置圆角和边框
 *
 *  @param cornerRadius 圆角半径
 *  @param borderWidth  边框宽度
 *  @param borderColor  边框颜色
 */
- (void)rounded:(CGFloat)cornerRadius width:(CGFloat)borderWidth color:(UIColor *)borderColor
{
    self.layer.cornerRadius = cornerRadius;
    self.layer.borderWidth = borderWidth;
    self.layer.borderColor = [borderColor CGColor];
    self.layer.masksToBounds = YES;
}

/**
 *  @brief 设置边框
 *
 *  @param borderWidth 边框宽度
 *  @param borderColor 边框颜色
 */
- (void)border:(CGFloat)borderWidth color:(UIColor *)borderColor
{
    self.layer.borderWidth = borderWidth;
    self.layer.borderColor = [borderColor CGColor];
    self.layer.masksToBounds = YES;
}

#pragma mark - Load Nib

/**
 *  @brief 从Xib加载视图
 */
+ (id)loadFromNib
{
    NSString *nibName = NSStringFromClass([self class]);
    NSArray *elements = [[NSBundle mainBundle] loadNibNamed:nibName
                                                      owner:nil
                                                    options:nil];
    for ( NSObject *anObject in elements ) {
        if ( [anObject isKindOfClass:[self class]] ) {
            return anObject;
        }
    }
    return nil;
}

#pragma mark - Animation

+ (void)animateFollowKeyboard:(NSDictionary *)userInfo
                   animations:(void(^)(NSDictionary *userInfo))animations
                   completion:(void (^)(BOOL finished))completion
{
    NSTimeInterval animationDuration;
    UIViewAnimationCurve animationCurve;
    
    [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey]
     getValue:&animationDuration];
    [[userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey]
     getValue:&animationCurve];
    
    UIViewAnimationOptions options = ((animationCurve << 16) |
                                      UIViewAnimationOptionBeginFromCurrentState);
    
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:options
                     animations:^{
                         if (animations) {
                             animations(userInfo);
                         }
                     } completion:completion];
}

#pragma mark - Public Method

- (UIView *)firstResponder
{
    if ([self isFirstResponder]) {
        return self;
    }
    UIView *firstResponder = nil;
    NSArray *subviews = self.subviews;
    for (UIView *subview in subviews) {
        firstResponder = [subview firstResponder];
        if (firstResponder) {
            return firstResponder;
        }
    }
    return nil;
}

@end
