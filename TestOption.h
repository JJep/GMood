//
//	TestOption.h
//
//	Create by Jep Xia on 7/12/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface TestOption : NSObject

@property (nonatomic, strong) NSString * content;
@property (nonatomic, assign) NSInteger score;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end