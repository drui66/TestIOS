//
//  HomeController.m
//  TestApp
//
//  Created by 邓竺芮 on 2024/4/16.
//

#import "HomeController.h"
#import "LoginController.h"
#import "Tool.h"

@interface HomeController ()

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(50, 100, 100, 100);
    [button setTitle:@"退出" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: button];
    
    DDLogVerbose(@"Verbose");
    DDLogDebug(@"Debug");
    DDLogInfo(@"Info");
    DDLogWarn(@"Warn");
    DDLogError(@"Error");
}

- (void)logout {
    UIWindow *keyWindow = [Tool getKeyWindow];
    if (keyWindow != nil) {
        LoginController *controller = [[LoginController alloc] init];
        keyWindow.rootViewController = controller;
        [keyWindow makeKeyAndVisible];
    }
}

@end
