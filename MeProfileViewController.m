//
//  MeProfileViewController.m
//  GMood
//
//  Created by Jep Xia on 2017/10/30.
//  Copyright © 2017年 Jep Xia. All rights reserved.
//

#import "MeProfileViewController.h"
#import "MeProfileItem.h"
@interface MeProfileViewController ()

@end

@implementation MeProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigationBar];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.userPortraitImg = [UIImageView new];
    [self.userPortraitImg setImage:[UIImage imageNamed:@"头像替代圆"]];
    [self.view addSubview:self.userPortraitImg];
    [self.userPortraitImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(20);
        make.size.mas_equalTo([UIImage imageNamed:@"头像替代圆"].size);
        make.centerX.equalTo(self.view);
    }];
    
    [self setItem];
}

-(void)setNavigationBar {
    self.title = @"个人资料";


}

-(void)setItem {
    MeProfileItem* nickNameItem = [MeProfileItem new];
    MeProfileItem* birthItem = [MeProfileItem new];
    MeProfileItem* sexItem = [MeProfileItem new];
    MeProfileItem* bloodTypeItem = [MeProfileItem new];
    MeProfileItem* areaItem = [MeProfileItem new];
    
    nickNameItem.lbNameText = @"昵称";
    birthItem.lbNameText = @"生日";
    sexItem.lbNameText = @"性别";
    bloodTypeItem.lbNameText = @"血型";
    areaItem.lbNameText = @"所在地";
    
    nickNameItem.lbContentText = @"nickName";
    birthItem.lbContentText = @"1997-10-10";
    sexItem.lbContentText = @"男";
    bloodTypeItem.lbContentText = @"O型";
    areaItem.lbContentText = @"浙江 杭州";
    
    
    [self.view addSubview:nickNameItem];
    [self.view addSubview:birthItem];
    [self.view addSubview:sexItem];
    [self.view addSubview:bloodTypeItem];
    [self.view addSubview:areaItem];
    
    for (MeProfileItem* itemView in self.view.subviews) {
        
        [itemView setBackgroundColor:[UIColor whiteColor]];
    }
    
    [nickNameItem mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userPortraitImg.mas_bottom).offset(50);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(44);
    }];
    MeProfileItem* supportView = [MeProfileItem new];
    supportView = nickNameItem;
    for (MeProfileItem* itemView in self.view.subviews) {
        
        if (![itemView isEqual:nickNameItem] && [itemView isKindOfClass:[MeProfileItem class]]) {
            [itemView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(supportView.mas_bottom).offset(1);
                make.left.right.equalTo(self.view);
                make.height.mas_equalTo(44);
            }];
            
            supportView = itemView;
        }
    }
    for (MeProfileItem* subView in self.view.subviews)
    {
        if ([subView isKindOfClass:[MeProfileItem class]]) {
            
            UIView* lowSupportLine = [UIView new];
            [self.view addSubview:lowSupportLine];
            
            [lowSupportLine setBackgroundColor:GMoodGrayColor];

            [lowSupportLine mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(subView.mas_bottom);
                make.left.equalTo(self.view.mas_left).offset(15);
                make.right.equalTo(self.view.mas_right).offset(-15);
                make.height.mas_equalTo(1);
            }];
            
//            [subView addTarget:self action:@selector(didTouchMeItem:) forControlEvents:UIControlEventTouchUpInside];
        }
    }


                                        
                                        
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
