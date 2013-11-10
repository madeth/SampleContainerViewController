//
//  SCRightViewController.m
//  SampleContainerView
//
//  Created by madeth on 2013/11/10.
//  Copyright (c) 2013年 madeth. All rights reserved.
//

#import "SCRightViewController.h"
#import "SCChildViewController.h"

@interface SCRightViewController ()

@end

@implementation SCRightViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Right";
    self.view.backgroundColor = [UIColor yellowColor];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(60, 60, 200, 30);
    [btn setTitle:@"button" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnDidPush:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)btnDidPush:(id)sender
{
    SCChildViewController *vc = [SCChildViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
