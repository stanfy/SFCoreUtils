//
//  UIView+FadeTextAnimation.m
//  Nemlig-iPad
//
//  Created by Anastasi Voitova on 14.07.12.
//  Copyright (c) 2012 Stanfy LLC. All rights reserved.
//

#import "UIView+FadeTextAnimation.h"

@implementation UIView (FadeTextAnimation)


- (void)addTextFadeAnimation {
   [self addTextFadeAnimationWithDuration:0.5];
}

- (void)addTextFadeAnimationWithDuration:(CFTimeInterval)duration {
   // animations
   CATransition *animation = [CATransition animation];
   animation.duration = duration;
   animation.type = kCATransitionFade;
   animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
   [self.layer addAnimation:animation forKey:@"changeTextTransition"];
}

@end
