//
//  ViewController.m
//  1102文件各类问题
//
//  Created by 张斌 on 2016/11/2.
//  Copyright © 2016年 张斌. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIDocumentInteractionControllerDelegate>{
    
    NSString * rrr;
    
}


@property (nonatomic,strong) UIDocumentInteractionController * documentController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self dddd];
    

    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshFile:) name:@"oooo_dddd" object:nil];
    
}


- (void)dddd{
    

    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"testpdf" ofType:@"pdf"];
    
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString * path = filePath;
    
    NSLog(@"输出------->%@",path);
    
    NSURL * trueUrl = [[NSURL alloc] initFileURLWithPath:path isDirectory:NO];;
    
    NSLog(@"输出------->%@",trueUrl);
    
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:path]];
    
    
    //NSLog(@"输出1------->%@",data);
    
    NSString * newFileName = [path lastPathComponent];

    NSLog(@"输出2------->%@",newFileName);
    
    [[NSFileManager defaultManager] createFileAtPath:[[paths objectAtIndex:0] stringByAppendingPathComponent:newFileName] contents:data attributes:nil];
    
    NSLog(@"输出3------->%@",[paths objectAtIndex:0]);
    
    NSArray * ary = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[paths objectAtIndex:0] error:nil];
    
    NSLog(@"输出4------->%@",ary);
}

- (void)refreshFile:(NSNotification *)noti{
    
//    rrr = (NSString *)noti.object;
//    
//    NSString * path = [rrr stringByDeletingLastPathComponent];
//
//    NSDirectoryEnumerator *enumerator = [[NSFileManager defaultManager] enumeratorAtPath:path];
//    
//    for (NSString *fileName in enumerator)
//    {
//        NSLog(@"输出------->%@",fileName);
//    }
    ////
    
    NSURL * url = (NSURL *)noti.object;
    
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString * path = url.absoluteString;
    
    NSLog(@"输出------->%@",path);
    
    NSURL * trueUrl = [[NSURL alloc] initFileURLWithPath:path isDirectory:NO];;
    
    NSLog(@"输出------->%@",trueUrl);
    
    NSData * data = [NSData dataWithContentsOfURL:trueUrl];
    
    NSLog(@"输出1------->%@",data);
    
    NSString * newFileName = [path lastPathComponent];
    
    
    NSLog(@"输出2------->%@",newFileName);
    
    [[NSFileManager defaultManager] createFileAtPath:[[paths objectAtIndex:0] stringByAppendingPathComponent:newFileName] contents:data attributes:nil];
    
    NSLog(@"输出3------->%@",[paths objectAtIndex:0]);
    
    NSArray * ary = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[paths objectAtIndex:0] error:nil];

    NSLog(@"输出4------->%@",ary);
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSArray * ary = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[paths objectAtIndex:0] error:nil];
    
    NSLog(@"输出4------->%@",ary);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
