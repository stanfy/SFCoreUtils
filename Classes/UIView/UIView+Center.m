//
// UIView(Centerize)
//
// Created by Anastasi Voitova on 14.11.13.
// Copyright (c) 2013 Stanfy LLC. All rights reserved.
//
#import "UIView+Center.h"


@implementation UIView (Center)

- (void)centerInView:(UIView * )view {
    self.top = ceilf((view.height - self.height) / 2);
    self.left = ceilf((view.width - self.width) / 2);
}


- (void)centerHeightInView:(UIView * )view {
    self.top = ceilf((view.height - self.height) / 2);
}

- (void)centerWidthInView:(UIView * )view {
    self.left = ceilf((view.width - self.width) / 2);
}
@end