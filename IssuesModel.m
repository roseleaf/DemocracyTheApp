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
+(void) addQuestion:(NSString*)newQuestion;
+(NSArray*)questions;
+(void) response:(BOOL) response;
@end


@implementation IssuesModel
+(void) addQuestion:(NSString *)newQuestion{
    PFObject* question = [PFObject objectWithClassName:@"Question"];
    [question setObject:newQuestion forKey:@"questionText"];
    [question save];
}

+(NSArray*)questions{
    NSMutableArray* questionTexts = [NSMutableArray new];

    PFQuery* query = [PFQuery queryWithClassName:@"Question"];
    NSArray* questions =  [query findObjects];//gives you NSArray of PFObjs
    
    for (PFObject* question in questions) {
        NSString* questionText = [question objectForKey:@"questionTest"];
        [questionTexts addObject:questionText];
    }
    return questionTexts;
}

+(void) response:(BOOL)response forQuestion:(NSString* )question{
    PFQuery* query = [PFQuery queryWithClassName:@"Question"];
    [query whereKey:@"questionText" equalTo:question];
    
    PFObject *vote = [PFObject objectWithClassName:@"Question"];
    [vote setObject:response forKey:@"response"];
    

    
}



@end