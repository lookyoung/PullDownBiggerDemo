//
//  AppDelegate.m
//  PullDownBiggerDemo
//
//  Created by liuyang on 17/1/16.
//  Copyright © 2017年 me. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController_1.h"
#import "ViewController_2.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor orangeColor], NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    
    ViewController_1 *vc1 = [[ViewController_1 alloc] init];
    vc1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"下拉列表" image:[[UIImage imageNamed:@"mall_n"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] tag:0];
    vc1.tabBarItem.selectedImage = [[UIImage imageNamed:@"mall_s"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *navVC1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    
    ViewController_2 *vc2 = [[ViewController_2 alloc] init];
    vc2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"头像放大" image:[[UIImage imageNamed:@"news_n"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] tag:1];
    vc2.tabBarItem.selectedImage = [[UIImage imageNamed:@"news_s"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *navVC2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    
    UITabBarController *tabBarVC = [[UITabBarController alloc] init];
    tabBarVC.viewControllers = @[navVC1, navVC2];

    self.window.rootViewController = tabBarVC;
    [self.window makeKeyAndVisible];
    return YES;
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
