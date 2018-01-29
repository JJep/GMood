//
//  MomentsTableViewCell.h
//  GMood
//
//  Created by Jep Xia on 2017/11/15.
//  Copyright © 2017年 Jep Xia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JGGView.h"
#import "EmotionTalk.h"
@interface MomentsTableViewCell : UITableViewCell
@property (nonatomic,retain)UILabel* nameLabel; //显示名字
@property (nonatomic,retain)UILabel* timeLabel;
@property (nonatomic,retain)UIImageView* userPortraitImage;
@property (nonatomic,retain)UILabel* contentLabel;
@property (nonatomic,retain)UIView* shareView;
@property (nonatomic,retain)UIButton* CommentButton;
@property (nonatomic,retain)UIButton* likeButton;
@property (nonatomic,retain)UIButton* playAudioButton;
@property (nonatomic,retain)NSArray* imageArray;
@property (nonatomic)BOOL isLike;
@property (nonatomic,retain)NSArray* likeUsers;
@property (nonatomic,retain)NSNumber* titleId;
//@property (nonatomic,retain)LikeUsersView* likeUsersView;
//@property (nonatomic,retain)CommentView* commentView;
@property (nonatomic,retain)NSArray* comments;
@property (nonatomic,retain)JGGView* jggView;
@property (nonatomic,retain)UIButton* videoImageBtn;

+ (CGFloat)rowHeightForMoment:(EmotionTalk*)moment;
-(CGFloat)hadleForHeight;
- (float)getAutoCellHeight ;
-(void)configUI;
-(void)loadPhotoWithModel:(NSArray* )imageArrays;
//-(CGFloat)loadLikeUsersWithModel:(NSArray* )likeUsers;
//-(CGFloat)loadCommentWithModel:(NSArray *)comments;
//-(void)loadPhontWithVideo:(NSArray* )imageArrays;

@end
