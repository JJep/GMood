//
//  RegisterViewController.m
//  GMood
//
//  Created by Jep Xia on 2017/9/12.
//  Copyright © 2017年 Jep Xia. All rights reserved.
//

#import "RegisterViewController.h"
#import "masonry.h"
@interface RegisterViewController ()
@property (nonatomic,retain)UIButton* btnBack;
@property (nonatomic,retain)UIButton* btnRegister;
@property (nonatomic,retain)UITextField* txPhoneNumber;
@property (nonatomic,retain)UITextField* txIdentifyingCode;
@property (nonatomic,retain)UIButton* btnGetCode;
@property (nonatomic,retain)UITextField* txPassword;
@property (strong,nonatomic) NSString* sessionUrl;
@property (strong,nonatomic) NSDictionary* parameters;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)back {
    [self dismissViewControllerAnimated:true completion:nil];
}


-(void) AFRegister
{
    
    
    
    self.sessionUrl = [NSString stringWithFormat:@"%@%@%@",@"http://",[GlobalVar urlGetter], @"/gmood/user/register" ];
    //创建多个字典
    self.parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                       self.txPhoneNumber.text, @"phoneNumber",
                       self.txPassword.text, @"password",
                       self.txPhoneNumber.text, @"username",
                       nil];
    NSLog(@"parameters :%@", self.parameters);
    
    AFHTTPSessionManager* session = [AFHTTPSessionManager manager];
    session.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    [session POST:self.sessionUrl parameters:self.parameters progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NSLog(@"%@",responseObject);
              //根据key获取value
              NSNumber* status = [responseObject objectForKey:@"status"];
              NSLog(@"%@",status);
              int myInt = [status intValue];
              if (myInt == 1) {
                  NSLog(@"success");
                  
                  
                  //UIAlertController风格：UIAlertControllerStyleAlert
                  UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"注册成功"
                                                                                           message:nil
                                                                                    preferredStyle:UIAlertControllerStyleAlert ];
                  
                  //添加确定到UIAlertController中
                  UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                      [self.navigationController popViewControllerAnimated:true];
                  }];
                  [alertController addAction:okAction];
                  [self presentViewController:alertController animated:YES completion:nil];

                  /*
                  //将用户登录信息保存到本地
                  NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
                  NSString *token =[responseObject objectForKey:@"token"];
                  NSNumber *userid = [responseObject objectForKey:@"uid"];
                  [defaults setObject:token forKey:@"token"];
                  [defaults setObject:userid forKey:@"uid"];
                  NSLog(@"保存成功");
                  NSString *usertoken = [defaults objectForKey:@"token"];//根据键值取出name
                  NSNumber *useruserid = [defaults objectForKey:@"uid"];
                  NSLog(@"usertoken = %@,userid = %@",usertoken,useruserid);
                  
                  
                  
                  [AppDelegate autoLogin];
                  [AppDelegate qmatch];
                  
                  //                  [AppDelegate rongCloudGetTokenAndConnect];
                   */
              } else if (myInt == 0) {
                  NSLog(@"注册失败");
                  
                  //UIAlertController风格：UIAlertControllerStyleAlert
                  UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"注册失败"
                                                                                           message:nil
                                                                                    preferredStyle:UIAlertControllerStyleAlert ];
                  
                  //添加确定到UIAlertController中
                  UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                      [self.navigationController popViewControllerAnimated:true];
                  }];
                  [alertController addAction:okAction];
                  [self presentViewController:alertController animated:YES completion:nil];

              } else if (myInt == 2){
                  NSLog(@"手机号已被注册");
                  
                  //UIAlertController风格：UIAlertControllerStyleAlert
                  UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"手机号已被注册"
                                                                                           message:nil
                                                                                    preferredStyle:UIAlertControllerStyleAlert ];
                  
                  //添加确定到UIAlertController中
                  UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                      [self.navigationController popViewControllerAnimated:true];
                  }];
                  [alertController addAction:okAction];
                  [self presentViewController:alertController animated:YES completion:nil];

              }
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              NSLog(@"failure");
              NSLog(@"%@", error);
          }
     ];
}



