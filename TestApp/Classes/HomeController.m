//
//  HomeController.m
//  TestApp
//
//  Created by 邓竺芮 on 2024/4/16.
//

#import "HomeController.h"
#import "LoginController.h"
#import "WebViewController.h"
#import "EntryReviewController.h"
#import "Tool.h"
#import <AFNetworking/AFNetworking.h>
#import "CustomJSONResponseSerializer.h"

@interface HomeController ()

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *logoutButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [logoutButton setTitle:@"退出" forState:UIControlStateNormal];
    [logoutButton addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: logoutButton];
    logoutButton.frame = CGRectMake(100, 100, 100, 50);
    
    UIButton *requestButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [requestButton setTitle:@"网络请求" forState:UIControlStateNormal];
    [requestButton addTarget:self action:@selector(request) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: requestButton];
    requestButton.frame = CGRectMake(100, 150, 100, 50);
    
    UIButton *webViewButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [webViewButton setTitle:@"网页" forState:UIControlStateNormal];
    [webViewButton addTarget:self action:@selector(turnWebView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: webViewButton];
    webViewButton.frame = CGRectMake(100, 200, 100, 50);

    UIButton *entryReviewButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [entryReviewButton setTitle:@"审核详情" forState:UIControlStateNormal];
    [entryReviewButton addTarget:self action:@selector(turnEntryReview) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: entryReviewButton];
    entryReviewButton.frame = CGRectMake(100, 250, 100, 50);
}

- (void)logout {
    UIWindow *keyWindow = [Tool getKeyWindow];
    if (keyWindow != nil) {
        LoginController *controller = [[LoginController alloc] init];
        keyWindow.rootViewController = controller;
        [keyWindow makeKeyAndVisible];
    }
}

- (void)request {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    configuration.timeoutIntervalForRequest = 10;
    configuration.timeoutIntervalForResource = 10;
    NSURL *baseURL = [NSURL URLWithString:@"http://zg.zhgdi.com:10000/"];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL sessionConfiguration:configuration];
    AFJSONRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
    manager.requestSerializer = requestSerializer;
    
    CustomJSONResponseSerializer *responseSerializer = [CustomJSONResponseSerializer serializer];
    manager.responseSerializer = responseSerializer;
    
    NSString *urlString = @"labor/home/projectHomeLaborStatistics";
    NSDictionary *params = @{
        @"deptId": @"1552585051064762369"
    };
    
    [manager POST:urlString parameters:params headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}

- (void)turnWebView
{
    WebViewController *webViewController = [[WebViewController alloc] init];
    [self presentViewController:webViewController animated:YES completion:nil];
}

- (void)turnEntryReview
{
    EntryReviewController *viewController = [[EntryReviewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    [nav pushViewController:viewController animated:YES];
}

@end
