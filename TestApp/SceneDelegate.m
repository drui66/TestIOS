//
//  SceneDelegate.m
//  TestApp
//
//  Created by 邓竺芮 on 2024/4/16.
//

#import "SceneDelegate.h"
#import "LoginController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
    self.window.frame = [UIScreen mainScreen].bounds;
    
    [self setupLogger]; // 配置日志记录器
    
    LoginController *loginController = [[LoginController alloc] init];
    self.window.rootViewController = loginController;
    [self.window makeKeyAndVisible];
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}

// 配置日志记录器
- (void)setupLogger {
    // 设置日志格式
    [DDLog addLogger:[DDOSLogger sharedInstance]]; // 将日志输出到控制台
    
    // 配置文件日志器
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
    fileLogger.rollingFrequency = 60 * 60 * 24; // 日志每 24 小时滚动一次
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7; // 保留最近 7 天的日志文件
    [DDLog addLogger:fileLogger];
}


@end