- (void)createUI {
    
    self.btnBack = [UIButton new];
    self.txPassword = [UITextField new];
    self.txPhoneNumber = [UITextField new];
    self.txIdentifyingCode = [UITextField new];
    self.btnGetCode = [UIButton new];
    self.btnRegister = [UIButton new];
    self.btnBack = [UIButton new];
    UILabel* lbRegister = [UILabel new];
    UIImageView* imgPhone = [UIImageView new];
    UIImageView* imgCode = [UIImageView new];
    UIImageView* imgPassword = [UIImageView new];
    UIImageView* imgBackground = [UIImageView new];
    
    [self.view addSubview:imgBackground];
    [self.view addSubview:imgPassword];
    [self.view addSubview:imgCode];
    [self.view addSubview:imgPhone];
    [self.view addSubview:self.btnGetCode];
    [self.view addSubview:self.btnBack];
    [self.view addSubview:self.txIdentifyingCode];
    [self.view addSubview:self.txPassword];
    [self.view addSubview:self.txPhoneNumber];
    [self.view addSubview:lbRegister];
    [self.view addSubview:self.btnRegister];
    [self.view addSubview:self.btnBack];
    
    [imgBackground setImage:[UIImage imageNamed:@"背景"]];
    [imgPhone setImage:[UIImage imageNamed:@"手机"]];
    [imgPassword setImage:[UIImage imageNamed:@"钥匙"]];
    [imgCode setImage:[UIImage imageNamed:@"验证码图标"]];
    [self.btnGetCode setTitle:@"获取验证码" forState:UIControlStateNormal];
    self.btnGetCode.titleLabel.font = [UIFont systemFontOfSize:13];
    [self.btnRegister setImage:[UIImage imageNamed:@"注册按钮"] forState:UIControlStateNormal];
    [self.btnRegister addTarget:nil action:@selector(AFRegister) forControlEvents:UIControlEventTouchUpInside];
    [lbRegister setText:@"注册"];
    lbRegister.font = [UIFont systemFontOfSize:20];
    [lbRegister setTextColor:[UIColor whiteColor]];
    [self.txPassword setPlaceholder:@"请输入6-20位密码"];
    [self.txIdentifyingCode setPlaceholder:@"请输入验证码"];
    [self.txPhoneNumber setPlaceholder:@"请输入手机号码"];
    [self.txPassword setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txIdentifyingCode setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txPhoneNumber setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self.btnBack setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [self.btnBack addTarget:nil action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.btnBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(15);
        make.right.equalTo(lbRegister.mas_left).offset(-143);
        make.centerY.equalTo(lbRegister);
    }];
    
    [imgBackground mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.view);
    }];
    
    [lbRegister mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(20);
        make.centerX.equalTo(self.view);
    }];
    
    [imgPhone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(47);
        make.top.equalTo(lbRegister.mas_bottom).offset(90);
        make.height.mas_equalTo(25);
        make.width.mas_equalTo(16); //自行标注
    }];

    [self.txPhoneNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imgPhone.mas_right).offset(31);
        make.centerY.equalTo(imgPhone);
        make.right.equalTo(self.view.mas_right).offset(-30);
        make.height.mas_equalTo(12);
    }];
    
    [imgCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(imgPhone);
        make.top.equalTo(imgPhone.mas_bottom).offset(45);
        make.height.mas_equalTo(16);
    }];
    
    [self.txIdentifyingCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.left.right.equalTo(self.txPhoneNumber);
        make.right.equalTo(self.view.mas_right).offset(-30-89);
        make.centerY.equalTo(imgCode);
    }];
    
    [self.btnGetCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(-30);
        make.width.mas_equalTo(89);
        make.centerY.equalTo(self.txIdentifyingCode);
    }];
    
    [imgPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imgCode.mas_bottom).offset(46);
        make.centerX.equalTo(imgPhone);
        make.width.mas_equalTo(12);
        make.height.mas_equalTo(23);
    }];
    
    [self.txPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.width.equalTo(self.txPhoneNumber);
        make.centerY.equalTo(imgPassword);
    }];
    
    [self.btnRegister mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(128);
        make.right.equalTo(self.view.mas_right).offset(-128);
        make.top.equalTo(self.txPassword.mas_bottom).offset(56);
    }];
    
    for (UIView* subView in self.view.subviews)
    {
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
