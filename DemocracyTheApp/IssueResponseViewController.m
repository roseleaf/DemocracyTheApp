//
//  IssueResponseViewController.m
//  DemocracyTheApp
//
//  Created by Rose CW on 8/18/12.
//  Copyright (c) 2012 Rose CW/JJ. All rights reserved.
//

#import "IssueResponseViewController.h"
#import <Parse/Parse.h>
#import "IssuesModel.h"
#import "ResultsViewController.h"

@interface IssueResponseViewController ()
- (IBAction)yesVote;
- (IBAction)noVote;

@end


@implementation IssueResponseViewController

@synthesize fullIssueText;
@synthesize issueObjectID;
@synthesize passingIssueText;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Cast Your Vote!";
    self.fullIssueText.text = passingIssueText;

}

- (void)viewDidUnload
{
    [self setFullIssueText:nil];
    [self setFullIssueText:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)yesVote {
    [IssuesModel vote:YES forIssue:self.issueObjectID];
    [self pushToResults];
}

- (IBAction)noVote {
    [IssuesModel vote:NO forIssue:self.issueObjectID];
    [self pushToResults];
}

- (void)pushToResults {
    ResultsViewController *resultsView = [ResultsViewController new];
    resultsView.passingIssue = self.issueObjectID;
    [self.navigationController pushViewController:resultsView animated:YES];
}
@end
