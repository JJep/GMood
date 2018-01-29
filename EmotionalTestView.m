//
//  EmotionalTestView.m
//  GMood
//
//  Created by Jep Xia on 2017/12/6.
//  Copyright © 2017年 Jep Xia. All rights reserved.
//

#import "EmotionalTestView.h"
#import "DetailEmotionalTestHomeViewController.h"
@implementation EmotionalTestView
@synthesize testImage = _testImage;
@synthesize testLabelStr = _testLabelStr;

-(UIImage *)testImage
{
    if (!_testImage) {
        return [UIImage imageNamed:@"图层7"];
    } else {
        return _testImage;
    }
}

-(NSString *)testLabelStr
{
    if (!_testLabelStr) {
        return @"testLabelStr";
    } else {
        return _testLabelStr;
    }
}

-(void)setTestImage:(UIImage *)testImage
{
    if (testImage != _testImage) {
        _testImage = testImage;
        [self setNeedsDisplay];
    }
}

-(void)setTestLabelStr:(NSString *)testLabelStr
{
    if (testLabelStr != _testLabelStr) {
        _testLabelStr = testLabelStr;
        [self setNeedsDisplay];
    }
}



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];//构造方法
    if (self) {
        // Initialization code
        self.testImageBtn = [UIButton new];
    }
    return self;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.


- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self addSubview:self.testImageBtn];
    [self.testImageBtn setImage:self.testImage forState:UIControlStateNormal];
    
    UILabel* testLabel = [UILabel new];
    [self addSubview:testLabel];
    [testLabel setText:self.testLabelStr];
   
    [self.testImageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(15);
        make.top.equalTo(self.mas_top).offset(20);
        make.width.height.mas_equalTo(70);
    }];
    
    [testLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.testImageBtn.mas_bottom).offset(15);
        make.centerX.equalTo(self.testImageBtn);
    }];
    
}

@end
