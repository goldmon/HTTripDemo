//
//  SearchViewController.m
//  HTTripDemo
//
//  Created by 特购部落 on 2017/11/2.
//  Copyright © 2017年 亨通之旅. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()
@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) NSMutableArray *visableArray;
@property (nonatomic, strong) NSMutableArray *filterArray;
@property (nonatomic, strong) NSMutableArray *dataSourceArray;
@property (nonatomic, strong) UISearchController *mySearchController;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initial];
}
#pragma mark - uisearchbar
#pragma mark 初始化
- (void)initial{
    self.dataSourceArray = [NSMutableArray array];
//    self.filterArray = [NSMutableArray array];
//    for (int i = 0; i < 26; i++) {
//        for (int j = 0; j < 4; j++) {
//            NSString *str = [NSString stringWithFormat:@"%c%d", 'A'+i, j];
//            [self.dataSourceArray addObject:str];
//        }
//    }
//    
//    self.visableArray = self.dataSourceArray;
    
    self.myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    [self.view addSubview:_myTableView];
    
    self.mySearchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    _mySearchController.searchResultsUpdater = self;
    _mySearchController.dimsBackgroundDuringPresentation = NO;
    [_mySearchController.searchBar sizeToFit];
    
    self.myTableView.tableHeaderView = self.mySearchController.searchBar;
}
#pragma mark tableview定义
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (!_visableArray || _visableArray.count == 0) {
        _visableArray = _dataSourceArray;
    }
    return _visableArray.count;
}
#pragma mark tableview定义
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifier"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"identifier"];
    }
    
    cell.textLabel.text = [_visableArray objectAtIndex:indexPath.row];
    
    return cell;
}
#pragma mark 搜索结果
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    NSString *filterString = searchController.searchBar.text;
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF contains [c] %@", filterString];
    
    
    AFHTTPSessionManager * mgr=[AFHTTPSessionManager manager];
    NSDictionary *params=@{@"testCode":filterString,
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
        NSDictionary *ns=[NSDictionary dictionaryWithDictionary:responseObject];
        if([ns[@"data"] isKindOfClass:[NSDictionary class]]){
            NSLog(@"nsdictionary");
        }
        if([ns[@"data"] isKindOfClass:[NSArray class]]){
            NSLog(@"NSArray");
        }
//        //        NSLog(@"%lu",[ns[@"data"] count]);
//        NSLog(@"%@",ns[@"data"]);
        NSLog(@"------");
        NSMutableArray *ar=[NSMutableArray new];
        for(id key in ns[@"data"]){
//            NSDictionary *nt=ns[@"data"][key];
            NSLog(@"%@",key);
            if([key isKindOfClass:[NSDictionary class]]){
                NSLog(@"--NSDictionary");
            }
            if([key isKindOfClass:[NSArray class]]){
                NSLog(@"--NSArray");
            }
            [ar addObject:key[@"name"]];
        }
        NSLog(@"999%@",ar);
        [self tableSearch:ar erge:predicate];

//        NSDictionary *ns2=[NSDictionary dictionaryWithDictionary:ns[@"data"]];
//        NSLog(@"%@",ns2);

//        for(NSString *key in ns[@"data"]){
//            NSLog(@"%@,%@",key,ns[@"data"][key]);
//        }
//                NSLog(@"内部打印%@",ns);
        //        NSLog(@"%@",[responseObject isKindOfClass:[NSDictionary class]]);
        //        self.ns= responseObject;
        //         self.ns= @{@"code":@"-100"};
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@",error);
        //        self.ns= @{@"code":@"-100"};
    }];
    
    
}
-(void)tableSearch:(NSArray *)ns erge:(NSPredicate *)predicate{
    NSLog(@"函数内部打印%@",ns[0]);
    if([ns[0] isKindOfClass:[NSDictionary class]]){
        NSLog(@"hanshu-dic");
    }
//    self.visableArray = [NSMutableArray arrayWithArray:[ns filteredArrayUsingPredicate:predicate]];
//    self.visableArray=[NSMutableArray arrayWithObject:ns];
    [self.visableArray removeAllObjects];
    [self.visableArray addObject:@"hahhaha"];
    [self.myTableView reloadData];
}

#pragma mark - 系统自带
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
