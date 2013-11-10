//
//  SCRootViewController.m
//  SampleContainerView
//
//  Created by madeth on 2013/11/10.
//  Copyright (c) 2013年 madeth. All rights reserved.
//

#import "SCRootViewController.h"
#import "SCEmptyViewController.h"
#import "SCLeftViewController.h"
#import "SCRightViewController.h"

@interface SCRootViewController ()

@property (nonatomic, strong) UIViewController *currentViewController;

@end

@implementation SCRootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    [self.navigationController setToolbarHidden:NO animated:NO];
    self.wantsFullScreenLayout = YES;
    
    SCEmptyViewController *empty = [SCEmptyViewController new];
    SCLeftViewController *left = [SCLeftViewController new];
    UINavigationController *leftNav = [[UINavigationController alloc] initWithRootViewController:left];
    SCRightViewController *right = [SCRightViewController new];
    UINavigationController *rightNav = [[UINavigationController alloc] initWithRootViewController:right];

    [self addChildViewController:empty];
    [self addChildViewController:leftNav];
    [self addChildViewController:rightNav];
    [empty didMoveToParentViewController:self];
    [leftNav didMoveToParentViewController:self];
    [rightNav didMoveToParentViewController:self];

    self.currentViewController = [self.childViewControllers objectAtIndex:0];
    [self.view addSubview:empty.view];
    [self setDefaultViewController];
    
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *leftButton  = [[UIBarButtonItem alloc] initWithTitle:@"Left" style:UIBarButtonItemStyleBordered target:self action:@selector(leftBtnDidPush:)];
    UIBarButtonItem *rightButton  = [[UIBarButtonItem alloc] initWithTitle:@"Right" style:UIBarButtonItemStyleBordered target:self action:@selector(rightBtnDidPush:)];
    NSArray *items = [NSArray arrayWithObjects:spacer, leftButton, spacer, rightButton, spacer, nil];
    self.toolbarItems = items;
    self.navigationController.toolbar.barStyle = UIBarStyleDefault;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark -

- (void)setDefaultViewController
{
    SCEmptyViewController *empty  = [self.childViewControllers objectAtIndex:0];
        UINavigationController *leftNav  = [self.childViewControllers objectAtIndex:1];
    [self transitionFromViewController:empty toViewController:leftNav duration:0 options:0 animations:^{
    } completion:^(BOOL finished) {
    }];
    self.currentViewController = leftNav;
}


- (void)leftBtnDidPush:(id)sender
{
    UINavigationController *leftNav  = [self.childViewControllers objectAtIndex:1];
    if (self.currentViewController == leftNav) {
        UINavigationController *n = (UINavigationController*)self.currentViewController;
        [n popToRootViewControllerAnimated:YES];
    } else {
        [self transitionFromViewController:self.currentViewController toViewController:leftNav duration:0 options:0 animations:^{
        } completion:^(BOOL finished) {
        }];
        self.currentViewController = leftNav;
    }
}

- (void)rightBtnDidPush:(id)sender
{
    UINavigationController *rightNav  = [self.childViewControllers objectAtIndex:2];
    if (self.currentViewController == rightNav) {
        UINavigationController *n = (UINavigationController*)self.currentViewController;
        [n popToRootViewControllerAnimated:YES];
    } else {
        [self transitionFromViewController:self.currentViewController toViewController:rightNav duration:0 options:0 animations:^{
        } completion:^(BOOL finished) {
        }];
        self.currentViewController = rightNav;
    }
}

@end