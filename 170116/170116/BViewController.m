//
//  BViewController.m
//  170116
//
//  Created by 张斌 on 2017/2/12.
//  Copyright © 2017年 张斌. All rights reserved.
//

#import "BViewController.h"

@interface BViewController ()

@end

@implementation BViewController
- (IBAction)dianji:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    NSLog(@"输出------->%@,%d",NSStringFromSelector(_cmd),__LINE__);
    NSLog(@"输出------->%@",keyPath);
    NSLog(@"输出------->%@",object);
    NSLog(@"输出------->%@",change);
    NSLog(@"输出------->%@",context);
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
