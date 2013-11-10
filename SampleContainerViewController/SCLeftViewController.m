//
//  SCLeftViewController.m
//  SampleContainerView
//
//  Created by madeth on 2013/11/10.
//  Copyright (c) 2013年 madeth. All rights reserved.
//

#import "SCLeftViewController.h"
#import "SCChildViewController.h"

@interface SCLeftViewController ()

@end

@implementation SCLeftViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Left";
    self.view.backgroundColor = [UIColor redColor];
    
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
