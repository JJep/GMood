//
//  MomentsViewController.m
//  GMood
//
//  Created by Jep Xia on 2017/10/9.
//  Copyright © 2017年 Jep Xia. All rights reserved.
//

#import "MomentsViewController.h"
#import "NewMomentViewController.h"
#import "MomentsTableViewCell.h"
#import <MJRefresh.h>
#import "EmotionTalk.h"
#import "User.h"

#define rightBarButtonItemTag 1
@interface MomentsViewController ()
@property (nonatomic,retain)NSString* sessionUrl;
@property (nonatomic,retain)NSDictionary* parameters;
@property (nonatomic,retain)NSMutableArray* classes;
@property (nonatomic,retain)NSMutableArray* momentArray;
@property (nonatomic,retain)NSMutableArray* cellHeightArray;
@property (nonatomic,retain)NSMutableArray* likeUsers;
@property (nonatomic,retain)NSMutableArray* likeUsersViewHeight;
@property (nonatomic,retain)NSMutableArray* commentsViewHeight;
@property (nonatomic,retain)NSMutableArray *textFieldArray ;
//@property (nonatomic,retain)SendCommentView *sendCommentView;
@property (nonatomic,retain)UITextField* textField;
//@property (nonatomic,retain)Classe* classe;
@end

@implementation MomentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.momentArray = [[NSMutableArray alloc] init];

    
    [self setNavigationBar];
    [self setTableView];
}

-(void)setTableView {
//    [mainTableView registerClass:[MomentsTableViewCell class] forCellReuseIdentifier:@"MOMENTCELL"];
    mainTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    
    mainTableView.backgroundColor = GMoodWhiteBackgroundColor;
    mainTableView.delegate = self;
    mainTableView.dataSource = self;
    mainTableView.separatorStyle = UIAccessibilityTraitNone;
    mainTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    //    mainTableView.tableFooterView.hidden = false;
    [self.view addSubview:mainTableView];
    
    
//    [mainTableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:@"MOMENTCELL"];
    [mainTableView registerClass:[MomentsTableViewCell class] forCellReuseIdentifier:@"HEADCELL"];
    
    mainTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //Call this Block When enter the refresh status automatically
        [self downloadMoments];
        
    }];
    
    // Enter the refresh status immediately
    [mainTableView.mj_header beginRefreshing];
    
    mainTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        //Call this Block When enter the refresh status automatically
        if ([self.momentArray count]>0) {
//            [self downloadMoreMoments];
        } else {
            [mainTableView.mj_footer endRefreshing];
        }
    }];
    
//    classTableView = [UITableView new];
//    [self.view addSubview:classTableView];
//    [classTableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(self.view);
//        //make.top.equalTo(self.navigationController.navigationBar.mas_bottom);
//        make.top.equalTo(self.view);
//        make.height.mas_equalTo(44 * [self.classes count]);
//    }];
//    classTableView.delegate = self;
//    classTableView.dataSource = self;
//    [classTableView setHidden:true];
    

}

- (void)didTouchNavigationItem:(UIButton *)sender {
    switch (sender.tag) {
        case rightBarButtonItemTag:
        {
            UIViewController* newMomentVC = [NewMomentViewController new];
//            [self.navigationController pushViewController:newMomentVC animated:true];
            UINavigationController *navMomentVC = [[UINavigationController alloc] initWithRootViewController:newMomentVC];
            [self presentViewController:navMomentVC animated:true completion:nil];
        }
            break;
            
        default:
            break;
    }
}

- (void)setNavigationBar {
    self.title = @"情绪说";
    UIImage* Img = [UIImage imageNamed:@"新建情绪说图表"];
    Img = [Img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:Img style:UIBarButtonItemStyleDone target:self action:@selector(didTouchNavigationItem:)];
    [self.navigationItem.rightBarButtonItem setTag:rightBarButtonItemTag];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)downloadMoments
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber* userid = [defaults objectForKey:@"uid"];
    NSString* token = [defaults objectForKey:@"token"];
    
//    if (userid) {
        self.sessionUrl = [NSString stringWithFormat:@"%@%@%@",@"http://",[GlobalVar urlGetter], @"/gmood/emotionTalk" ];
        //创建多个字典
