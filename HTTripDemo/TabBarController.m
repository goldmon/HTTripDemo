//
//  TabBarController.m
//  HTTripDemo
//
//  Created by 特购部落 on 2017/10/31.
//  Copyright © 2017年 亨通之旅. All rights reserved.
//

#import "TabBarController.h"

#import "HomeViewViewController.h"
#import "Setting/SetController.h"
@interface TabBarController ()<UITabBarControllerDelegate>

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    
    //b.创建子控制器
    HomeViewViewController *c1=[[HomeViewViewController alloc]init];
    c1.view.backgroundColor=[UIColor grayColor];
    c1.view.backgroundColor=[UIColor greenColor];
    c1.tabBarItem.title=@"消息";
    c1.tabBarItem.image=[UIImage imageNamed:@"tab_recent_nor"];
    c1.tabBarItem.badgeValue=@"123";
    
    UIViewController *c2=[[UIViewController alloc]init];
    c2.view.backgroundColor=[UIColor brownColor];
    c2.tabBarItem.title=@"联系人";
    c2.tabBarItem.image=[UIImage imageNamed:@"tab_buddy_nor"];
    
    UIViewController *c3=[[UIViewController alloc]init];
    c3.tabBarItem.title=@"动态";
    c3.tabBarItem.image=[UIImage imageNamed:@"tab_qworld_nor"];
    c3.tabBarItem.selectedImage=[[UIImage imageNamed:@"tab_qworld_now"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *ui=[[UINavigationController alloc] initWithRootViewController:c3];
    
    SetController *c4=[[SetController alloc]init];
    c4.tabBarItem.title=@"设置";
    c4.tabBarItem.image=[UIImage imageNamed:@"tab_me_nor"];
    
    
    //c.添加子控制器到ITabBarController中
    //c.1第一种方式
    //    [tb addChildViewController:c1];
    //    [tb addChildViewController:c2];
    
    //c.2第二种方式
    self.viewControllers=@[c1,c2,ui,c4];
    self.delegate=self;
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
