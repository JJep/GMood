//
//	TestQuestion.h
//
//	Create by Jep Xia on 7/12/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "TestOption.h"

@interface TestQuestion : NSObject

@property (nonatomic, assign) NSInteger qid;
@property (nonatomic, strong) NSArray * testOption;
@property (nonatomic, strong) NSString * title;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end