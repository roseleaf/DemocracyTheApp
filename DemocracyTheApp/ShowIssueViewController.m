//
//  ShowIssueViewController.m
//  DemocracyTheApp
//
//  Created by Rose CW on 8/18/12.
//  Copyright (c) 2012 Rose CW/JJ. All rights reserved.
//

#import "ShowIssueViewController.h"
#import "IssueResponseViewController.h"
#import "ResultsViewController.h"


@interface ShowIssueViewController ()
- (IBAction)goToResponseViewButton:(UIButton *)sender;
- (IBAction)goToResultsViewButton:(UIButton *)sender;


@end

@implementation ShowIssueViewController
@synthesize fullIssueText;
@synthesize issueObjectID;
@synthesize title;
@synthesize issueLabelText;

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
    self.title = @"Be Heard";
    self.fullIssueText.text = self.issueLabelText;

}

- (void)viewDidUnload
{
    [self setFullIssueText:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)goToResponseViewButton:(UIButton *)sender {
    IssueResponseViewController *responsePage = [IssueResponseViewController new];
    responsePage.issueObjectID = self.issueObjectID;
    responsePage.passingIssueText = self.fullIssueText.text;
    [self.navigationController pushViewController:responsePage animated:YES];
}

- (IBAction)goToResultsViewButton:(UIButton *)sender {
    ResultsViewController *resultPage = [ResultsViewController new];
    resultPage.passingIssue = self.issueObjectID;
    [self.navigationController pushViewController:resultPage animated:YES];
}
@end
