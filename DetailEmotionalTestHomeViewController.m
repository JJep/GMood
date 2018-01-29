//
//  DetailEmotionalTestHomeViewController.m
//  GMood
//
//  Created by Jep Xia on 2017/12/7.
//  Copyright © 2017年 Jep Xia. All rights reserved.
//

#import "DetailEmotionalTestHomeViewController.h"
#import "Subject.h"
#import "TestQuestion.h"
#import "TestOption.h"
#import "DetailEmotionalTestViewController.h"
@interface DetailEmotionalTestHomeViewController ()
@property (nonatomic, retain)DetailEmotionalTestHomeView* detailEmotionalTestHomeView;
@property (nonatomic, retain)Subject* subject;
@end

@implementation DetailEmotionalTestHomeViewController
@synthesize subjectID = _subjectID;

-(void)setSubjectID:(NSInteger)subjectID
{
    if (subjectID!=_subjectID) {
        _subjectID = subjectID;
        [self afGetDetailSubject];
    }
}

-(void)afGetDetailSubject {
    
    NSString* sessionUrl = [NSString stringWithFormat:@"%@%@%@",@"http://",[GlobalVar urlGetter], @"/gmood/emotionTest/question" ];
    //创建多个字典
    
    AFHTTPSessionManager* session = [AFHTTPSessionManager manager];
    NSDictionary* parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                [NSNumber numberWithInteger:self.subjectID], @"subId",
                                nil];
    [session.requestSerializer setValue:@"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHQiOjE1MTIwMjg0NDk1OTMsInBob25lTnVtYmVyIjoiMTIzIiwiaWF0IjoxNTEyMDIxMjQ5NTkzfQ.9y0EOx-6p1nkulMdVfQkHTTwT8rRF5D0sD-F0oYK8cw" forHTTPHeaderField:@"token"];
    
    
    [session POST:sessionUrl parameters:parameters progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NSLog(@"%@",responseObject);
              //根据key获取value
              NSNumber* status = [responseObject objectForKey:@"status"];
              NSLog(@"%@",status);
              int myInt = [status intValue];
              if (myInt == 1) {
                  self.subject = [[Subject alloc] initWithDictionary:[responseObject objectForKey:@"subject"] ];
              } else {
                  NSLog(@"服务器出错");
              }
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              NSLog(@"failure");
              NSLog(@"%@", error);
          }
     ];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.detailEmotionalTestHomeView = [DetailEmotionalTestHomeView new];
    [self.detailEmotionalTestHomeView setBackgroundColor:GMoodWhiteBackgroundColor];
    [self.detailEmotionalTestHomeView setTestName:self.subject.subject];
    [self.detailEmotionalTestHomeView setTestNum:self.subject.testQuestion.count];
    [self.detailEmotionalTestHomeView setTestDescribtion:self.subject.descriptionField];
    [self.detailEmotionalTestHomeView.testBtn addTarget:self action:@selector(didTouchBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.detailEmotionalTestHomeView];
    
    [self.detailEmotionalTestHomeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view);
    }];
}

- (void)didTouchBtn: (UIButton *)button {
    DetailEmotionalTestViewController* detailEmotionalTestVC = [DetailEmotionalTestViewController new];
    [detailEmotionalTestVC setSubject:self.subject];
    [self.navigationController pushViewController:detailEmotionalTestVC animated:true];
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
