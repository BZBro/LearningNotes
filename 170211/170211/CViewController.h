//
//  CViewController.h
//  170211
//
//  Created by 张斌 on 2017/2/13.
//  Copyright © 2017年 张斌. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NSString * (^myString)(NSString * aString);

typedef void(^myPartner)(NSString * bString);

@interface CViewController : UIViewController

- (void)myPartnerName:(myPartner)name;

- (NSString *)MyName:(myString)name;

@end
