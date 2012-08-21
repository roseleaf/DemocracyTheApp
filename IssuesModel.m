//
//  IssuesModel.m
//  DemocracyTheApp
//

//  Created by Rose CW on 8/17/12.
//  Copyright (c) 2012 Rose CW/JJ. All rights reserved.
//

#import "IssuesModel.h"
#import <Parse/Parse.h>

@interface IssuesModel()

@end


@implementation IssuesModel
@synthesize issueObjectID;
@synthesize issueText;


+(void) addIssue:(NSString *)newIssue{
    PFObject* issue = [PFObject objectWithClassName:@"Issues"];
    [issue setObject:newIssue forKey:@"issueText"];
    [issue save];
}

+(NSArray*)issues{
    
    PFQuery* query = [PFQuery queryWithClassName:@"Issues"];
    NSArray* issues =  [query findObjects]; //gives you NSArray of PFObjs
    NSArray* reversedArray = [[issues reverseObjectEnumerator] allObjects];
    return reversedArray;
}

+(void) vote:(BOOL)vote forIssue:(NSString* )issueID{
    PFObject *response = [PFObject objectWithClassName:@"Responses"];
    [response setObject:[NSNumber numberWithBool:vote] forKey:@"vote"];
    [response setObject:issueID forKey:@"issueID"];
    [response save];
}

+(NSArray*)resultsForIssues:(NSString* )issueID {
    
    PFQuery *query = [PFQuery queryWithClassName:@"Responses"];
    [query whereKey:@"issueID" equalTo:issueID];
    int totalVotesInt = [[query findObjects] count];
    [query whereKey:@"vote" equalTo:[NSNumber numberWithBool:YES]];
    int yesVotesInt = [[query findObjects] count];
    int noVotesInt = totalVotesInt - yesVotesInt;

    NSNumber* totalVotes = [NSNumber numberWithInt:totalVotesInt];
    NSNumber* yesVotes = [NSNumber numberWithInt:yesVotesInt];
    NSNumber* noVotes = [NSNumber numberWithInt:noVotesInt];

    return [NSArray arrayWithObjects:totalVotes, yesVotes, noVotes, nil];
}


@end