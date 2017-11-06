//
//  YindaoController.h
//  HTTripDemo
//
//  Created by 特购部落 on 2017/10/31.
//  Copyright © 2017年 亨通之旅. All rights reserved.
//
/*
 
 设置应用程序引导页。
 
定义宏定义
//获取屏幕尺寸
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenBounds  [UIScreen mainScreen].bounds
#define keyWindow     [UIApplication sharedApplication].keyWindow

使用说明：
1、添加上面4条宏定义。
2、在该.h文件中，根据自己的需求，修改自己的参数。
“#define LoadNumbers 3”
用宏定义设置引导页的页数。
3、在.m文件中，添加app的主界面viewController.h文件。
4、设置转交主控制页面。
设置.m文件中的“geganApp函数”
#pragma mark 开始程序
- (void)beganApp
{
    keyWindow.rootViewController = [[你再步骤3中设置的主界面 alloc]init];
}


*/

#import <UIKit/UIKit.h>
#warning 0、设置自己需要的引导页的数目，一般是3页
//获取屏幕尺寸
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenBounds  [UIScreen mainScreen].bounds
#define keyWindow     [UIApplication sharedApplication].keyWindow
#define LoadNumbers 3
@interface YindaoController : UIViewController

@end
