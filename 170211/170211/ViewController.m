//
//  ViewController.m
//  170211
//
//  Created by 张斌 on 2017/2/12.
//  Copyright © 2017年 张斌. All rights reserved.
//

#import "ViewController.h"
#import "BViewController.h"
@interface ViewController ()<ParaDelagate>
@property (weak, nonatomic) IBOutlet UIButton *button;


@property (strong,nonatomic) BViewController * bvc;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _bvc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"bvc"];
    
    NSLog(@"输出------->%@",_bvc);
    
    _bvc.delegate = self;
    
    
}
- (void)returnString:(NSString *)aString{
    
    NSLog(@"输出------->sss");
    
    [self.button setTitle:aString forState:UIControlStateNormal];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.navigationController pushViewController:_bvc animated:YES];
    
}


@end
