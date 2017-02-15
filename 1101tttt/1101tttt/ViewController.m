//
//  ViewController.m
//  1102文件各类问题
//
//  Created by 张斌 on 2016/11/2.
//  Copyright © 2016年 张斌. All rights reserved.
//

#import "ViewController.h"
#import <QuickLook/QuickLook.h>
@interface ViewController ()<UIDocumentInteractionControllerDelegate,QLPreviewControllerDataSource>{
    
    NSString * rrr;
    
}


@property (nonatomic,strong) QLPreviewController * preview;

@property (nonatomic,strong) UIDocumentInteractionController * documentController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //[self dddd];
    
    
    
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    
    
    NSLog(@"输出------->%@",[paths objectAtIndex:0]);
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshFile:) name:@"oooo_dddd" object:nil];
    
}


- (void)ccc{
    
    _preview = [[QLPreviewController alloc] init];
    
    [_preview.view setFrame:CGRectMake(0, 80, 200, 500)];
    
    _preview.dataSource = self;
    
    _preview.view.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:_preview.view];

#pragma mark-----------QLPreviewControllerDataSource
    
    //要显示的文件的数量
    
}

- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller;
{
    return 3;
    
}
- (id <QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index;
{
    //这个是加载的本地的pdf的文件，doc的同理
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * path = [[paths objectAtIndex:0] stringByAppendingPathComponent:rrr];
    
    //NSString *path = [[NSBundle mainBundle]pathForResource:@"testpdf" ofType:@"pdf"];
    
    NSURL *url = [NSURL fileURLWithPath:path];
    
    return url;
    
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
    
    NSString * path = [url absoluteString];
    
    NSLog(@"输出------->%@",path);
    
    NSString * newFileName = [path lastPathComponent];
    
    NSLog(@"输出2------->%@",newFileName);
    
    NSData * data = [[NSData alloc] initWithContentsOfURL:url];
    
    [[NSFileManager defaultManager] createFileAtPath:[[paths objectAtIndex:0] stringByAppendingPathComponent:newFileName] contents:data attributes:nil];
    
    NSLog(@"输出3------->%@",[paths objectAtIndex:0]);
    
    rrr = newFileName;
    
    NSArray * ary = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[paths objectAtIndex:0] error:nil];
    
    NSLog(@"输出4------->%@",ary);
    
    [self ccc];
    
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
