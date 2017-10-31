//
//  GlobalVar.m
//  GMood
//
//  Created by Jep Xia on 2017/9/17.
//  Copyright © 2017年 Jep Xia. All rights reserved.
//

#import "GlobalVar.h"

@implementation GlobalVar
static NSString* url = @"192.168.23.1:8080"; //


//static UIColor* blueColor = nil;
//if ( == nil)
//localArray = [NSArray arrayWithArray: self.container.objects ];
+(void)strSetter:(NSString *)str {
    if (str != nil) {
        url = str;
    }
}

+(NSString *) urlGetter{
    return url;
}
@end
