//
//	TestOption.m
//
//	Create by Jep Xia on 7/12/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "TestOption.h"

NSString *const kTestOptionContent = @"content";
NSString *const kTestOptionScore = @"score";

@interface TestOption ()
@end
@implementation TestOption




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kTestOptionContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kTestOptionContent];
	}	
	if(![dictionary[kTestOptionScore] isKindOfClass:[NSNull class]]){
		self.score = [dictionary[kTestOptionScore] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.content != nil){
		dictionary[kTestOptionContent] = self.content;
	}
	dictionary[kTestOptionScore] = @(self.score);
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
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kTestOptionContent];
	}
	[aCoder encodeObject:@(self.score) forKey:kTestOptionScore];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.content = [aDecoder decodeObjectForKey:kTestOptionContent];
	self.score = [[aDecoder decodeObjectForKey:kTestOptionScore] integerValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	TestOption *copy = [TestOption new];

	copy.content = [self.content copy];
	copy.score = self.score;

	return copy;
}
@end