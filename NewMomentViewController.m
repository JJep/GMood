//
//  NewMomentViewController.m
//  GMood
//
//  Created by Jep Xia on 2017/10/31.
//  Copyright © 2017年 Jep Xia. All rights reserved.
//

#import "NewMomentViewController.h"
#import "ELCImagePickerController.h"
#import <AssetsLibrary/AssetsLibrary.h>

#define rightBarButtonItemTag 2
#define leftBarButtonItemTag 3

@interface NewMomentViewController () <UITableViewDelegate, UITableViewDataSource,UIImagePickerControllerDelegate, UIActionSheetDelegate, UINavigationControllerDelegate>

@end

@implementation NewMomentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.imageArray = [NSMutableArray array];
    _tableView = [[UITableView alloc] init];
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(self.view.mas_height);
    }];
    
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UIAccessibilityTraitNone;
    //    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    //    _tableView.tableFooterView.hidden = false;
    

    [self createUI];
    [self setUpNavigationBar];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

-(void)uploadMoment
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber* userid = [defaults objectForKey:@"uid"];
    NSString* token = [defaults objectForKey:@"token"];
    NSString* type = [defaults objectForKey:@"type"];
    
        self.sessionUrl = [NSString stringWithFormat:@"%@%@%@",@"http://",[GlobalVar urlGetter], @"/gmood/emotionTalk" ];
        //创建多个字典
        self.parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                           self.txText.text, @"content",
                           @"浙江杭州", @"position",
                           @1,@"status",
                           nil];
        NSLog(@"parameters :%@", self.parameters);
        
        AFHTTPSessionManager* session = [AFHTTPSessionManager manager];
        //        session.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
        
        //        session.responseSerializer = [AFJSONResponseSerializer serializer];
        
        [session.requestSerializer setValue:@"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHQiOjE1MTIwMzYxMTE0MzEsInBob25lTnVtYmVyIjoiMTIzIiwiaWF0IjoxNTEyMDI4OTExNDMxfQ.iU5Y2w1p3bplNxsOMBsJdQoc5tK09k9L_mzxA5wlS0I" forHTTPHeaderField:@"token"];
        [session                POST:self.sessionUrl
                          parameters:self.parameters
           constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
               for (int i = 0; i< [self.imageArray count]; i++ ) {
                   //设置压缩系数
                   float kCompressionQuality = 0.3;
                   //压缩图片
                   //                   NSData *data = UIImageJPEGRepresentation([self.imageArray objectAtIndex:i], kCompressionQuality);
                   NSData *data1 = UIImageJPEGRepresentation([GlobalVar imageWithImage:[self.imageArray objectAtIndex:i] scaledToSize:CGSizeMake(500, 500)], kCompressionQuality) ;
                   //上传的参数(上传图片，以文件流的格式)
                   [formData appendPartWithFileData:data1
                                               name:@"imageFiles"
                                           fileName:[NSString stringWithFormat:@"test%d.png",i]
                                           mimeType:@"application/x-png"];
               }
               
           } progress:^(NSProgress * _Nonnull uploadProgress) {
               
           } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
               NSLog(@"%@", responseObject);
               NSNumber* status = [responseObject objectForKey:@"status"];
               if ([status isEqualToNumber:[NSNumber numberWithInteger:1]]) {
                   UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"上传成功！" message:nil preferredStyle:UIAlertControllerStyleAlert];
                   UIAlertAction* OKAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                       [self.navigationController popViewControllerAnimated:true];
                   }];
                   [alertController addAction:OKAction];
                   [self presentViewController:alertController animated:true completion:nil];
               } else if ([status isEqualToNumber:[NSNumber numberWithInteger:2]])
               {
                   UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"请选择班级" message:nil preferredStyle:UIAlertControllerStyleAlert];
                   UIAlertAction* OKAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
                   [alertController addAction:OKAction];
                   [self presentViewController:alertController animated:true completion:nil];
               }
               else if ([status isEqualToNumber:[NSNumber numberWithInteger:3]]){
                   UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"您发送的信息可能包含违规内容 请等待审核" message:nil preferredStyle:UIAlertControllerStyleAlert];
                   UIAlertAction* OKAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                       [self.navigationController popViewControllerAnimated:true];
                   }];
                   [alertController addAction:OKAction];
                   [self presentViewController:alertController animated:true completion:nil];
               } else {
                   UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"服务器出错啦 请稍后再试" message:nil preferredStyle:UIAlertControllerStyleAlert];
                   UIAlertAction* OKAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
                   [alertController addAction:OKAction];
                   [self presentViewController:alertController animated:true completion:nil];
               }
               
           } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
               NSLog(@"上传失败%@",error);
           }];
}

- (void)didTouchNavigationItem:(UIButton *)sender {
    switch (sender.tag) {
        case rightBarButtonItemTag:
        {
            NSLog(@"发表情绪说");
            [self uploadMoment];
            [self dismissViewControllerAnimated:true completion:nil];

        }
            break;
        case leftBarButtonItemTag:
        {
            [self dismissViewControllerAnimated:true completion:nil];
        }
            break;
        default:
            break;
    }
}


