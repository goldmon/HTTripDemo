//
//  SetController.m
//  HTTripDemo
//
//  Created by 特购部落 on 2017/11/1.
//  Copyright © 2017年 亨通之旅. All rights reserved.
//

#import "SetController.h"

@interface SetController ()
@end

@implementation SetController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton * but=[[UIButton alloc] init];
    [but setTitle:@"button" forState:UIControlStateNormal];
    [but setTitle:@"hahah" forState:UIControlStateHighlighted];
    
    [but setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [but setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    [but setBackgroundColor:[UIColor blackColor]];
    [but addTarget:self action:@selector(loadDataC) forControlEvents:UIControlEventTouchUpInside];
    but.frame=CGRectMake(50, 50, 100, 100);
    [self.view addSubview:but];
    // Do any additional setup after loading the view from its nib.
    
    NSLog(@"setting");//优于方法执行
//    self.ns=@{@"code":@"0000"};
    NSLog(@"%@",self.ns);//优于方法执行，所以不能正确显示
    [self loadDataB];
//    sleep(10);
    NSLog(@"%@",self.ns);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 新增方法
#pragma mark 网络加载
- (void) loadDatas{
    AFHTTPSessionManager * mgr=[AFHTTPSessionManager manager];
    NSDictionary *params=@{@"account":@"123",
                           @"pw":@"123",
                           };
    NSString *url=@"http://192.168.3.250:3000/login";
    [mgr GET:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"ok%@",responseObject);
        NSLog(@"%@",responseObject[@"code"]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@",error);
    }];
}
#pragma mark 获取数据
- (void ) loadDataB{
    AFHTTPSessionManager * mgr=[AFHTTPSessionManager manager];
    NSDictionary *params=@{@"testCode":@"123",
                           };
    NSString *url=@"http://192.168.3.250:3000/film";
    [mgr GET:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //        NSLog(@"ok%@",responseObject);
//        NSLog(@"%@",responseObject);
//        NSLog(@"%@",responseObject[@"data"][1][@"name"]);
//        NSLog(@"%@",responseObject[@"data"][1][@"type"]);
//        NSLog(@"%@",responseObject[@"data"][0][@"name"]);
        if([responseObject isKindOfClass:[NSDictionary class]]){
            NSLog(@"nsdic");
        }
        self.ns=[NSDictionary dictionaryWithDictionary:responseObject];
//        NSLog(@"内部打印%@",self.ns);
//        NSLog(@"%@",[responseObject isKindOfClass:[NSDictionary class]]);
//        self.ns= responseObject;
//         self.ns= @{@"code":@"-100"};
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@",error);
//        self.ns= @{@"code":@"-100"};
    }];
}

-(IBAction)process{
    NSLog(@"test");
    detailController *det=[[detailController alloc] init];
    NSDictionary *userinfo=@{@"name":@"zhangke",@"age":@"10"};
    det.userInfo=userinfo;
    [self presentViewController:det animated:YES completion:nil];
}

-(void)loadDataC{
    NSLog(@"%@",self.ns);
}
#pragma mark - 其他方法

-(void)testFunc{
    NSLog(@"eee");
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
