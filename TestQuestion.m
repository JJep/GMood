//
//	TestQuestion.m
//
//	Create by Jep Xia on 7/12/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "TestQuestion.h"

NSString *const kTestQuestionQid = @"qid";
NSString *const kTestQuestionTestOption = @"testOption";
NSString *const kTestQuestionTitle = @"title";

@interface TestQuestion ()
@end
@implementation TestQuestion




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kTestQuestionQid] isKindOfClass:[NSNull class]]){
		self.qid = [dictionary[kTestQuestionQid] integerValue];
	}

	if(dictionary[kTestQuestionTestOption] != nil && [dictionary[kTestQuestionTestOption] isKindOfClass:[NSArray class]]){
		NSArray * testOptionDictionaries = dictionary[kTestQuestionTestOption];
		NSMutableArray * testOptionItems = [NSMutableArray array];
		for(NSDictionary * testOptionDictionary in testOptionDictionaries){
			TestOption * testOptionItem = [[TestOption alloc] initWithDictionary:testOptionDictionary];
			[testOptionItems addObject:testOptionItem];
		}
		self.testOption = testOptionItems;
	}
	if(![dictionary[kTestQuestionTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kTestQuestionTitle];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kTestQuestionQid] = @(self.qid);
	if(self.testOption != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(TestOption * testOptionElement in self.testOption){
			[dictionaryElements addObject:[testOptionElement toDictionary]];
		}
		dictionary[kTestQuestionTestOption] = dictionaryElements;
	}
	if(self.title != nil){
		dictionary[kTestQuestionTitle] = self.title;
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
	[aCoder encodeObject:@(self.qid) forKey:kTestQuestionQid];	if(self.testOption != nil){
		[aCoder encodeObject:self.testOption forKey:kTestQuestionTestOption];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:kTestQuestionTitle];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.qid = [[aDecoder decodeObjectForKey:kTestQuestionQid] integerValue];
	self.testOption = [aDecoder decodeObjectForKey:kTestQuestionTestOption];
	self.title = [aDecoder decodeObjectForKey:kTestQuestionTitle];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	TestQuestion *copy = [TestQuestion new];

	copy.qid = self.qid;
	copy.testOption = [self.testOption copy];
	copy.title = [self.title copy];

	return copy;
}
@end