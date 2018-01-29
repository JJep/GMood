//
//  MomentsTableViewCell.m
//  GMood
//
//  Created by Jep Xia on 2017/11/15.
//  Copyright © 2017年 Jep Xia. All rights reserved.
//

#import "MomentsTableViewCell.h"
@implementation MomentsTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle =UITableViewCellSelectionStyleNone;
        [self configUI];
    }
    return self;
}

-(void)configUI {
    [self.contentView setBackgroundColor:GMoodWhiteBackgroundColor];

    if (!self.userPortraitImage) {
        self.userPortraitImage = [UIImageView new];
        [self.userPortraitImage setImage:[UIImage imageNamed:@"头像替代圆"]];
        [self.contentView addSubview:self.userPortraitImage];
        [self.userPortraitImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.mas_equalTo(35);
            make.left.equalTo(self.contentView.mas_left).offset(15);
            make.top.equalTo(self.contentView.mas_top).offset(10);
        }];
    }
    
    if (!self.nameLabel) {
        self.nameLabel = [UILabel new];
        [self.nameLabel setText:@"nameLabel"];
        [self.contentView addSubview:self.nameLabel];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.userPortraitImage.mas_right).offset(10);
            make.top.equalTo(self.contentView.mas_top).offset(10);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.height.mas_equalTo(20);
        }];
    }
    
    if (!self.timeLabel) {
        self.timeLabel = [UILabel new];
        [self.timeLabel setText:@"timeLabel"];
        self.timeLabel.font = [UIFont systemFontOfSize:14];
        self.timeLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.timeLabel];
        
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.userPortraitImage.mas_right).offset(10);
            make.top.equalTo(self.nameLabel.mas_bottom).offset(6);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
        }];
    }
    
    if(!self.contentLabel) {
        self.contentLabel = [UILabel new];
        self.contentLabel.numberOfLines = 0;
        self.contentLabel.font = [UIFont systemFontOfSize:17];
        [self.contentLabel setText:@"conetentLabel"];
        
        [self.contentView addSubview:self.contentLabel];
        
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(15);
            make.top.equalTo(self.userPortraitImage.mas_bottom).offset(10);
            make.right.equalTo(self.contentView.mas_right).offset(-15);
            //            make.width.lessThanOrEqualTo(self.contentView.bounds.size.width );
        }];
    }
    
    if (!self.shareView) {
        self.shareView = [UIView new];
        self.shareView.backgroundColor = GMoodWhiteBackgroundColor;
        [self.contentView addSubview:self.shareView];
    }
    
    if (!self.likeButton) {
        self.likeButton = [UIButton new];
        [self.likeButton setImage:[UIImage imageNamed:@"HEART"] forState:UIControlStateNormal];
        [self.likeButton setImage:[UIImage imageNamed:@"点赞红"] forState:UIControlStateSelected];
        [self.likeButton setSelected:false];
        [self.likeButton setTag:1];
        [self.shareView addSubview:self.likeButton];
        
    }
    
    if (!self.CommentButton) {
        self.CommentButton = [UIButton new];
        [self.CommentButton setImage:[UIImage imageNamed:@"评论"] forState:UIControlStateNormal];
        [self.shareView addSubview:self.CommentButton];
    }
    
    
    [self.shareView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left);
        make.height.mas_equalTo(30);
        make.right.equalTo(self.contentView.mas_right);
        make.top.equalTo(self.contentLabel.mas_bottom).offset(10);
    }];
    
    [self.likeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(30);
        make.centerY.equalTo(self.shareView);
        make.right.equalTo(self.shareView.mas_right).offset(-10);
    }];
    
    [self.CommentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.likeButton.mas_left).offset(-30);
        make.width.height.mas_equalTo(30);
        make.centerY.equalTo(self.shareView);
    }];
    
    UIView* bottomView = [UIView new];
    [self.contentView addSubview:bottomView];
    bottomView.backgroundColor = GMoodWhiteBackgroundColor;
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.centerX.width.equalTo(self.contentView);
        make.height.mas_equalTo(10);
    }];

    self.jggView = [JGGView new];
    [self.contentView addSubview:self.jggView];
    
    [self.jggView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.top.equalTo(self.contentLabel.mas_bottom).offset(10);
        make.height.mas_equalTo(0);
    }];
    
}


-(void)loadPhotoWithModel:(NSArray* )imageArrays
{
    
    self.jggView.backgroundColor = [UIColor orangeColor];
    self.imageArray = imageArrays;
    
    CGFloat width = 105.000;
    
    self.jggView.imageArrays = imageArrays;
    self.jggView.backgroundColor = [UIColor whiteColor];
    [self.jggView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.top.equalTo(self.contentLabel.mas_bottom).offset(10);
        if ([imageArrays count] == 0) {
            make.height.mas_equalTo(0);
        } else if ([imageArrays count] <= 3) {
            make.height.mas_equalTo(0+(width+10));
        } else if ([imageArrays count] <= 6) {
            make.height.mas_equalTo(0+2*(width+10));
        } else if ([imageArrays count] <= 9) {
            make.height.mas_equalTo(0+3*(width+10));
        }
    }];
    
    NSLog(@"width = %lf",width);
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
