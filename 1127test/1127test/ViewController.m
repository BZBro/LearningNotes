//
//  ZBCategoryDetailVC.m
//  exp
//
//  Created by 张斌 on 16/9/27.
//  Copyright © 2016年 ZB. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating,UISearchControllerDelegate>

@property(nonatomic,strong)  UITableView    * myTableView;
@property(nonatomic,strong)  NSMutableArray * dataArray;    //接口接收的数组
@property(nonatomic,strong)  NSMutableArray * searchResAry; //搜索显示的结果数组
@property(nonatomic,strong)  UISearchController * searchController;

/**
 接口数据
 */
@property NSArray *mydate;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.00];
    [self initDataSource];
    [self createTableView];
}

#pragma mark----CreatMyCustomTablevIew-----
- (void)createTableView
{
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchBar.frame = CGRectMake(0, 0, 375 - 20, 44);
    self.searchController.searchResultsUpdater = self;
    self.searchController.delegate = self;
    self.searchController.dimsBackgroundDuringPresentation = false;
    
    
    
    
    self.myTableView = [[UITableView  alloc] initWithFrame:CGRectMake(0,64,375,600) style:UITableViewStylePlain];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.tableHeaderView = self.searchController.searchBar;
    self.myTableView.backgroundColor = [UIColor grayColor];
    [self.myTableView registerNib:[UINib nibWithNibName:@"ZBCategoryDetailVCell" bundle:nil] forCellReuseIdentifier:@"ZBCategoryDetailVCell_ONLY"];
    self.myTableView.contentSize = CGSizeMake(375, 1000);
    [self.view addSubview:self.myTableView];
    self.myTableView.sectionIndexColor =[UIColor colorWithRed:0.10 green:0.68 blue:0.94 alpha:1.0];
    self.myTableView.sectionIndexBackgroundColor= [UIColor clearColor];
    
    
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    
    NSLog(@"输出-------1111");
    
}

- (void)willPresentSearchController:(UISearchController *)searchController{
    NSLog(@"输出-------2222");
}
- (void)didPresentSearchController:(UISearchController *)searchController{
    NSLog(@"输出-------3333");
}
- (void)willDismissSearchController:(UISearchController *)searchController{
    NSLog(@"输出-------4444");
}
- (void)didDismissSearchController:(UISearchController *)searchController{
    NSLog(@"输出-------5555");
}


- (NSMutableArray *)searchResAry{
    
    if (!self.searchResAry) {
        self.searchResAry = [[NSMutableArray alloc] init];
    }
    
    return self.searchResAry;
    
}

- (void)initDataSource
{
    //    NSArray *array = @[@"登记", @"大奔", @"周傅", @"爱德华",@"((((", @"啦文琪羊", @"   s文强", @"过段时间", @"等等", @"各个", @"宵夜**", @"***", @"贝尔",@"*而结婚*", @"返回***", @"你还", @"与非门*", @"是的", @"*模块*", @"*没做*",@"俄文", @"   *#咳嗽", @"6",@"fh",@"C罗",@"邓肯"];
    //
    //    NSArray  *indexArray= [array arrayWithPinYinFirstLetterFormat];
    //
    //    self.dataArray =[NSMutableArray arrayWithArray:indexArray];
    //
    
    
    [self.myTableView reloadData];
}
//-(void)getDate{
//    
//    ShowNetworkActivity;
//    
//    [HTTPManager getWithURL:[NSString stringWithFormat: @"/api/home/roster/listpeople?roster_name=%@",  [_roster_name stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]] params:nil success:^(id json) {
//        
//        _mydate = json[@"data"];
//        
//        NSMutableArray *ar = [[NSMutableArray alloc]init];
//        for (NSDictionary *dic in _mydate) {
//            
//            [ar addObject: dic[@"user_name"]];
//        }
//        
//        NSArray *array = [NSMutableArray arrayWithArray:ar];
//        NSArray *indexArray = [array arrayWithPinYinFirstLetterFormat];
//        self.dataArray = [NSMutableArray arrayWithArray:indexArray];
//        [_myTableView reloadData];
//        HidenetworkActivity;
//        
//    } failure:^(NSError *error) {
//        
//        ALTER(@"请求出错");
//        
//    }];
//    
//    
//    
//    
//    
//}
-(void)viewDidLayoutSubviews{
    if ([self.myTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        self.myTableView.separatorInset = UIEdgeInsetsZero;
    }if ([self.myTableView respondsToSelector:@selector(setLayoutMargins:)]) {
        self.myTableView.layoutMargins = UIEdgeInsetsZero;
    }
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        cell.layoutMargins = UIEdgeInsetsZero;
    }if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        cell.separatorInset = UIEdgeInsetsZero;
    }
}

#pragma mark--- UITableViewDataSource and UITableViewDelegate Methods---
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.dataArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0)
    {
        return 1;
        
    }else{
        NSDictionary *dict = self.dataArray[section];
        NSMutableArray *array = dict[@"content"];
        return [array count];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell  *cell = [[UITableViewCell  alloc] init];
    [cell.textLabel setText:@"hahahaha"];
    cell.textLabel.textColor = [UIColor colorWithRed:0.10 green:0.68 blue:0.94 alpha:1.0];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
 
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //自定义Header标题
    UIView* myView = [[UIView alloc] init];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 90, 22)];

    NSString *title = self.dataArray[section][@"firstLetter"];
    titleLabel.text=title;
    [myView addSubview:titleLabel];
    return myView;
}



#pragma mark---tableView索引相关设置----
//添加TableView头视图标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSDictionary *dict = self.dataArray[section];
    NSString *title = dict[@"firstLetter"];
    return title;
}


//添加索引栏标题数组
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSMutableArray *resultArray =[NSMutableArray arrayWithObject:UITableViewIndexSearch];
    for (NSDictionary *dict in self.dataArray) {
        NSString *title = dict[@"firstLetter"];
        [resultArray addObject:title];
    }
    return resultArray;
}


//点击索引栏标题时执行
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    //这里是为了指定索引index对应的是哪个section的，默认的话直接返回index就好。其他需要定制的就针对性处理
    if ([title isEqualToString:UITableViewIndexSearch])
    {
        [tableView setContentOffset:CGPointZero animated:NO];//tabview移至顶部
        return NSNotFound;
    }
    else
    {
        return [[UILocalizedIndexedCollation currentCollation] sectionForSectionIndexTitleAtIndex:index] - 1; // -1 添加了搜索标识
    }
}

@end
