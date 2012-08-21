//
//  ResultsViewController.m
//  DemocracyTheApp
//
//  Created by Rose CW on 8/18/12.
//  Copyright (c) 2012 Rose CW/JJ. All rights reserved.
//

#import "ResultsViewController.h"
#import "IssuesModel.h"

@interface ResultsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *yesVotesLabel;
@property (weak, nonatomic) IBOutlet UILabel *noVotesLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalVotesLabel;

@end

@implementation ResultsViewController
@synthesize yesVotesLabel;
@synthesize noVotesLabel;
@synthesize totalVotesLabel;
@synthesize passingIssue;
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
    NSArray* results = [IssuesModel resultsForIssues:self.passingIssue];
    self.yesVotesLabel.text = [NSString stringWithFormat:@"Yeasayers: %@",[results objectAtIndex:1]];
    self.noVotesLabel.text = [NSString stringWithFormat:@"Naysayers: %@", [results objectAtIndex:2]];
    self.totalVotesLabel.text = [NSString stringWithFormat:@"Sayers: %@", [results objectAtIndex:0]];
    self.title = @"Results";
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setYesVotesLabel:nil];
    [self setNoVotesLabel:nil];
    [self setTotalVotesLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
