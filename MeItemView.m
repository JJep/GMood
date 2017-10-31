//
//  MeItemView.m
//  GMood
//
//  Created by Jep Xia on 2017/10/22.
//  Copyright © 2017年 Jep Xia. All rights reserved.
//

#import "MeItemView.h"

@implementation MeItemView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
@synthesize itemLabelString = _itemLabelString;
@synthesize itemImage = _itemImage;
-(NSString *)itemLabelString {
    
    if (!_itemLabelString ) {
        return @"item";
    }
    return _itemLabelString;
}

-(UIImage *)itemImage {
    if (!_itemImage) {
        return [UIImage imageNamed:@"圆角矩形1"];
    }
    return _itemImage;
}

-(void)setItemImage:(UIImage *)itemImage {
    if (_itemImage != itemImage) {
        _itemImage = itemImage;
        [self setNeedsDisplay];
    }
    
}

-(void)setItemLabelString:(NSString *)itemLabelString {
    
    if (_itemLabelString != itemLabelString) {
        _itemLabelString = itemLabelString;
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



- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self setBackgroundColor:[UIColor whiteColor]];
    
    UIImageView* itemImageView = [UIImageView new];
    UILabel* itemLabel = [UILabel new];
    UIImageView* arrowImg = [UIImageView new];
    
    [itemImageView setImage:self.itemImage];
    [itemLabel setText:self.itemLabelString];
    [itemLabel setTextColor:GMoodGrayColor];
    [itemLabel setFont:[UIFont systemFontOfSize:14]];
    [arrowImg setImage:[UIImage imageNamed:@"向右箭头"]];
    
    [self addSubview:itemImageView];
    [self addSubview:itemLabel];
    [self addSubview:arrowImg];
    
    [itemImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(15);
        make.size.mas_equalTo([UIImage imageNamed:@"圆角矩形1"].size);
        make.centerY.equalTo(self);
    }];
    [itemLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(itemImageView.mas_right).offset(11);
        make.centerY.equalTo(self);
    }];
    [arrowImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-15);
        make.size.mas_equalTo([UIImage imageNamed:@"向右箭头"].size);
        make.centerY.equalTo(self);
    }];
}


@end
