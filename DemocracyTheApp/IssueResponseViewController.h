//
//  IssueResponseViewController.h
//  DemocracyTheApp
//
//  Created by Rose CW on 8/18/12.
//  Copyright (c) 2012 Rose CW/JJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IssueResponseViewController : UIViewController
@property (strong, nonatomic) NSString *issueObjectID;
@property (weak, nonatomic) IBOutlet UILabel *fullIssueText;
@property (strong) NSString *passingIssueText;

@end
