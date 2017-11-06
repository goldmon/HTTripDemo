//
//  AppDelegate.m
//  HTTripDemo
//
//  Created by 特购部落 on 2017/10/31.
//  Copyright © 2017年 特购部落. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate{
    TabBarController *_tabbar;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //1.创建Window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //a.初始化一个tabBar控制器
    UITabBarController *tb=[[UITabBarController alloc]init];
    //设置控制器为Window的根控制器
    self.window.rootViewController=tb;
    
    
    
    //判断是否是第一次进入应用或者升级版本后第一次进入应用
    //获取当前应用的版本号
    //    NSString* app_version = [NSBundle mainBundle].infoDictionary[(NSString* )kCFBundleVersionKey];  //只能获取到版本号的第一位
    NSString* app_version = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];      //获取到完整的版本号
    //获取沙盒中存储的应用的版本号
    NSString* save_version = [[NSUserDefaults standardUserDefaults]objectForKey:@"first_use"];
    
    if ([app_version isEqualToString:save_version]) {
        //不是第一次进入 或者 升级后  不是第一次进入
        NSLog(@"不是第一次执行");
//        [SingleSample sharedSingleSample].isTishiQiandao = YES;
        _tabbar = [[TabBarController alloc] init];
        self.window.rootViewController = _tabbar;
    }else{
        NSLog(@"是第一次执行");
        //第一次进入 或者 升级后第一次进入
        [[NSUserDefaults standardUserDefaults]setObject:app_version forKey:@"first_use"];
        [[NSUserDefaults standardUserDefaults]synchronize]; //确保数据操作同步执行
        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"everLaunched"];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
        self.window.rootViewController = [[YindaoController alloc]init];
//        [SingleSample sharedSingleSample].isTishiQiandao = YES;
    }
    
    
    //2.设置Window为主窗口并显示出来
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
    NSLog(@"app进入后台");
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    NSLog(@"app即将进入前台？");
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
