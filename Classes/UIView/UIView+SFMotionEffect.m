//
// UIView(SFMotionEffect)
//
// Created by Anastasi Voitova on 04.12.13.
// Copyright (c) 2013 Stanfy LLC. All rights reserved.
//
#import "UIView+SFMotionEffect.h"


@implementation UIView (SFMotionEffect)

- (void)addMotionsWithRelativeValue:(CGFloat)value {
    UIInterpolatingMotionEffect *horizontalMotionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    horizontalMotionEffect.minimumRelativeValue = @(-value);
    horizontalMotionEffect.maximumRelativeValue = @(value);

    UIInterpolatingMotionEffect *verticalMotionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    verticalMotionEffect.minimumRelativeValue = @(-value);
    verticalMotionEffect.maximumRelativeValue = @(value);

    UIMotionEffectGroup *group = [UIMotionEffectGroup new];
    group.motionEffects = @[horizontalMotionEffect, verticalMotionEffect];
    [self addMotionEffect:group];
}


@end