-(void)setUpNavigationBar {
    self.navigationItem.title = @"新建情绪说";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(didTouchNavigationItem:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发表" style:UIBarButtonItemStyleDone target:self action:@selector(didTouchNavigationItem:)];
    [self.navigationItem.rightBarButtonItem setTag:rightBarButtonItemTag];
    [self.navigationItem.leftBarButtonItem setTag:leftBarButtonItemTag];
}


-(void)createUI
{
    
    CGFloat width = (self.view.bounds.size.width - 60) / 3;
    [self.view setBackgroundColor:GMoodWhiteBackgroundColor];
    self.txText = [UITextView new];
    //    self.txText.text = @"来分享点什么吧....";
    self.txText.font = [UIFont systemFontOfSize:17];
    //    self.txText.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.txText];
    [self.txText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(15);
        make.height.mas_equalTo(120);
        make.left.equalTo(self.view).offset(15);
        make.right.equalTo(self.view).offset(-15);
        
    }];
    
    UIView* supportingView = [UIView new];
    [supportingView setBackgroundColor:GMoodLightGrayColor];
    [self.view addSubview:supportingView];
    [supportingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.centerX.equalTo(self.view);
        make.height.mas_equalTo(1);
        make.top.equalTo(self.txText.mas_bottom);
    }];
    
    self.chooseImageBtn = [UIButton new];
    [self.chooseImageBtn setImage:[UIImage imageNamed:@"新增照片"] forState:UIControlStateNormal];
    [self.chooseImageBtn setTag:50];
    [self.chooseImageBtn addTarget:self action:@selector(selectPhoto:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.chooseImageBtn];
    [self.chooseImageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.txText.mas_bottom).offset(10);
        make.left.equalTo(self.view.mas_left).offset(15);
        make.height.width.mas_equalTo(width);
    }];
    
    UIView* view1 = [UIView new];
    view1.backgroundColor = GMoodWhiteBackgroundColor;
    UIView* view2 = [UIView new];
    view2.backgroundColor = GMoodWhiteBackgroundColor;
    UIView* gapView1 = [UIView new];
    gapView1.backgroundColor = GMoodWhiteBackgroundColor;
    
    [self.view addSubview:gapView1];
    
    UIImageView* arrowImg = [UIImageView new];
    [arrowImg setImage:[UIImage imageNamed:@"ARROW_RIGHT拷贝"]];

}


-(void)didTouchBtn:(UIButton* )sender
{
       if (sender.tag == 48) {
//        VoiceMomentViewController* newVoiceVC = [VoiceMomentViewController new];
//        [self.navigationController pushViewController:newVoiceVC animated:true];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    switch (buttonIndex) {
        case 0:
            //选择照相机
            [self takePhoto];
            break;
        case 1:
            //选择相册
            [self LocalPhoto];
            break;
        default:
            break;
    }
}

- (void)takePhoto
{
    UIImagePickerControllerSourceType sourcType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc]init];
        picker.delegate = self;
        picker.sourceType = sourcType;
        [self presentViewController:picker animated:YES completion:^{
            
        }];
        
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"无法调取相机，请检查" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alert show];
        return;
    }
    
}

- (void)LocalPhoto
{
    ELCImagePickerController *elcPicker = [[ELCImagePickerController alloc] initImagePicker];
    
    elcPicker.maximumImagesCount = 9; //选择图像的最大数量设置为9
    elcPicker.returnsOriginalImage = YES; //只返回fullScreenImage,不是fullResolutionImage
    elcPicker.returnsImage = YES; //如果是的 返回UIimage。如果没有,只返回资产位置信息
    elcPicker.onOrder = YES; //对多个图像选择、显示和返回的顺序选择图像
    elcPicker.mediaTypes = @[(NSString *)kUTTypeImage]; //支持图片和电影类型
    
    elcPicker.imagePickerDelegate = self;
    
    [self presentViewController:elcPicker animated:YES completion:nil];
    
    
}

-(void)elcImagePickerControllerDidCancel:(ELCImagePickerController *)picker
{
    
}

//相册
- (void)elcImagePickerController:(ELCImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info
{
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"%@", info);
    for (NSDictionary *dict in info) {
        if ([dict objectForKey:UIImagePickerControllerMediaType] == ALAssetTypePhoto){
            if ([dict objectForKey:UIImagePickerControllerOriginalImage]){
                //把图片取出来放到数组里面
                UIImage* image=[dict objectForKey:UIImagePickerControllerOriginalImage];
                [self.imageArray addObject:image];
            }
            
        }else {
            // NSLog(@"UIImagePickerControllerReferenceURL = %@", dict);
        }
    }
    //    self.imageView.image = array[0];
    //    self.imageView1.image = array[1];
    [self updateUI:self.imageArray];
    
}

