//
//  ViewController.m
//  0714play
//
//  Created by 张斌 on 16/7/14.
//  Copyright © 2016年 张斌. All rights reserved.
//

#import "ViewController.h"
#import "AViewController.h"
#import "BViewController.h"
#import "CViewController.h"

#define rect [UIScreen mainScreen].bounds.size

@interface ViewController ()<UIScrollViewDelegate>{
    AViewController *AVC;
    BViewController *BVC;
    CViewController *CVC;

}

@property (weak, nonatomic) IBOutlet UIScrollView *slider;
@property (weak, nonatomic) UIView *white;
@property (weak, nonatomic)  UIView *yellow;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _slider.contentSize = CGSizeMake(- 329 * 2, 20);
    _slider.bounces = NO;
    _slider.showsVerticalScrollIndicator = NO;
    _slider.showsHorizontalScrollIndicator = NO;
    //_slider.delegate = self;
    _slider.pagingEnabled = YES;
    _slider.backgroundColor = [UIColor blackColor];
    //[_slider setContentOffset:CGPointMake(329 * 3, 0)];
    
    UIView * whiteView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    whiteView.backgroundColor = [UIColor whiteColor];
    
    _white = whiteView;
    
    UIView * yellowView = [[UIView alloc] initWithFrame:CGRectMake(329, 0, 329 , 20)];
    yellowView.backgroundColor = [UIColor yellowColor];
    
    _yellow = yellowView;
    
    [_slider addSubview:_white];
    [_slider addSubview:_yellow];
    
    
    
    AVC = [[AViewController alloc] initWithNibName:@"AViewController" bundle:nil];
    
    
    
    CVC = [[CViewController alloc] initWithNibName:@"CViewController" bundle:nil];
    
    
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 88, rect.width, rect.height)];
    scrollView.contentSize = CGSizeMake(rect.width * 3, rect.height);
    scrollView.bounces = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.backgroundColor = [UIColor yellowColor];
    
    AVC.view.frame = CGRectMake(0, 44, rect.width, rect.height);
    
    CVC.view.frame = CGRectMake(rect.width * 2, 44, rect.width, rect.height);
    
    [scrollView addSubview:AVC.view];
    
    
    [scrollView addSubview:CVC.view];
    
    
    [self.view addSubview:scrollView];
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    [UIView animateWithDuration:0.5 animations:^{
        //[_slider setContentOffset:CGPointMake(((scrollView.contentOffset.x) / rect.width) * 329, 0)];
        [_slider setContentOffset:CGPointMake(((-scrollView.contentOffset.x) / rect.width) * 329, 0)];
        
    } completion:^(BOOL finished) {
        
    }];
    
    //NSLog(@"输出------->%f",scrollView.contentOffset.x);
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //
    
    
    
    
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    
    
    
    
    
    if (targetContentOffset->x >= rect.width) {
        
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            BVC = [[BViewController alloc] initWithNibName:@"BViewController" bundle:nil];
            BVC.view.frame = CGRectMake(rect.width, 44, rect.width, rect.height);
            [scrollView addSubview:BVC.view];
        });
        
    }else{
        NSLog(@"没有添加");
    }
    
    
}



@end
