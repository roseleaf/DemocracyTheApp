//
//  ShowIssueViewController.h
//  DemocracyTheApp
//
//  Created by Rose CW on 8/18/12.
//  Copyright (c) 2012 Rose CW/JJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowIssueViewController : UIViewController

@property (strong, nonatomic) NSString* issueObjectID;
@property (strong, nonatomic) NSString* title;
@property (weak) IBOutlet UILabel *fullIssueText;
@property (strong) NSString* issueLabelText;
@end
