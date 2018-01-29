//
//  Moment.m
//  GMood
//
//  Created by Jep Xia on 2017/11/26.
//  Copyright © 2017年 Jep Xia. All rights reserved.
//

#import "EmotionTalk.h"

NSString *const kEmotionTalkClassid = @"classid";
NSString *const kEmotionTalkComments = @"comments";
NSString *const kEmotionTalkContent = @"content";
NSString *const kEmotionTalkUploadTime = @"uploadTime";
NSString *const kEmotionTalkIdField = @"id";
NSString *const kEmotionTalkLikes = @"likes";
NSString *const kEmotionTalkPics = @"emotionPic";
NSString *const kEmotionTalkUser = @"user";
NSString *const kEmotionTalkTag = @"tag";
NSString *const kEmotionTalkVideos = @"videos";
NSString *const kEmotionTalkAv = @"av";
NSString *const kEmotionTalkAvThumbnails = @"avThumbnails";
NSString *const kEmotionTalkPosition = @"position";
NSString *const kEmotionTalkStatus = @"status";

@interface EmotionTalk ()
@end
@implementation EmotionTalk




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (![dictionary[kEmotionTalkStatus] isKindOfClass:[NSNull class]]) {
        self.status = [dictionary[kEmotionTalkStatus] integerValue];
    }
    if (![dictionary[kEmotionTalkPosition] isKindOfClass:[NSNull class]]) {
        self.position = dictionary[kEmotionTalkPosition];
    }
    if(![dictionary[kEmotionTalkClassid] isKindOfClass:[NSNull class]]){
        self.classid = [dictionary[kEmotionTalkClassid] integerValue];
    }
    
    if(![dictionary[kEmotionTalkComments] isKindOfClass:[NSNull class]]){
        self.comments = dictionary[kEmotionTalkComments];
    }
    if(![dictionary[kEmotionTalkContent] isKindOfClass:[NSNull class]]){
        self.content = dictionary[kEmotionTalkContent];
    }
    if(![dictionary[kEmotionTalkUploadTime] isKindOfClass:[NSNull class]]){
        self.uploadTime = [dictionary[kEmotionTalkUploadTime] integerValue];
    }
    
    if(![dictionary[kEmotionTalkIdField] isKindOfClass:[NSNull class]]){
        self.idField = [dictionary[kEmotionTalkIdField] integerValue];
    }
    
    if(![dictionary[kEmotionTalkLikes] isKindOfClass:[NSNull class]]){
        self.likes = dictionary[kEmotionTalkLikes];
    }
    if(![dictionary[kEmotionTalkPics] isKindOfClass:[NSNull class]]){
        self.emotionPics = dictionary[kEmotionTalkPics];
    }
    if(![dictionary[kEmotionTalkUser] isKindOfClass:[NSNull class]]){
        self.user = [[User alloc] initWithDictionary:dictionary[kEmotionTalkUser]];
    }
    if(![dictionary[kEmotionTalkTag] isKindOfClass:[NSNull class]]){
        self.tag = dictionary[kEmotionTalkTag];
    }
    if(![dictionary[kEmotionTalkVideos] isKindOfClass:[NSNull class]]){
        self.videos = dictionary[kEmotionTalkVideos];
    }
    if(![dictionary[kEmotionTalkAv] isKindOfClass:[NSNull class]]){
        self.av = dictionary[kEmotionTalkAv];
    }
    if(![dictionary[kEmotionTalkAvThumbnails] isKindOfClass:[NSNull class]]){
        self.avThumbnails = dictionary[kEmotionTalkAvThumbnails];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    dictionary[kEmotionTalkStatus] = @(self.status);
    if (self.position != nil) {
        dictionary[kEmotionTalkPosition] = self.position;
    }
    dictionary[kEmotionTalkClassid] = @(self.classid);
    if(self.comments != nil){
        dictionary[kEmotionTalkComments] = self.comments;
    }
    if(self.content != nil){
        dictionary[kEmotionTalkContent] = self.content;
    }
    dictionary[kEmotionTalkUploadTime] = @(self.uploadTime);
    dictionary[kEmotionTalkIdField] = @(self.idField);
    if(self.likes != nil){
        dictionary[kEmotionTalkLikes] = self.likes;
    }
    if(self.emotionPics != nil){
        dictionary[kEmotionTalkPics] = self.emotionPics;
    }
    if(self.user != nil){
        dictionary[kEmotionTalkUser] = [self.user toDictionary];
    }
    return dictionary;
    
}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:@(self.status) forKey:kEmotionTalkStatus];
    [aCoder encodeObject:@(self.classid) forKey:kEmotionTalkClassid];
    if (self.position != nil) {
        [aCoder encodeObject:self.position forKey:kEmotionTalkPosition];
    }
    if(self.comments != nil){
        [aCoder encodeObject:self.comments forKey:kEmotionTalkComments];
    }
    if(self.content != nil){
        [aCoder encodeObject:self.content forKey:kEmotionTalkContent];
    }
    [aCoder encodeObject:@(self.uploadTime) forKey:kEmotionTalkUploadTime];	[aCoder encodeObject:@(self.idField) forKey:kEmotionTalkIdField];	if(self.likes != nil){
        [aCoder encodeObject:self.likes forKey:kEmotionTalkLikes];
    }
    if(self.emotionPics != nil){
        [aCoder encodeObject:self.emotionPics forKey:kEmotionTalkPics];
    }
    if(self.user != nil){
        [aCoder encodeObject:self.user forKey:kEmotionTalkUser];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.status = [[aDecoder decodeObjectForKey:kEmotionTalkStatus] integerValue];
    self.position = [aDecoder decodeObjectForKey:kEmotionTalkPosition];
    self.classid = [[aDecoder decodeObjectForKey:kEmotionTalkClassid] integerValue];
    self.comments = [aDecoder decodeObjectForKey:kEmotionTalkComments];
    self.content = [aDecoder decodeObjectForKey:kEmotionTalkContent];
    self.uploadTime = [[aDecoder decodeObjectForKey:kEmotionTalkUploadTime] integerValue];
    self.idField = [[aDecoder decodeObjectForKey:kEmotionTalkIdField] integerValue];
    self.likes = [aDecoder decodeObjectForKey:kEmotionTalkLikes];
    self.emotionPics = [aDecoder decodeObjectForKey:kEmotionTalkPics];
    self.user = [aDecoder decodeObjectForKey:kEmotionTalkUser];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    EmotionTalk *copy = [EmotionTalk new];
    
    copy.status = self.status;
    copy.position = [self.position copy];
    copy.classid = self.classid;
    copy.comments = [self.comments copy];
    copy.content = [self.content copy];
    copy.uploadTime = self.uploadTime;
    copy.idField = self.idField;
    copy.likes = [self.likes copy];
    copy.emotionPics = [self.emotionPics copy];
    copy.user = [self.user copy];
    
    return copy;
}
@end
