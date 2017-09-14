//
//  ViewController.m
//  GMood
//
//  Created by Jep Xia on 2017/9/11.
//  Copyright © 2017年 Jep Xia. All rights reserved.
//

#import "ViewController.h"
#import "masonry.h"
#import "RegisterViewController.h"
#import "ForgetPasswordViewController.h"
@interface ViewController () <UITextFieldDelegate>
@property (nonatomic,retain)UIImageView* userPortrait;
@property (nonatomic,retain)UITextField* txUserName;
@property (nonatomic,retain)UITextField* txUserPassword;
@property (nonatomic,retain)UIButton* btnLogin;
@property (nonatomic,retain)UIButton* btnForgetPassword;
@property (nonatomic,retain)UIButton* btnToRegister;

@end

@implementation ViewController

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.txUserPassword resignFirstResponder];
    [self.txUserName resignFirstResponder];
    return NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
    self.txUserPassword.delegate = self;
    self.txUserName.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)toRegister {
    NSLog(@"did touch btnRegister");
    UIViewController* registerVC = [RegisterViewController new];
    [self presentViewController:registerVC animated:true completion:nil];
}

- (void)forgetPassword {
    UIViewController* forgetPasswordVC = [ForgetPasswordViewController new];
    [self presentViewController:forgetPasswordVC animated:true completion:nil];
}

- (void)createUI {
    
    UILabel* lbUserName = [UILabel new];
    UILabel* lbLogin = [UILabel new];
    UILabel* lbPassword = [UILabel new];
    UIView* highSupportLine = [UIView new];
    
    UIView* lowSupportLine = [UIView new];
    UILabel* lbOtherWayToLogin = [UILabel new];
    UIView* leftSupportLine = [UIView new];
    UIView* rightSupportLine = [UIView new];
    UIImageView* imgQQ = [UIImageView new];
    UIImageView* imgWeibo = [UIImageView new];
    UIImageView* imgWechat = [UIImageView new];
    UIImageView* imgBack = [UIImageView new];
    self.userPortrait = [UIImageView new];
    self.txUserName = [UITextField new];
    self.txUserPassword = [UITextField new];
    self.btnLogin = [UIButton new];
    self.btnForgetPassword = [UIButton new];
    self.btnToRegister = [UIButton new];
    
    [self.view addSubview:imgBack];
    [self.view addSubview:lbUserName];
    [self.view addSubview:lbLogin];
    [self.view addSubview:lbPassword];
    [self.view addSubview:highSupportLine];
    [self.view addSubview:lowSupportLine];
    [self.view addSubview:lbOtherWayToLogin];
    [self.view addSubview:leftSupportLine];
    [self.view addSubview:rightSupportLine];
    [self.view addSubview:imgQQ];
    [self.view addSubview:imgWechat];
    [self.view addSubview:imgWeibo];
    [self.view addSubview:self.userPortrait];
    [self.view addSubview:self.txUserName];
    [self.view addSubview:self.txUserPassword];
    [self.view addSubview:self.btnLogin];
    [self.view addSubview:self.btnForgetPassword];
    [self.view addSubview:self.btnToRegister];
    
    [imgBack setImage:[UIImage imageNamed:@"背景"]];
    [lbUserName setText:@"账号"];
    [lbLogin setText:@"登陆"];
    [lbLogin setTextColor:[UIColor whiteColor]];
    lbLogin.font = [UIFont systemFontOfSize:20];
    [lbPassword setText:@"密码"];
    [lbOtherWayToLogin setText:@"其他方式登陆"];
    [lbOtherWayToLogin setTextColor:[UIColor whiteColor]];
    lbOtherWayToLogin.font = [UIFont systemFontOfSize:14];
    [imgQQ setImage:[UIImage imageNamed:@"QQ图标"]];
    [imgWechat setImage:[UIImage imageNamed:@"微信图标"]];
    [imgWeibo setImage:[UIImage imageNamed:@"新浪微博图标"]];
    [self.userPortrait setImage:[UIImage imageNamed:@"头像"]];
    [highSupportLine setBackgroundColor:[UIColor whiteColor]];
    [lowSupportLine setBackgroundColor:[UIColor whiteColor]];
    [leftSupportLine setBackgroundColor:[UIColor whiteColor]];
    [rightSupportLine setBackgroundColor:[UIColor whiteColor]];
    [self.btnForgetPassword setTitle:@"忘记密码？" forState:UIControlStateNormal];
    self.btnForgetPassword.titleLabel.font = [UIFont systemFontOfSize:11];
    [self.btnForgetPassword addTarget:nil action:@selector(forgetPassword) forControlEvents:UIControlEventTouchUpInside];
    [self.btnLogin setImage:[UIImage imageNamed:@"登录图标"] forState:UIControlStateNormal];
    [lbUserName setTextColor:[UIColor whiteColor]];
    [lbPassword setTextColor:[UIColor whiteColor]];
    [self.txUserName setTextColor:[UIColor whiteColor]];
    [self.txUserPassword setTextColor:[UIColor whiteColor]];
    [self.txUserPassword setSecureTextEntry:true];
    self.btnToRegister.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.btnToRegister setTintColor:[UIColor whiteColor]];
    [self.btnToRegister setTitle:@"注册" forState:UIControlStateNormal];
    
    
    //设置按钮动作
    [self.btnToRegister addTarget:nil action:@selector(toRegister) forControlEvents:UIControlEventTouchUpInside];
    
    [imgBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view);
    }];
    
    [lbLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(20);
        make.centerX.equalTo(self.view);
    }];
    
    [self.userPortrait mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lbLogin.mas_bottom).offset(94);
        make.centerX.equalTo(self.view);
        make.width.height.mas_equalTo(100);
    }];
    
    [lbUserName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(highSupportLine.mas_left);
        make.bottom.equalTo(highSupportLine.mas_top).offset(-7);
        make.width.mas_equalTo(35);
    }];

    [self.txUserName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lbUserName.mas_right).offset(25);
        make.height.equalTo(lbUserName);
        make.right.equalTo(highSupportLine.mas_right);
    }];
    
    [highSupportLine mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.txUserName.mas_bottom).offset(7);
        make.top.equalTo(self.userPortrait.mas_bottom).offset(75);
        make.height.mas_equalTo(1);
        make.left.equalTo(self.view.mas_left).offset(50);
        make.right.equalTo(self.view.mas_right).offset(-50);
        make.centerX.equalTo(self.view);
    }];
