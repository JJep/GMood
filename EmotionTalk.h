//
//  Moment.h
//  GMood
//
//  Created by Jep Xia on 2017/11/26.
//  Copyright © 2017年 Jep Xia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
@interface EmotionTalk : NSObject
@property (nonatomic, assign) NSInteger classid;
@property (nonatomic, strong) NSArray * comments;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, assign) NSInteger uploadTime;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSArray * likes;
@property (nonatomic, strong) NSString * emotionPics;
@property (nonatomic, strong) User * user;
@property (nonatomic, strong) NSString * tag;
@property (nonatomic, strong) NSString * videos;
@property (nonatomic, strong) NSString * av;
@property (nonatomic, strong) NSString * avThumbnails;
@property (nonatomic, strong) NSString * position;
@property (nonatomic, assign) NSInteger status;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
