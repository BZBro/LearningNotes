//
//  ViewController.m
//  1101rrrr
//
//  Created by 张斌 on 2016/11/2.
//  Copyright © 2016年 张斌. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIDocumentInteractionControllerDelegate>

@property (nonatomic,strong) UIDocumentInteractionController * documentController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    NSString *filePath =
    [[NSBundle mainBundle]
     pathForResource:@"testpdf" ofType:@"pdf"];
    
    NSLog(@"file path is: %@", filePath);
    
    
    self.documentController =
    [UIDocumentInteractionController
     interactionControllerWithURL:[NSURL fileURLWithPath:filePath]];
    self.documentController.delegate = self;
    
    self.documentController.UTI = @"com.adobe.pdf";
    [self.documentController presentOpenInMenuFromRect:CGRectZero
                                                inView:self.view
                                              animated:YES];
    
}


@end
