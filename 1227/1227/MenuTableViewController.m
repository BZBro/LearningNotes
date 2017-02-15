//
//  MenuTableViewController.m
//  1227
//
//  Created by 张斌 on 2016/12/27.
//  Copyright © 2016年 张斌. All rights reserved.
//

#import "MenuTableViewController.h"
#import "GLKVC.h"
#import "GLKVC2.h"
#import "GLKVC3.h"
#import "ZBGLKVC1.h"
#import "ZBGLKVC2.h"
#import <runetype.h>
@interface MenuTableViewController ()

@end

@implementation MenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:0];
    
    UIBarButtonItem * back = [[UIBarButtonItem alloc] init];
    back.title = @"";
    self.navigationController.navigationItem.backBarButtonItem = back;
    self.navigationItem.backBarButtonItem = back;


}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIViewController * vc = nil;
    
    if (indexPath.row == 0) {
        vc = [GLKVC new];
    }
    if (indexPath.row == 1) {
        vc = [GLKVC2 new];
    }
    if (indexPath.row == 2) {
        vc = [GLKVC3 new];
    }
    if (indexPath.row == 4) {
        vc = [ZBGLKVC1 new];
    }
    if (indexPath.row == 5) {
        vc = [ZBGLKVC2 new];
    }
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"GLKOpenGLES1";
            break;
        case 1:
            cell.textLabel.text = @"zzz";
            break;
        case 2:
            cell.textLabel.text = @"GLKOpenGLES2";
            break;
        case 3:
            cell.textLabel.text = @"ZBGLKOpenGLES1";
            break;
        case 4:
            cell.textLabel.text = @"ZBGLKCoordinate";
            break;
        case 5:
            cell.textLabel.text = @"ZBGLKOpenGLAnim";
            break;
    }
    return cell;
}

@end
