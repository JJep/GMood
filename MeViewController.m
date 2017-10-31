//
//  MeViewController.m
//  GMood
//
//  Created by Jep Xia on 2017/10/22.
//  Copyright © 2017年 Jep Xia. All rights reserved.
//

#import "MeViewController.h"
#import "MeItemView.h"
#import "MeProfileViewController.h"
#import "RegisterViewController.h"

#define profileItemTag 1
#define followItemTag 2
#define followerItemTag 3
#define moodMomentItemTag 4
#define methodsItemTag 5
#define collectionsItemTag 6

@interface MeViewController ()

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title = @"我的";
    
    self.userPortraitImg = [UIImageView new];
    self.userNickNamelb = [UILabel new];
    
    [self.userPortraitImg setImage:[UIImage imageNamed:@"头像替代圆"]];
    [self.userNickNamelb setText:@"NickName"];
    [self.userNickNamelb setTextColor:GMoodGrayColor];
    [self.userNickNamelb setFont:[UIFont systemFontOfSize:18]];
    
    [self.view addSubview:self.userPortraitImg];
    [self.view addSubview:self.userNickNamelb];
    
    [self.userPortraitImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(30);
        make.centerX.equalTo(self.view);
        make.width.height.mas_equalTo(98);
    }];
    
    [self.userNickNamelb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userPortraitImg.mas_bottom).offset(10);
        make.centerX.equalTo(self.view);
    }];
    
    [self setMeItemView];
}

-(void)didTouchMeItem:(UIButton *)sender{
    switch (sender.tag) {
        case profileItemTag: {
            UIViewController* meProfileVC = [MeProfileViewController new];
            [self.navigationController pushViewController:meProfileVC animated:true];
            break;
        }
        default:
            break;
    }
}

-(void)setMeItemView {
    
    MeItemView* profileItem = [MeItemView new];
    MeItemView* followItem = [MeItemView new];
    MeItemView* followerItem = [MeItemView new];
    MeItemView* moodMomentItem = [MeItemView new];
    MeItemView* methodsItem = [MeItemView new];
    MeItemView* collectionsItem = [MeItemView new];
    
    [profileItem setTag:profileItemTag];
    [followItem setTag:followItemTag];
    [followerItem setTag:followerItemTag];
    [moodMomentItem setTag:moodMomentItemTag];
    [methodsItem setTag:methodsItemTag];
    [collectionsItem setTag:collectionsItemTag];

    //
    [self.view addSubview:profileItem];
    [self.view addSubview:followItem];
    [self.view addSubview:followerItem];
    [self.view addSubview:moodMomentItem];
    [self.view addSubview:methodsItem];
    [self.view addSubview:collectionsItem];
    //
    profileItem.itemLabelString = @"个人资料";
    profileItem.itemLabelString = @"个人资料";
    followItem.itemLabelString  = @"我关注的人";
    followerItem.itemLabelString = @"关注我的人";
    moodMomentItem.itemLabelString = @"我的情绪说";
    methodsItem.itemLabelString = @"我的办法卡";
    collectionsItem.itemLabelString = @"我的收藏";
    
    for (MeItemView* itemView in self.view.subviews) {
        [itemView setBackgroundColor:[UIColor whiteColor]];
    }
    
    [profileItem mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userNickNamelb.mas_bottom).offset(49);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(44);
    }];
    MeItemView* supportView = [MeItemView new];
    supportView = profileItem;
    for (MeItemView* itemView in self.view.subviews) {
        
        if (![itemView isEqual:profileItem] && [itemView isKindOfClass:[MeItemView class]]) {
            [itemView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(supportView.mas_bottom).offset(1);
                make.left.right.equalTo(self.view);
                make.height.mas_equalTo(44);
            }];
            supportView = itemView;
        }
    }
    
    for (MeItemView* subView in self.view.subviews)
    {
        if ([subView isKindOfClass:[MeItemView class]]) {
            
            UIView* highSupportLine = [UIView new];
            [self.view addSubview:highSupportLine];
            UIView* lowSupportLine = [UIView new];
            [self.view addSubview:lowSupportLine];
            
            [highSupportLine setBackgroundColor:GMoodGrayColor];
            [lowSupportLine setBackgroundColor:GMoodGrayColor];
            
            [highSupportLine mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(subView.mas_top);
                make.left.equalTo(self.view.mas_left).offset(15);
                make.right.equalTo(self.view.mas_right);
                make.height.mas_equalTo(1);
            }];
            
            [lowSupportLine mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(subView.mas_bottom);
                make.left.equalTo(self.view.mas_left).offset(15);
                make.right.equalTo(self.view.mas_right);
                make.height.mas_equalTo(1);
            }];
            
            [subView addTarget:self action:@selector(didTouchMeItem:) forControlEvents:UIControlEventTouchUpInside];
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
