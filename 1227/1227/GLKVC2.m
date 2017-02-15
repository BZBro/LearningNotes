//
//  GLKVC2.m
//  1227
//
//  Created by 张斌 on 2016/12/27.
//  Copyright © 2016年 张斌. All rights reserved.
//

#import "GLKVC2.h"

@interface GLKVC2 ()<UIScrollViewDelegate>

@property UIScrollView * baseView;

@property UIView * bckView;
@property CGFloat alpha;

@end

@implementation GLKVC2

- (void)viewDidLoad {
    [super viewDidLoad];
    _baseView = [[UIScrollView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UIWindow * window =  [[UIApplication sharedApplication] keyWindow];
    
    _baseView.contentSize = CGSizeMake(window.bounds.size.width, window.bounds.size.height + 400);
    
    _baseView.delegate = self;
    
    [self.view addSubview:_baseView];
    

    
    self.alpha = 0.0; // 初始化透明度
    UIView * backgroundView = [[self.navigationController valueForKey:@"_navigationBar"] valueForKey:@"_backgroundView"];
    backgroundView.backgroundColor = [UIColor blackColor];
    backgroundView.alpha = self.alpha; // 做渐变最好再设置一下
    self.bckView = backgroundView;
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.bckView.alpha = self.view.alpha;
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.bckView.alpha = 1.0;
}

// 防止有时候其他界面的alpha变为0.5
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    self.bckView.alpha = 1.0;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offset = scrollView.contentOffset.y;
    CGFloat alpha = 0;
    if (offset < 0) {
        self.alpha = alpha = 0;
    }else {
        self.alpha  = alpha = offset / 100;
    }
    self.bckView.alpha = alpha;
    
}

@end