//
    [lowSupportLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(highSupportLine.mas_bottom).offset(75);
        make.left.height.right.equalTo(highSupportLine);
    }];

    [lbPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lowSupportLine.mas_top).offset(-7);
        make.left.right.width.equalTo(lbUserName);
        
    }];
    
    [self.txUserPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lbPassword.mas_right).offset(25);
        make.right.equalTo(lowSupportLine.mas_right);
        make.height.top.equalTo(lbPassword);
    }];
    
    [self.btnLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lowSupportLine.mas_bottom).offset(35);
        make.width.mas_equalTo(120);
        make.centerX.equalTo(self.view);
        make.height.mas_equalTo(28);
    }];
//
    [self.btnForgetPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.btnLogin.mas_bottom).offset(10);
        make.bottom.equalTo(lbOtherWayToLogin.mas_top).offset(-100);
        make.centerX.equalTo(self.view);
    }];

    [leftSupportLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(19);
        make.right.equalTo(lbOtherWayToLogin.mas_left).offset(-19);
        make.height.mas_equalTo(1);
        make.centerY.equalTo(lbOtherWayToLogin);
    }];
    
    [rightSupportLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-19);
        make.left.equalTo(lbOtherWayToLogin.mas_right).offset(19);
        make.height.mas_equalTo(1);
        make.centerY.equalTo(lbOtherWayToLogin);
    }];

    [lbOtherWayToLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
    }];
    
    [imgQQ mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lbOtherWayToLogin.mas_bottom).offset(20);
        make.width.mas_equalTo(24);
        make.height.mas_equalTo(27);
        make.bottom.equalTo(self.view).offset(-25);
        make.centerX.equalTo(self.view);
    }];
    
    [imgWeibo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imgQQ);
        make.height.mas_equalTo(25);
        make.left.equalTo(self.view).offset(48);
        make.width.mas_equalTo(31);
    }];
    
    [imgWechat mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imgQQ);
        make.height.mas_equalTo(25);
        make.width.mas_equalTo(31);
        make.right.equalTo(self.view).offset(-48);
    }];
    
    [self.btnToRegister mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(-15);
        make.centerY.equalTo(lbLogin);
    }];
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
