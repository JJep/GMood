//
//  DetailEmotonalTestView.m
//  GMood
//
//  Created by Jep Xia on 2017/12/7.
//  Copyright © 2017年 Jep Xia. All rights reserved.
//

#import "DetailEmotonalTestView.h"

@implementation DetailEmotonalTestView
@synthesize questionID = _questionID;
@synthesize question = _question;

-(TestQuestion *)question
{
    if (!_question) {
        TestQuestion* q = [TestQuestion new];
        [q setQid:0];
        [q setTitle:@"title"];
        return q;
    } else {
        return _question;
    }
}

-(void)setQuestion:(TestQuestion *)question
{
    if (question != _question) {
        _question = question;
        [self setQuestionID:question.qid];
        [self setNeedsDisplay];
    }
}

-(NSInteger)questionID
{
    if (!_questionID) {
        return 0;
    } else {
        return _questionID;
    }
}

-(void)setQuestionID:(NSInteger)questionID
{
    if (questionID != _questionID) {
        _questionID = questionID;
        [self setNeedsDisplay];
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    UILabel *lbQuestionName = [UILabel new];
    [lbQuestionName setText: [NSString stringWithFormat:@"%ld%@",(long)self.questionID, self.question.title]];
    [self addSubview:lbQuestionName];
    
    int btnNum = self.question.testOption
    
}


@end
