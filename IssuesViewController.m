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
@property (strong, nonatomic) NSArray *issues;
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
    self.issues = [IssuesModel issues];
    
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

-(void)viewDidAppear:(BOOL)animated {
    animated = YES;
    self.issues = [IssuesModel issues];
    [self.issuesTable reloadData];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.issues count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSMutableArray* issueTexts = [NSMutableArray new];
    for (PFObject* issue in self.issues) {
        NSString* issueText = [issue objectForKey:@"issueText"];
        [issueTexts addObject:issueText];
    }
    
    UITableViewCell* cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    cell.textLabel.text = [issueTexts objectAtIndex:indexPath.row];
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PFObject* issue = [self.issues objectAtIndex:indexPath.row];
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
