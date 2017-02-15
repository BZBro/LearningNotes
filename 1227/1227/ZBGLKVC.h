//
//  ZBGLKVC.h
//  1227
//
//  Created by 张斌 on 2016/12/27.
//  Copyright © 2016年 张斌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKView.h>

@class CADisplayLink;

@interface ZBGLKVC : UIViewController

@property (nonatomic,readonly) GLKView * glkView;

@property (nonatomic) NSInteger preferredFramesPerSecond;

@property (nonatomic,getter=isPaused) BOOL paused;

@end
