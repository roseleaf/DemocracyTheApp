//
//  IssuesViewController.m
//  DemocracyTheApp
//
//  Created by Rose CW on 8/17/12.
//  Copyright (c) 2012 Rose CW/JJ. All rights reserved.
//

#import "IssuesViewController.h"
#import "IssuesModel.h"
#import "ShowIssueViewController.h"
#import <Parse/Parse.h>

@interface IssuesViewController () <UITableViewDataSource, UITableViewDelegate, UITabBarControllerDelegate, UINavigationBarDelegate>
@property (weak, nonatomic) IBOutlet UITableView *issuesTable;
 
@end

@implementation IssuesViewController 
@synthesize issuesTable;
@synthesize objectID;
@synthesize issueText;

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
    self.issuesTable.delegate = self;
    self.issuesTable.dataSource = self;
    
//    UINavigationBar* issueNavBar = [UINavigationBar new];
//    issueNavBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
}

- (void)viewDidUnload
{
    [self setIssuesTable:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[IssuesModel issues] count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSMutableArray* issueTexts = [NSMutableArray new];
    NSArray* issues = [IssuesModel issues];

    for (PFObject* issue in issues) {
        NSString* issueText = [issue objectForKey:@"issueText"];
        [issueTexts addObject:issueText];
    }
    
    UITableViewCell* cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = [issueTexts objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)viewDidAppear:(BOOL)animated {
    animated = YES;
    [self.issuesTable reloadData];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PFObject* issue = [[IssuesModel issues]objectAtIndex:indexPath.row];
    [self pushShowViewControllerWithIssue:issue];
}

-(IBAction)pushShowViewControllerWithIssue:(PFObject*)issue {
    ShowIssueViewController* showIssueView = [ShowIssueViewController new];
    NSString *text = [issue objectForKey:@"issueText"];
    showIssueView.issueLabelText = text;
    showIssueView.issueObjectID = issue.objectId;

    [self.navigationController pushViewController:showIssueView animated:YES];
    
    
}

@end
