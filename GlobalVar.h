//
//  GlobalVar.h
//  GMood
//
//  Created by Jep Xia on 2017/9/17.
//  Copyright © 2017年 Jep Xia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalVar : NSObject
+ (NSString *) urlGetter;
+ (NSURL *)momentHandleUrl:(NSString *)url;
+ (NSURL *)userPortraitHandleUrl:(NSString *)url;
+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString;
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;
@end
