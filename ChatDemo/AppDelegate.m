//
//  AppDelegate.m
//  ChatDemo
//
//  Created by Rain on 16/12/6.
//  Copyright © 2016年 rain. All rights reserved.
//

#import "AppDelegate.h"
#import <RongIMKit/RongIMKit.h>
#import "ChatListViewController.h"

#define NameToken1 @"9ysREPvgHI60YognzZuLpczPLUXYr5CKCTJrnbe1w7ie/tB2zZok2m5Yb/BaXyb7wYc5VbfTiv6wbrf27wFRXQ=="
#define NameToken2 @"DbjEuennptKArPi5lI58TdZb1LiQ/V+ISGbIAtjbj1dRQMb2RX95qu0/dLpbREYQY7tklORw41Y="

@interface AppDelegate ()<RCIMUserInfoDataSource>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    ChatListViewController *chatListVC = [[ChatListViewController alloc] init];
    UINavigationController *navChatListVC = [[UINavigationController alloc] initWithRootViewController:chatListVC];
    navChatListVC.navigationBar.hidden = true;
    self.window.rootViewController = navChatListVC;
    [self.window makeKeyAndVisible];
    
    
    [[RCIM sharedRCIM] initWithAppKey:@"ik1qhw09if3yp"];
    [[RCIM sharedRCIM] setUserInfoDataSource:self];
    
    [[RCIM sharedRCIM] connectWithToken:NameToken2 success:^(NSString *userId) {
        NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
    } error:^(RCConnectErrorCode status) {
        NSLog(@"登陆的错误码为:%ld", (long)status);
    } tokenIncorrect:^{
        //token过期或者不正确。
        //如果设置了token有效期并且token过期，请重新请求您的服务器获取新的token
        //如果没有设置token有效期却提示token错误，请检查您客户端和服务器的appkey是否匹配，还有检查您获取token的流程。
        NSLog(@"token错误");
    }];
    
    return YES;
}
    
- (void)getUserInfoWithUserId:(NSString *)userId
                   completion:(void (^)(RCUserInfo *userInfo))completion{
    RCUserInfo *userInfo = [[RCUserInfo alloc] init];
    userInfo.userId = userId;
    if ([userId isEqual:@"1"]) {
        userInfo.name = @"name1";
    }else{
        userInfo.name = @"name2";
    }
    return completion(userInfo);
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
