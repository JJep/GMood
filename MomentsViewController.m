//
//  MomentsViewController.m
//  GMood
//
//  Created by Jep Xia on 2017/10/9.
//  Copyright © 2017年 Jep Xia. All rights reserved.
//

#import "MomentsViewController.h"
#import "NewMomentViewController.h"
#define rightBarButtonItemTag 1
@interface MomentsViewController ()

@end

@implementation MomentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigationBar];
}

- (void)didTouchNavigationItem:(UIButton *)sender {
    switch (sender.tag) {
        case rightBarButtonItemTag:
        {
            UIViewController* newMomentVC = [NewMomentViewController new];
            [self.navigationController pushViewController:newMomentVC animated:true];
        }
            break;
            
        default:
            break;
    }
}

- (void)setNavigationBar {
    self.title = @"我的情绪说";
    UIImage* Img = [UIImage imageNamed:@"新建情绪说图表"];
    Img = [Img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:Img style:UIBarButtonItemStyleDone target:self action:@selector(didTouchNavigationItem:)];
    [self.navigationItem.rightBarButtonItem setTag:rightBarButtonItemTag];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
