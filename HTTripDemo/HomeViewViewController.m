//
//  HomeViewViewController.m
//  HTTripDemo
//
//  Created by 特购部落 on 2017/10/31.
//  Copyright © 2017年 亨通之旅. All rights reserved.
//

#import "HomeViewViewController.h"

@interface HomeViewViewController ()

@end

@implementation HomeViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"HomeViewLoaded");
    UIButton *but=[UIButton new];
    [but setTitle:@"Search" forState:UIControlStateNormal];
    [but setBackgroundColor:[UIColor redColor]];
    [but addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
    but.frame=CGRectMake(50, 50, 100, 100);
    [self.view addSubview:but];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"HomeViewDidReceive");
    // Dispose of any resources that can be recreated.
}

-(void)search{
    SearchViewController *vc = [[SearchViewController alloc]init];
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:vc animated:YES completion:nil];
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
