//
//  DetailEmotonalTestView.h
//  GMood
//
//  Created by Jep Xia on 2017/12/7.
//  Copyright © 2017年 Jep Xia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestQuestion.h"
#import "TestOption.h"
@interface DetailEmotonalTestView : UIView
@property (nonatomic)NSInteger questionID;
@property (nonatomic)TestQuestion* question;
@property (nonatomic)NSArray* questionArray;
@end
