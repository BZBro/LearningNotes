//
//  ViewController.m
//  masonryT
//
//  Created by 张斌 on 2016/12/2.
//  Copyright © 2016年 张斌. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof (&*self)weakself = self;
    
    UIView * yellow = [UIView new];
    
    yellow.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:yellow];
    
    
    [yellow mas_makeConstraints:^(MASConstraintMaker *make) {
    
//        make.top.equalTo(self.view.mas_top).offset(30);
//        make.left.equalTo(self.view.mas_left).offset(30);
//        make.bottom.equalTo(self.view.mas_bottom).offset(-30);
//        make.right.equalTo(self.view.mas_right).offset(-30);
//        
        
        //make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(30, 30, 30, 30));
        
        make.right.mas_greaterThanOrEqualTo(self.view.mas_right).offset(20);
        
        make.right.mas_equalTo(weakself.view.mas_right).offset(0);
        
        make.left.and.top.and.right.mas_equalTo(20);
        
        make.top.equalTo(self.view.mas_bottom).offset(20);
        
        make.left.equalTo(weakself.view.mas_centerX).offset(20);
        
        make.size.mas_equalTo(weakself.view).offset(-20);
        
        make.width.mas_equalTo(weakself.view.mas_width);
        
        
    }];
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
