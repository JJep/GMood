//
//  DetailEmotionalTestHomeView.m
//  GMood
//
//  Created by Jep Xia on 2017/12/7.
//  Copyright © 2017年 Jep Xia. All rights reserved.
//

#import "DetailEmotionalTestHomeView.h"

@implementation DetailEmotionalTestHomeView

@synthesize testImg = _testImg;
@synthesize testName = _testName;
@synthesize testTime = _testTime;
@synthesize testNum = _testNum;
@synthesize testDescribtion = _testDescribtion;

-(UIImage *)testImg{
    if (!_testImg) {
        return [UIImage imageNamed:@"图层18"];
    } else {
        return _testImg;
    }
}

-(NSString *)testName{
    if (!_testName) {
        return @"testName";
    } else {
        return _testName;
    }
}

-(NSInteger)testTime{
    if (!_testTime) {
        return 1;
    } else {
        return _testTime;
    }
}

-(NSInteger)testNum{
    if (!_testNum) {
        return 1;
    } else {
        return _testTime;
    }
}

-(NSString *)testDescribtion {
    if (!_testDescribtion) {
        return @"testDescribtion";
    } else {
        return _testDescribtion;
    }
}

-(void)setTestImg:(UIImage *)testImg {
    if (testImg != _testImg) {
        _testImg = testImg;
        [self setNeedsDisplay];
    }
}

-(void)setTestNum:(NSInteger)testNum
{
    if (testNum!= _testNum) {
        _testNum = testNum;
        [self setNeedsDisplay];
    }
}

-(void)setTestName:(NSString *)testName
{
    if (testName != _testName) {
        _testName = testName;
        [self setNeedsDisplay];
    }
}

-(void)setTestTime:(NSInteger)testTime{
    if (testTime != _testTime) {
        _testTime = testTime;
        [self setNeedsDisplay];
    }
}

-(void)setTestDescribtion:(NSString *)testDescribtion{
    if (testDescribtion != _testDescribtion) {
        _testDescribtion = testDescribtion;
        [self setNeedsDisplay];
    }
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    UIImageView* testImageView = [UIImageView new];
    [testImageView setImage:self.testImg];
    
    UILabel* testNameLabel = [UILabel new];
    [testNameLabel setText:self.testName];
    [testNameLabel setFont:[UIFont systemFontOfSize:15]];
    
    UILabel* testSubTitle = [UILabel new];
    [testSubTitle setText:[NSString stringWithFormat:@"%@%ld%@%ld%@",@"题目: ",(long)self.testNum , @"题    时间：", self.testTime, @"分钟" ]];
    [testSubTitle setFont:[UIFont systemFontOfSize:9]];
    
    UILabel* testDescribtionLabel = [UILabel new];
    [testDescribtionLabel setText:self.testDescribtion];
    [testDescribtionLabel setFont:[UIFont systemFontOfSize:12]];
    
    self.testBtn = [UIButton new];
    [self.testBtn setTitle:@"开始测试" forState:UIControlStateNormal];
    [self.testBtn setTitleColor:GMoodLightGrayColor forState:UIControlStateNormal];

    [self.testBtn.layer setBorderColor:GMoodLightGrayColor.CGColor];
    [self.testBtn.layer setBorderWidth:1];
    [self.testBtn.layer setMasksToBounds:YES];
    [self.testBtn setClipsToBounds:YES];
    [self.testBtn.layer setCornerRadius:5];
    
    [self addSubview:testImageView];
    [self addSubview:testNameLabel];
    [self addSubview:testSubTitle];
    [self addSubview:testDescribtionLabel];
    [self addSubview:self.testBtn];
    
    [testImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.mas_equalTo(250);
    }];
    
    [testNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(testImageView.mas_bottom).offset(55);
        make.centerX.equalTo(self);
    }];
    
    [testSubTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(testNameLabel.mas_bottom).offset(20);
        make.centerX.equalTo(self);
    }];
    
    [testDescribtionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(testSubTitle.mas_bottom).offset(35);
        make.centerX.equalTo(self);
    }];
    
    [self.testBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(testDescribtionLabel.mas_bottom).offset(60);
        make.left.equalTo(self).offset(128);
        make.right.equalTo(self).offset(-128);
    }];
    
    
}


@end
