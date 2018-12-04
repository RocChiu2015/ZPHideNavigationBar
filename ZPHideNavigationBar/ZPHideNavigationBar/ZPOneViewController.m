//
//  ZPOneViewController.m
//  ZPHideNavigationBar
//
//  Created by 赵鹏 on 2018/12/4.
//  Copyright © 2018 赵鹏. All rights reserved.
//

#import "ZPOneViewController.h"

@interface ZPOneViewController () <UINavigationControllerDelegate>

@end

@implementation ZPOneViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor greenColor];
    
    self.navigationController.delegate = self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    BOOL isHomePage = [viewController isKindOfClass:[self class]];
    [self.navigationController setNavigationBarHidden:isHomePage animated:YES];
}

-(void)dealloc
{
    self.navigationController.delegate = nil;
}

@end
