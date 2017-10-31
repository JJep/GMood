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
@property (strong,nonatomic) NSString* sessionUrl;
@property (strong,nonatomic) NSDictionary* parameters;
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


-(void) AFForgetPassword
{
    
    if ([self.txNewPassword.text isEqualToString:self.txConfirmPassword.text]) {
        
        self.sessionUrl = [NSString stringWithFormat:@"%@%@%@",@"http://",[GlobalVar urlGetter], @"/gmood/user/findpsw" ];
        //创建多个字典
        self.parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                           self.txPhoneNumber.text, @"phoneNumber",
                           self.txCode.text, @"code",
                           self.txNewPassword.text ,@"newPassword",
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
                      UIAlertController *alertController = [UIAlertController
                                                            alertControllerWithTitle:@"密码修改成功"
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
                      NSLog(@"失败");
                      
                      //UIAlertController风格：UIAlertControllerStyleAlert
                      UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"失败"
                                                                                               message:nil
                                                                                        preferredStyle:UIAlertControllerStyleAlert ];
                      
                      //添加确定到UIAlertController中
                      UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                          [self.navigationController popViewControllerAnimated:true];
                      }];
                      [alertController addAction:okAction];
                      [self presentViewController:alertController animated:YES completion:nil];
                      
                  } else if (myInt == 2){
                      NSLog(@"验证码错误");
                      
                      //UIAlertController风格：UIAlertControllerStyleAlert
                      UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"验证码错误"
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
    } else {
        NSLog(@"两次密码输入不一致");
        //UIAlertController风格：UIAlertControllerStyleAlert
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"两次密码输入不一致"
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
    UIView* supportView = [UIView new];

    [self.view addSubview:background];
    [self.view addSubview:self.txConfirmPassword];
    [self.view addSubview:self.txPhoneNumber];
    [self.view addSubview:self.txCode];
    [self.view addSubview:self.txNewPassword];
    [self.view addSubview:self.btnBack];
    [self.view addSubview:self.btnComplete];
    [self.view addSubview:self.btnGetCode];
    [self.view addSubview:lbForgetPassword];
    [self.view addSubview:supportView];

    [supportView setBackgroundColor:[UIColor whiteColor]];
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
    [self.btnComplete addTarget:nil action:@selector(AFForgetPassword) forControlEvents:UIControlEventTouchUpInside];
    [self.btnBack setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    self.btnBack.titleLabel.textColor = [UIColor whiteColor];
    [self.btnBack addTarget:nil action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.btnGetCode setTitle:@"获取验证码" forState:UIControlStateNormal];
    self.btnGetCode.titleLabel.font = [UIFont systemFontOfSize:13];
    
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
    
    [supportView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.btnGetCode.mas_left);
        make.height.equalTo(self.txCode.mas_height);
        make.width.mas_equalTo(1);
        make.centerY.equalTo(self.txCode);
    }];
    
    [self.btnGetCode mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.view.mas_right).offset(-42);
            make.width.mas_equalTo(89);
            make.centerY.equalTo(self.txCode);
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
