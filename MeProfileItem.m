//
//  MeProfileItem.m
//  GMood
//
//  Created by Jep Xia on 2017/10/30.
//  Copyright © 2017年 Jep Xia. All rights reserved.
//

#import "MeProfileItem.h"

@implementation MeProfileItem
@synthesize lbNameText = _lbNameText;
@synthesize lbContentText = _lbContentText;

-(NSString *)lbNameText {
    if (!_lbNameText ) {
        return @"name";
    }
    return _lbNameText;
}
-(NSString *)lbText {
    if (!_lbContentText) {
        return @"content";
    }
    return _lbContentText;
}
-(void)setLbName:(NSString *)lbNameText
{
    if (_lbNameText != lbNameText) {
        _lbNameText = lbNameText;
        [self setNeedsDisplay];
    }
}
-(void)setLbText:(NSString *)lbContentText {
    if (_lbContentText != lbContentText) {
        _lbContentText = lbContentText;
        [self setNeedsDisplay];
    }
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];//构造方法
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    UILabel* lbName = [UILabel new];
    UILabel* lbContent = [UILabel new];
    [lbName setText:self.lbNameText];
    [lbContent setText:self.lbContentText];
    [lbContent setTextColor:GMoodGrayColor];
    
    [self addSubview:lbName];
    [self addSubview:lbContent];
    
    [lbName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(40);
        make.centerY.equalTo(self);
    }];
    [lbContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-35);
        make.centerY.equalTo(self);
    }];
    
}

@end
