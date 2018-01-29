//
//  GlobalVar.m
//  GMood
//
//  Created by Jep Xia on 2017/9/17.
//  Copyright © 2017年 Jep Xia. All rights reserved.
//

#import "GlobalVar.h"

@implementation GlobalVar
//static NSString* url = @"192.168.2.110:8080"; //罗森
//static NSString* url = @"192.168.1.109:8080"; //团委
//static NSString* url = @"172.20.10.12:8080"; //手机
static NSString* url = @"192.168.123.29:8080"; //寝室

+(void)strSetter:(NSString *)str {
    if (str != nil) {
        url = str;
    }
}

+(NSString *) urlGetter{
    return url;
}

+(NSURL *)momentHandleUrl:(NSString *)url {
    NSString* str = [NSString stringWithFormat:@"http://%@/bjqmger/static/titlespic/%@", [GlobalVar urlGetter],url];
    //    return @"http://img.ithome.com/newsuploadfiles/2017/5/20170502_105053_605.jpg";
    //    NSURL *url = [NSURL URLWithString:str];
    return [NSURL URLWithString:str];
}

+(NSURL *)userPortraitHandleUrl:(NSString *)url {
    NSString* str = [NSString stringWithFormat:@"http://%@/bjqmger/static/heads/%@", [GlobalVar urlGetter],url];
    //    return @"http://img.ithome.com/newsuploadfiles/2017/5/20170502_105053_605.jpg";
    //    NSURL *url = [NSURL URLWithString:str];
    return [NSURL URLWithString:str];
}


+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString
{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"MM月dd日 HH:mm"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]/ 1000.0];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

+(UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


@end
