//
//  ViewController.m
//  1121ttt
//
//  Created by 张斌 on 2016/11/21.
//  Copyright © 2016年 张斌. All rights reserved.
//
#define RECT [UIScreen mainScreen].bounds.size
#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>{
    UIScrollView * scrollview;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, RECT.width, RECT.height)];
    
    [scrollview setContentSize:CGSizeMake(RECT.width, RECT.height + 400)];
    scrollview.backgroundColor = [UIColor yellowColor];
    scrollview.delegate = self;
    [self.view addSubview:scrollview];
    

    self.view.backgroundColor = [UIColor blueColor];
    [self.view setFrame:CGRectMake(0, 0, RECT.width, RECT.height+ 600)];
    
    
}

- (void)moveToDown{
    
    [UIView animateWithDuration:1 animations:^{
        [self.view setFrame:CGRectMake(0, - 200, RECT.width, RECT.height+600)];
    }];
    
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"输出------->endscro");
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    
    NSLog(@"输出------->didzoom");
    
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollview.contentOffset.y > 510) {
        [self moveToDown];
    }
    
    
    
    NSLog(@"输出------->%f",scrollview.contentOffset.y);
    
}
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale{
    
    NSLog(@"输出------->done");
    
    [self moveToDown];
}


@end
