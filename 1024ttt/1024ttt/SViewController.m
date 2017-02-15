//
//  SViewController.m
//  1024ttt
//
//  Created by 张斌 on 2016/10/24.
//  Copyright © 2016年 张斌. All rights reserved.
//

#import "SViewController.h"

@interface SViewController ()


@property UIView * fakeView;

@end

@implementation SViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"VCCCCCC@";
    
    self.fakeView = [[UIView alloc] initWithFrame:self.navigationController.view.frame];
    
    //[self.view addSubview:self.fakeView];
    
    [self.fakeView setAlpha:0];
    
    self.view.backgroundColor = [UIColor blackColor];
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
    //self.navigationController.navigationBar.alpha = 0;
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [UIView animateWithDuration:1 animations:^{
        self.fakeView.alpha = 0.5;
    }];
    
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
