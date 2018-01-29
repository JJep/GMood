//
//  DetailEmotionalTestViewController.m
//  GMood
//
//  Created by Jep Xia on 2017/12/7.
//  Copyright © 2017年 Jep Xia. All rights reserved.
//

#import "DetailEmotionalTestViewController.h"
#import "DetailEmotonalTestView.h"
@interface DetailEmotionalTestViewController ()
@property (nonatomic,retain)DetailEmotonalTestView *detailEmotionalTestView;
@end

@implementation DetailEmotionalTestViewController
@synthesize subject = _subject;

-(void)setSubject:(Subject *)subject
{
    if (subject!=_subject) {
        _subject = subject;
        [self reloadView];
    }
}

- (void)reloadView {
//    [self.detailEmotionalTestView ]
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
