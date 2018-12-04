//
//  ZPViewController.m
//  ZPHideNavigationBar
//
//  Created by 赵鹏 on 2018/12/4.
//  Copyright © 2018 赵鹏. All rights reserved.
//

/**
 视图控制器栈(UINavigationController)里面的所有视图控制器如果不做特殊处理的话都会有导航栏(navigationBar)，包括最底层的视图控制器。
 
 隐藏视图控制器的导航栏有如下的两种方法：
 1、在viewWillAppear方法中撰写"[self.navigationController setNavigationBarHidden:YES animated:animated];"代码，并且同时需要在viewWillDisappear方法中撰写"[self.navigationController setNavigationBarHidden:NO animated:animated];"代码；
 2、需要实现<UINavigationControllerDelegate>协议，并且实现协议里面相应的方法。
 
 当视图控制器栈(UINavigationController)里面的最底层视图控制器不需要隐藏导航栏，并且此后再push到这个视图控制器栈中的其他视图控制器需要隐藏导航栏时，则在需要隐藏导航栏的视图控制器中使用上述的1或2方法都可以达到目的；
 当视图控制器栈里面的最底层视图控制器需要隐藏导航栏，同时此后再push到这个视图控制器栈中的其他视图控制器也需要隐藏导航栏时，如果在该视图控制器栈中的所有视图控制器都中都使用上述的1方法的话，则运行之后会出现从最底层的视图控制器push到一个新视图控制器时，新页面的顶部有导航栏一闪而过的效果，显然这种效果是不好的。只有在该视图控制器栈中的所有视图控制器中都使用上述的2方法才能克服在页面转场的时候出现的那种“一闪而过”的效果，完成页面之间的完美转场。
 
 如果视图控制器栈里面的所有视图控制器（包括最底层的）都需要隐藏导航栏的话，则推荐每个视图控制器都使用上述的2方法。切忌1和2方法混用，如果混用的话会造成意想不到的bug；
 在视图控制器销毁的时候要把delegate置为nil。
 */
#import "ZPViewController.h"
#import "ZPOneViewController.h"

@interface ZPViewController () <UINavigationControllerDelegate>

@end

@implementation ZPViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blueColor];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    btn.center = self.view.center;
    [btn setTitle:@"下一页" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    self.navigationController.delegate = self;
}

//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//
//    [self.navigationController setNavigationBarHidden:YES animated:animated];
//}

//-(void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//
//    [self.navigationController setNavigationBarHidden:NO animated:animated];
//}

#pragma mark ————— 点击“下一页”按钮 —————
-(void)clickButton
{
    ZPOneViewController *oneVC = [[ZPOneViewController alloc] init];
    [self.navigationController pushViewController:oneVC animated:YES];
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    BOOL isHomePage = [viewController isKindOfClass:[self class]];
    [self.navigationController setNavigationBarHidden:isHomePage animated:YES];
}

/**
 在VC销毁的时候要把delegate置为nil。
 */
-(void)dealloc
{
    self.navigationController.delegate = nil;
}

@end
