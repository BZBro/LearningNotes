//
//  BViewController.h
//  170211
//
//  Created by 张斌 on 2017/2/12.
//  Copyright © 2017年 张斌. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol ParaDelagate <NSObject>

@required

- (void)returnString:(NSString *)aString;

@end

@interface BViewController : UIViewController

@property (nonatomic,assign) id<ParaDelagate> delegate;

@end
