//
//  BViewController.m
//  170211
//
//  Created by 张斌 on 2017/2/12.
//  Copyright © 2017年 张斌. All rights reserved.
//

#import "BViewController.h"
#import "CViewController.h"
@interface BViewController (){
    
    NSString * age;
    
}



@end

@implementation BViewController
- (IBAction)back:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"输出------->zzzz");
    
//    if ([self.delegate respondsToSelector:@selector(returnString:)]) {
//        
//        NSLog(@"输出------->zzzzw");
//        [self.delegate returnString:@"sdfg"];
//        
//        NSLog(@"输出------->s");
//    }
    
    
    CViewController * cvc = [[CViewController alloc] init];

    NSString * b = [cvc MyName:^NSString *(NSString *aString) {
        NSLog(@"输出1------->%@",aString);
        
        return aString;
    }];
    
    NSLog(@"输出2------->%@",b);
    
    [cvc myPartnerName:^(NSString *bString) {
        NSLog(@"输出3------->%@",bString);
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
