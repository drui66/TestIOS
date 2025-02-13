//
//  LoginController.m
//  TestApp
//
//  Created by 邓竺芮 on 2024/4/16.
//

#import "LoginController.h"
#import "HomeController.h"
#import "Tool.h"

@interface LoginController ()

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(50, 100, 100, 100);
    [button setTitle:@"登录" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: button];
}

- (void)login {
    UIWindow *keyWindow = [Tool getKeyWindow];
    if (keyWindow != nil) {
        HomeController *homeController = [[HomeController alloc] init];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:homeController];
        keyWindow.rootViewController = navigationController;
        [keyWindow makeKeyAndVisible];
    }
}

@end
