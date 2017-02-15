//
//  ViewController.m
//  1227
//
//  Created by 张斌 on 2016/12/27.
//  Copyright © 2016年 张斌. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView * ss = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    
    [self.view addSubview:ss];
    
    ss.backgroundColor = [UIColor purpleColor];
    
    [ss.backgroundColor setFill];
    
    UIView * ss2 = [[UIView alloc] initWithFrame:CGRectMake(100, 350, 100, 100)];
    
    [self.view addSubview:ss2];
    
    ss2.backgroundColor = [UIColor yellowColor];
    
    [ss2.backgroundColor setStroke];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