-(void)updateUI:(NSArray *)imageArray
{
    CGFloat width = (self.view.bounds.size.width - 60) / 3;
    if ([imageArray count]<=3) {
        for (int i = 0; i < [imageArray count]; i++) {
            UIButton* imageBtn = [UIButton new];
            [_tableView addSubview:imageBtn];
            [imageBtn setImage:imageArray[i] forState:UIControlStateNormal];
            [imageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.txText.mas_bottom).offset(10);
                make.left.equalTo(self.view.mas_left).offset(15+i*(15+width));
                make.width.height.mas_equalTo(width);
            }];
            
            
        }
        if ([imageArray count] == 3) {
            [self.chooseImageBtn mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.view.mas_left).offset(15);
                make.top.equalTo(self.txText.mas_bottom).offset(10+10+width);
            }];
        } else {
            [self.chooseImageBtn mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.view.mas_left).offset(15+[imageArray count]*(15+width));
            }];
        }
        [_tableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(self.view.bounds.size.height + 1*(15+width));
        }];
    } else if ([imageArray count] <= 6) {
        [_tableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(self.view.bounds.size.height + 2*(15+width));
        }];
        for (int i = 0; i < 3 ; i ++) {
            UIButton* imageBtn = [UIButton new];
            [_tableView addSubview:imageBtn];
            [imageBtn setImage:imageArray[i] forState:UIControlStateNormal];
            [imageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.txText.mas_bottom).offset(10);
                make.left.equalTo(self.view.mas_left).offset(15+i*(15+width));
                make.width.height.mas_equalTo(width);
            }];
        }
        for (int i =3; i < [imageArray count]; i++) {
            UIButton* imageBtn = [UIButton new];
            [_tableView addSubview:imageBtn];
            [imageBtn setImage:imageArray[i] forState:UIControlStateNormal];
            [imageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.txText.mas_bottom).offset(10+10+width);
                make.left.equalTo(self.view.mas_left).offset(15+(i-3)*(15+width));
                make.width.height.mas_equalTo(width);
            }];
        }
        if ([imageArray count] == 6) {
            [self.chooseImageBtn mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.view.mas_left).offset(15);
                make.top.equalTo(self.txText.mas_bottom).offset(10+2*(10+width));
            }];
        } else {
            [self.chooseImageBtn mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.txText.mas_bottom).offset(10+10+width);
                make.left.equalTo(self.view.mas_left).offset(15+([imageArray count]-3)*(15+width));
            }];
        }
    } else if ([imageArray count] <= 9) {
        [_tableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(self.view.bounds.size.height + 3*(15+width));
        }];
        for (int i = 0; i < 3 ; i ++) {
            UIButton* imageBtn = [UIButton new];
            [_tableView addSubview:imageBtn];
            [imageBtn setImage:imageArray[i] forState:UIControlStateNormal];
            [imageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.txText.mas_bottom).offset(10);
                make.left.equalTo(self.view.mas_left).offset(15+i*(15+width));
                make.width.height.mas_equalTo(width);
            }];
        }
        for (int i =3; i < 6; i++) {
            UIButton* imageBtn = [UIButton new];
            [_tableView addSubview:imageBtn];
            [imageBtn setImage:imageArray[i] forState:UIControlStateNormal];
            [imageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.txText.mas_bottom).offset(10+10+width);
                make.left.equalTo(self.view.mas_left).offset(15+(i-3)*(15+width));
                make.width.height.mas_equalTo(width);
            }];
        }
        for (int i = 6; i < [imageArray count]; i ++) {
            UIButton* imageBtn = [UIButton new];
            [_tableView addSubview:imageBtn];
            [imageBtn setImage:imageArray[i] forState:UIControlStateNormal];
            [imageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.txText.mas_bottom).offset(10+2*(10+width));
                make.left.equalTo(self.view.mas_left).offset(15+(i-6)*(15+width));
                make.width.height.mas_equalTo(width);
            }];
        }
        if ([imageArray count] == 9) {
            [self.chooseImageBtn setHidden:true];
        } else {
            [self.chooseImageBtn mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.txText.mas_bottom).offset(10+2*(10+width));
                make.left.equalTo(self.view.mas_left).offset(15+([imageArray count]-6)*(15+width));
            }];
        }
    }
}

#pragma mark - 照片选择代理方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // 1. 获取编辑后的照片
    UIImage *image;
    switch (picker.sourceType) {
        case UIImagePickerControllerSourceTypeCamera:
            image = info[@"UIImagePickerControllerOriginalImage"];
            //将图片保存到相册
            [self saveImageToPhotos:image];
            break;
        case UIImagePickerControllerSourceTypePhotoLibrary:
            image = info[@"UIImagePickerControllerEditedImage"];
            break;
        default:
            break;
    }
    //    // 2. 设置按钮的图像
    //    self.imageView.image = image;
    
    // 3. 关闭照片选择控制器
    [self dismissViewControllerAnimated:YES completion:nil];
}

//将图片保存到相册
- (void)saveImageToPhotos:(UIImage*)savedImage

{
    UIImageWriteToSavedPhotosAlbum(savedImage, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
}

// 指定回调方法
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    NSString *msg = nil ;
    if(error != NULL){
        msg = @"保存图片失败" ;
    }else{
        msg = @"保存图片成功" ;
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"保存图片结果提示" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}





- (IBAction)selectPhoto:(id)sender
{
    UIActionSheet *_sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"打开照相机", @"从相册中获取", nil];
    
    [_sheet showInView:self.view];
    
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
