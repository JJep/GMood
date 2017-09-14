//
//  ForgetPasswordViewController.m
//  GMood
//
//  Created by Jep Xia on 2017/9/13.
//  Copyright © 2017年 Jep Xia. All rights reserved.
//

#import "ForgetPasswordViewController.h"
#import "masonry.h"
@interface ForgetPasswordViewController ()
@property (nonatomic,retain)UITextField* txPhoneNumber;
@property (nonatomic,retain)UITextField* txCode;
@property (nonatomic,retain)UITextField* txNewPassword;
@property (nonatomic,retain)UITextField* txConfirmPassword;
@property (nonatomic,retain)UIButton* btnGetCode;
@property (nonatomic,retain)UIButton* btnComplete;
@property (nonatomic,retain)UIButton* btnBack;
@end

@implementation ForgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) back {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (void) createUI {
    self.txPhoneNumber = [UITextField new];
    self.txCode = [UITextField new];
    self.txNewPassword = [UITextField new];
    self.txConfirmPassword = [UITextField new];
    self.btnGetCode = [UIButton new];
    self.btnComplete = [UIButton new];
    self.btnBack = [UIButton new];
    UILabel* lbForgetPassword = [UILabel new];
    UIImageView* background = [UIImageView new];

    [self.view addSubview:background];
    [self.view addSubview:self.txConfirmPassword];
    [self.view addSubview:self.txPhoneNumber];
    [self.view addSubview:self.txCode];
    [self.view addSubview:self.txNewPassword];
    [self.view addSubview:self.btnBack];
    [self.view addSubview:self.btnComplete];
    [self.view addSubview:self.btnGetCode];
    [self.view addSubview:lbForgetPassword];

    [background setImage:[UIImage imageNamed:@"背景"]];
    [lbForgetPassword setText:@"忘记密码"];
    lbForgetPassword.font = [UIFont systemFontOfSize:20];
    [lbForgetPassword setTextColor:[UIColor whiteColor]];
    [self.txPhoneNumber setPlaceholder:@"请输入手机号"];
    [self.txPhoneNumber setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txCode setPlaceholder:@"请输入验证码"];
    [self.txCode setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txNewPassword setPlaceholder:@"请输入新密码"];
    [self.txNewPassword setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txConfirmPassword setPlaceholder:@"确认密码"];
    [self.txConfirmPassword setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self.btnComplete setImage:[UIImage imageNamed:@"完成按钮"] forState:UIControlStateNormal];
    [self.btnBack setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    self.btnBack.titleLabel.textColor = [UIColor whiteColor];
    [self.btnBack addTarget:nil action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    [background mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
    
    [lbForgetPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(20);
    }];
    
    [self.btnBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(15);
        make.centerY.equalTo(lbForgetPassword);
    }];
    
    [self.txPhoneNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lbForgetPassword.mas_bottom).offset(80);
        make.height.mas_equalTo(12);
        make.left.equalTo(self.view.mas_left).offset(42);
        make.right.equalTo(self.view.mas_right).offset(-42);
    }];
    
    [self.txCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.txPhoneNumber.mas_bottom).offset(52);
        make.left.equalTo(self.view.mas_left).offset(42);
        make.right.equalTo(self.view.mas_right).offset(-30-89);
        make.height.mas_equalTo(12);
    }];
    
    [self.txNewPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(42);
        make.right.equalTo(self.view.mas_right).offset(-42);
        make.height.mas_equalTo(12);
        make.top.equalTo(self.txCode.mas_bottom).offset(52);
    }];
    
    [self.txConfirmPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(42);
        make.right.equalTo(self.view.mas_right).offset(-42);
        make.top.equalTo(self.txNewPassword.mas_bottom).offset(52);
        make.height.mas_equalTo(12);
    }];
    
    [self.btnComplete mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.txConfirmPassword.mas_bottom).offset(56);
        make.left.equalTo(self.view.mas_left).offset(128);
        make.right.equalTo(self.view.mas_right).offset(-128);
    }];
    
    for (UIView* subView in [self.view subviews]) {
        if ([subView isKindOfClass:[UITextField class]]) {
            UIView* highSupportLine = [UIView new];
            [self.view addSubview:highSupportLine];
            UIView* lowSupportLine = [UIView new];
            [self.view addSubview:lowSupportLine];
            
            [highSupportLine setBackgroundColor:[UIColor whiteColor]];
            [lowSupportLine setBackgroundColor:[UIColor whiteColor]];
            
            [highSupportLine mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(subView.mas_top).offset(-16);
                make.left.equalTo(self.view.mas_left).offset(30);
                make.right.equalTo(self.view.mas_right).offset(-30);
                make.height.mas_equalTo(1);
            }];
            
            [lowSupportLine mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(subView.mas_bottom).offset(16);
                make.left.equalTo(self.view.mas_left).offset(30);
                make.right.equalTo(self.view.mas_right).offset(-30);
                make.height.mas_equalTo(1);
            }];
        }
    }
    
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
