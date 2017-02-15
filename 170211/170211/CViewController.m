//
//  CViewController.m
//  170211
//
//  Created by 张斌 on 2017/2/13.
//  Copyright © 2017年 张斌. All rights reserved.
//

#import "CViewController.h"

@interface CViewController ()

@end

@implementation CViewController

- (void)myPartnerName:(myPartner)name{
    
    name(@"pandongzi");
    
}

- (NSString *)MyName:(myString)name{
    
    NSString * a = @"dongzi";
    
    a = name(@"zhangbin");
    
    return a;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