//        if (self.classe != nil) {
//            self.parameters = [NSDictionary dictionaryWithObjectsAndKeys:
//                               [NSNumber numberWithInteger:self.classe.idField], @"classId",
//                               userid,@"userId",
//                               nil];
//        } else {
//            self.parameters = [NSDictionary dictionaryWithObject:userid forKey:@"userId"];
//        }
        
        NSLog(@"parameters :%@", self.parameters);
        
        AFHTTPSessionManager* session = [AFHTTPSessionManager manager];
        session.responseSerializer = [AFJSONResponseSerializer serializer];
        
        [session.requestSerializer setValue:@"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHQiOjE1MTIwMjg0NDk1OTMsInBob25lTnVtYmVyIjoiMTIzIiwiaWF0IjoxNTEyMDIxMjQ5NTkzfQ.9y0EOx-6p1nkulMdVfQkHTTwT8rRF5D0sD-F0oYK8cw" forHTTPHeaderField:@"token"];
        [session GET:self.sessionUrl
          parameters:self.parameters
            progress:nil
             success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                 NSLog(@"%@",responseObject);
                 //根据key获取value
                 
                 NSNumber* status = [responseObject objectForKey:@"status"];
                 //if ([status isEqualToNumber:[NSNumber numberWithInteger:0]]) {
                     //self.classes = [responseObject objectForKey:@"classes"];
                     //                     [defaults setObject:self.classes forKey:@"classesArray"];
                     //NSLog(@"%@", self.classes);
                     //if ([self.classes count]>0) {
                         if ([self.momentArray isEqualToArray:[responseObject objectForKey:@"emotionTalkList"]]) {
                             
                         } else {
                             [self.momentArray removeAllObjects];
                             [self.momentArray addObjectsFromArray:[responseObject objectForKey:@"emotionTalkList"]];
                         }
//                         [classTableView mas_updateConstraints:^(MASConstraintMaker *make) {
//                             make.height.mas_equalTo([self.classes count] * 44);
//                         }];
//                         Classe* class = [[Classe alloc] initWithDictionary:[self.classes objectAtIndex:0]];
                         //[classButton setTitle:[NSString stringWithFormat:@"%@ ▽",class.name] forState:UIControlStateNormal];
                         [mainTableView reloadData];
//                         [classTableView reloadData];
                     //}  else  {
                    //     NSLog(@"还没有加入任何班级");
                  //   }
                 //}
             }
             failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                 NSLog(@"failure");
                 NSLog(@"%@", error);
             }
         ];
//    }
    [mainTableView.mj_header endRefreshing];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (!self.momentArray) {
        return 1;
    } else {
        return [self.momentArray count];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MomentsTableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[MomentsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MOMENTCELL"];
    }
    if ([self.momentArray count]>0) {
        EmotionTalk* moment = [[EmotionTalk alloc ] initWithDictionary:[self.momentArray objectAtIndex:indexPath.row]];
        NSLog(@"%@", moment);
        User* user = [[User alloc] initWithDictionary:[moment.user toDictionary]];
        if (moment.likes) {
            [self.likeUsers insertObject:moment.likes atIndex:indexPath.row];
        }
        
        cell.contentLabel.text = moment.content;
        cell.titleId = [NSNumber numberWithInteger:moment.idField];
//        if (moment.emotionPics) {
//            NSArray *pics = [(NSString *)moment.emotionPics componentsSeparatedByString:@";"];
//            if ([pics isEqualToArray:cell.imageArray]) {
//        } else {
//                [cell loadPhotoWithModel:pics];
//                cell.imageArray = [NSMutableArray arrayWithArray:pics];
//            }
//        }
//        if (moment.avThumbnails) {
//            NSArray *pics = [NSArray arrayWithObject:moment.avThumbnails];
//            if ([pics isEqualToArray:cell.imageArray]) {
//            } else {
//                [cell loadPhontWithVideo:pics];
//                [cell.videoImageBtn setTag:indexPath.row];
//                [cell.videoImageBtn addTarget:self action:@selector(doPlayVideo:) forControlEvents:UIControlEventTouchUpInside];
//                cell.imageArray = [NSMutableArray arrayWithArray:pics];
//            }
//        }
        
        ////******************************************************************************************************
//        if ([cell.likeUsers isEqualToArray:moment.likes]) {
//        } else {
//            [cell loadLikeUsersWithModel:moment.likes];
//        }
        
//        NSLog(@"%@",moment.comments);
//        if ([cell.comments isEqualToArray:moment.comments]) {
//
//        } else {
//            [cell loadCommentWithModel:moment.comments];
//        }
        
        //******************************************************************************************************
        if (user.username) {
            cell.nameLabel.text = (NSString *)user.username;
        }
        [cell.userPortraitImage sd_setImageWithURL:[GlobalVar userPortraitHandleUrl:(NSString *)moment.user.head] placeholderImage:[UIImage imageNamed:@"userPortrait.jpg"]];
        
        if (moment.uploadTime) {
            cell.timeLabel.text = [GlobalVar timeWithTimeIntervalString:[NSString stringWithFormat: @"%ld", (long)moment.uploadTime]];;
        }
        
        cell.likeButton.tag = indexPath.row;
        cell.CommentButton.tag = indexPath.row;
        [cell.likeButton addTarget:self action:@selector(LikeMoment:) forControlEvents:UIControlEventTouchUpInside];
        [cell.CommentButton addTarget:self action:@selector(commentOnMoment:) forControlEvents:UIControlEventTouchUpInside];
        
        
//        if (moment.videos) {
//            cell.playAudioButton.tag = indexPath.row;
//            [cell.playAudioButton addTarget:self action:@selector(doPlay:) forControlEvents:UIControlEventTouchUpInside];
//        } else {
//            [cell.playAudioButton setHidden:true];
//        }
        
    }
    return cell;

}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([tableView isEqual:mainTableView]) {
        if (indexPath.section == 0) {
            return 180;
        } else {
            //根据内容计算高度
            CGFloat iconHeight = 0;
            if ([self.momentArray count] > 0) {
                EmotionTalk* moment = [[EmotionTalk alloc] initWithDictionary:[self.momentArray objectAtIndex:indexPath.row]];
                iconHeight += [MomentsTableViewCell rowHeightForMoment:moment];
            }
            //        NSLog(@"section = %@, row = %@, height = %@",[NSNumber numberWithInteger:indexPath.section],[NSNumber numberWithInteger:indexPath.row],[NSNumber numberWithFloat: iconHeight]);
            return iconHeight;
        }
    } else {
        return 0;
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
