//
//  UIView+FadeTextAnimation.h
//
//  Created by Anastasi Voitova on 14.07.12.
//  Copyright (c) 2012 Stanfy LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FadeTextAnimation)

- (void)addTextFadeAnimation;          // Default duration is 0.5
- (void)addTextFadeAnimationWithDuration:(CFTimeInterval)duration;

@end
