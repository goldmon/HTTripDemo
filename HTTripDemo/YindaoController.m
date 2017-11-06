//
//  YindaoController.m
//  HTTripDemo
//
//  Created by 特购部落 on 2017/10/31.
//  Copyright © 2017年 亨通之旅. All rights reserved.
//

#import "YindaoController.h"
#import "TabBarController.h"
@interface YindaoController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation YindaoController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadImages];
    // Do any additional setup after loading the view.
}
#pragma mark 隐藏状态栏
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark 加载引导页
- (void)loadImages
{
    for (int i = 0; i < LoadNumbers; i++)
    {
        // 2、设置引导页的名字，这边命名为：ac1 ac2  ac3
        NSString *imageName = [NSString stringWithFormat:@"acb%d",i + 1];
        UIImage *image=[UIImage imageNamed:imageName];
        NSLog(@"%@",image);
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake( ScreenWidth*i, 0,ScreenWidth, ScreenHeight)];
        imageView.image=image;
        
        if (i == LoadNumbers-1)
        {
            imageView.userInteractionEnabled = YES;
            //设置“button”按钮，控制进入app
            UIButton *button= [[UIButton alloc]init];
            button.frame = ScreenBounds;
//            button.backgroundColor=[UIColor blackColor];
            [button addTarget:self action:@selector(beganApp) forControlEvents:UIControlEventTouchUpInside];
            [imageView addSubview:button];
        }
        
        [self.scrollView addSubview:imageView];
    }
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(ScreenWidth*LoadNumbers, 0);
}

#pragma mark 开始主程序
- (void)beganApp
{
    //需要移交窗口给主程序
    
    TabBarController *tabbar = [[TabBarController alloc]init];
    
    [[[UIApplication sharedApplication] delegate] window].rootViewController = tabbar;
    //    KeyTheWindow.rootViewController = tabbar;
    //    [SingleSample sharedSingleSample].tabbar = tabbar;
    
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
