//
//  User.h
//  GMood
//
//  Created by Jep Xia on 2017/11/26.
//  Copyright © 2017年 Jep Xia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, strong) NSObject * location;
@property (nonatomic, strong) NSObject * code;
@property (nonatomic, strong) NSObject * codetime;
@property (nonatomic, assign) NSInteger createtime;
@property (nonatomic, strong) NSObject * descriptionField;
@property (nonatomic, strong) NSObject * head;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSObject * identity;
@property (nonatomic, strong) NSObject * password;
@property (nonatomic, strong) NSObject * phonenumber;
@property (nonatomic, strong) NSObject * qrcode;
@property (nonatomic, strong) NSObject * sex;
@property (nonatomic, strong) NSObject * status;
@property (nonatomic, strong) NSObject * username;
@property (nonatomic, strong) NSObject * fusername;
@property (nonatomic, assign) NSInteger fidField;
@property (nonatomic, strong) NSObject * birthday;
@property (nonatomic, strong) NSObject * blood_type;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
