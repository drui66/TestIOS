//
//  Tool.m
//  TestApp
//
//  Created by 邓竺芮 on 2024/4/16.
//

#import <UIKit/UIKit.h>
#import "Tool.h"

@implementation Tool

+ (UIWindow *)getKeyWindow {
    NSArray<UIScene *> *sceneArray = [UIApplication sharedApplication].connectedScenes.allObjects;
    __block UIWindow *keyWindow;
    [sceneArray enumerateObjectsUsingBlock:^(UIScene * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[UIWindowScene class]]) {
            if (obj.activationState == UISceneActivationStateForegroundActive) {
                UIWindowScene *windowScene = (UIWindowScene *)obj;
                if (@available(iOS 15.0, *)) {
                    keyWindow = windowScene.keyWindow;
                    *stop = true;
                } else {
                    for (UIWindow *window in windowScene.windows) {
                        if (window.isKeyWindow) {
                            keyWindow = window;
                            *stop = true;
                        }
                    }
                }
            }
        }
    }];
    
    return keyWindow;
}

@end
