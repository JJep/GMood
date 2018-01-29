//
//	Subject.m
//
//	Create by Jep Xia on 7/12/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Subject.h"

NSString *const kSubjectDescriptionField = @"description";
NSString *const kSubjectSubId = @"subId";
NSString *const kSubjectSubject = @"subject";
NSString *const kSubjectTestQuestion = @"testQuestion";

@interface Subject ()
@end
@implementation Subject




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kSubjectDescriptionField] isKindOfClass:[NSNull class]]){
		self.descriptionField = dictionary[kSubjectDescriptionField];
	}	
	if(![dictionary[kSubjectSubId] isKindOfClass:[NSNull class]]){
		self.subId = [dictionary[kSubjectSubId] integerValue];
	}

	if(![dictionary[kSubjectSubject] isKindOfClass:[NSNull class]]){
		self.subject = dictionary[kSubjectSubject];
	}	
	if(dictionary[kSubjectTestQuestion] != nil && [dictionary[kSubjectTestQuestion] isKindOfClass:[NSArray class]]){
		NSArray * testQuestionDictionaries = dictionary[kSubjectTestQuestion];
		NSMutableArray * testQuestionItems = [NSMutableArray array];
		for(NSDictionary * testQuestionDictionary in testQuestionDictionaries){
			TestQuestion * testQuestionItem = [[TestQuestion alloc] initWithDictionary:testQuestionDictionary];
			[testQuestionItems addObject:testQuestionItem];
		}
		self.testQuestion = testQuestionItems;
	}
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.descriptionField != nil){
		dictionary[kSubjectDescriptionField] = self.descriptionField;
	}
	dictionary[kSubjectSubId] = @(self.subId);
	if(self.subject != nil){
		dictionary[kSubjectSubject] = self.subject;
	}
	if(self.testQuestion != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(TestQuestion * testQuestionElement in self.testQuestion){
			[dictionaryElements addObject:[testQuestionElement toDictionary]];
		}
		dictionary[kSubjectTestQuestion] = dictionaryElements;
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
	if(self.descriptionField != nil){
		[aCoder encodeObject:self.descriptionField forKey:kSubjectDescriptionField];
	}
	[aCoder encodeObject:@(self.subId) forKey:kSubjectSubId];	if(self.subject != nil){
		[aCoder encodeObject:self.subject forKey:kSubjectSubject];
	}
	if(self.testQuestion != nil){
		[aCoder encodeObject:self.testQuestion forKey:kSubjectTestQuestion];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.descriptionField = [aDecoder decodeObjectForKey:kSubjectDescriptionField];
	self.subId = [[aDecoder decodeObjectForKey:kSubjectSubId] integerValue];
	self.subject = [aDecoder decodeObjectForKey:kSubjectSubject];
	self.testQuestion = [aDecoder decodeObjectForKey:kSubjectTestQuestion];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Subject *copy = [Subject new];

	copy.descriptionField = [self.descriptionField copy];
	copy.subId = self.subId;
	copy.subject = [self.subject copy];
	copy.testQuestion = [self.testQuestion copy];

	return copy;
}
@end