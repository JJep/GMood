//
//	Subject.h
//
//	Create by Jep Xia on 7/12/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "TestQuestion.h"

@interface Subject : NSObject

@property (nonatomic, strong) NSString * descriptionField;
@property (nonatomic, assign) NSInteger subId;
@property (nonatomic, strong) NSString * subject;
@property (nonatomic, strong) NSArray * testQuestion;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end