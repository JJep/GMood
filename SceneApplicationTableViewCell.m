//
//  SceneApplicationTableViewCell.m
//  GMood
//
//  Created by Jep Xia on 2017/10/9.
//  Copyright © 2017年 Jep Xia. All rights reserved.
//

#import "SceneApplicationTableViewCell.h"

@implementation SceneApplicationTableViewCell


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
    
    if (!self.sceneImg) {
        self.sceneImg = [UIImageView new];
    }
    
    if (!self.sceneName) {
        self.sceneName = [UILabel new];
    }
    
    [self addSubview:self.sceneImg];
    [self.sceneImg addSubview:self.sceneName];
    
    [self.sceneImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self);
    }];
    
    [self.sceneName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.sceneImg);
    }];
    
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
