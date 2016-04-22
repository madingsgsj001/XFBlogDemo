//
//  LPTranslucentNavigationController.m
//  LPNavigationController
//
//  Created by XuYafei on 16/4/14.
//  Copyright © 2016年 loopeer. All rights reserved.
//

#import "LPTranslucentViewController.h"
#import "LPTranslucentNavigationController.h"

@interface LPTranslucentNavigationController () <UINavigationControllerDelegate>

@end

@implementation LPTranslucentNavigationController

- (void)pushViewController:(LPTranslucentViewController *)viewController animated:(BOOL)animated {
    LPTranslucentViewController *currentVC = self.viewControllers.lastObject;
    if (![viewController useTransparentNavigationBar] && ![currentVC useTransparentNavigationBar]) {
        self.shouldAddFakeNavigationBar = NO;
    } else {
        self.shouldAddFakeNavigationBar = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    LPTranslucentViewController *previousVC = self.viewControllers[self.viewControllers.count - 2];
    LPTranslucentViewController *currentVC = self.viewControllers.lastObject;
    if (![currentVC useTransparentNavigationBar] && ![previousVC useTransparentNavigationBar]) {
        self.shouldAddFakeNavigationBar = NO;
    } else {
        self.shouldAddFakeNavigationBar = YES;
    }
    return [super popViewControllerAnimated:animated];
}

@end
