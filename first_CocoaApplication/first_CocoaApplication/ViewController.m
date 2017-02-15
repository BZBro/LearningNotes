//
//  ViewController.m
//  first_CocoaApplication
//
//  Created by 张斌 on 2017/2/13.
//  Copyright © 2017年 张斌. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view = [[NSView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    CALayer * layer = [[CALayer alloc] init];
    
    [layer setBackgroundColor:CFBridgingRetain([NSColor greenColor])];
    
    [self.view setLayer:layer];

    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
