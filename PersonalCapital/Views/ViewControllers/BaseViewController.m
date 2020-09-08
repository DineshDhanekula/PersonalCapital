//
//  BaseViewController.m
//  PersonalCapital
//
//  Created by Dinesh Kumar Dhanekula on 9/7/20.
//  Copyright © 2020 Dinesh Kumar Dhanekula. All rights reserved.
//

#import "BaseViewController.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self createActivityIndicator];
}

- (void) createActivityIndicator {
    self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    self.activityIndicator.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.activityIndicator];
    self.activityIndicator.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
}

@end
