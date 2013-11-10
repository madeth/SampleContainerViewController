//
//  SCChildViewController.m
//  SampleContainerView
//
//  Created by madeth on 2013/11/10.
//  Copyright (c) 2013年 madeth. All rights reserved.
//

#import "SCChildViewController.h"

@interface SCChildViewController ()

@end

@implementation SCChildViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.title = @"child";
    self.view.backgroundColor = [UIColor grayColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
