//
//  ResultsViewController.h
//  DemocracyTheApp
//
//  Created by Rose CW on 8/18/12.
//  Copyright (c) 2012 Rose CW/JJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultsViewController : UIViewController
@property (strong)NSString* passingIssue;
@property (weak, nonatomic) IBOutlet UILabel *yesVotesLabel;
@property (weak, nonatomic) IBOutlet UILabel *noVotesLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalVotesLabel;
@property (strong) NSMutableArray* results;
@end
