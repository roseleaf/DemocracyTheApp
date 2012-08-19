//
//  IssuesModel.h
//  DemocracyTheApp
//
//  Created by Rose CW on 8/17/12.
//  Copyright (c) 2012 Rose CW/JJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IssuesModel : NSObject
+(void) addIssue:(NSString*)newIssue;
+(NSArray*)issues;
+(void) vote:(BOOL)vote forIssue:(NSString*) issueID;
+ (NSArray*) resultsForIssues:(NSString* )issueID;

@property (strong) NSString* issueObjectID;
@property (strong) NSString* issueText;
@end
