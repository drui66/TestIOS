//
//  WebViewController.m
//  TestApp
//
//  Created by 邓竺芮 on 2024/6/25.
//

#import "WebViewController.h"
#import <WebKit/WebKit.h>

@interface WebViewController ()<WKNavigationDelegate>

@property (strong, nonatomic) WKWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建并配置WKWebView
    self.webView = [[WKWebView alloc] initWithFrame:self.view.frame];
    self.webView.navigationDelegate = self;
    [self.view addSubview:self.webView];
        
    // 加载URL
    NSURL *url = [NSURL URLWithString:@"http://zg.zhgdi.com/#/ios/service"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

 

@end
