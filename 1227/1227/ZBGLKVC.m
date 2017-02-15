//
//  ZBGLKVC.m
//  1227
//
//  Created by 张斌 on 2016/12/27.
//  Copyright © 2016年 张斌. All rights reserved.
//

#import "ZBGLKVC.h"

static const NSInteger ZBDefaulfFramesPerSecond = 60;

@interface ZBGLKVC ()<GLKViewDelegate>

@property (nonatomic,strong) GLKView * glkView;

@property (nonatomic,strong) CADisplayLink * displayLink;

@end

@implementation ZBGLKVC


- (void)dealloc{
    
    self.paused = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.glkView = [[GLKView alloc] initWithFrame:self.view.frame];
    self.glkView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.glkView.delegate = self;
    [self.view addSubview:self.glkView];
    
    
    self.preferredFramesPerSecond = ZBDefaulfFramesPerSecond;
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(drawView)];
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setPreferredFramesPerSecond:(NSInteger)preferredFramesPerSecond{
    _preferredFramesPerSecond = preferredFramesPerSecond;
    self.displayLink.preferredFramesPerSecond = MAX(1, 60.0f / _preferredFramesPerSecond);
}

- (BOOL)isPaused{
    return self.displayLink.paused;
}

- (void)drawView{
    [self update];
    [self.glkView display];
}

- (void)update{
    
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect{
    
}

@end
