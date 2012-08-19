//
//  TabBarViewController.m
//  DemocracyTheApp
//
//  Created by Rose CW on 8/17/12.
//  Copyright (c) 2012 Rose CW/JJ. All rights reserved.
//

#import "TabBarViewController.h"
#import "IssuesViewController.h"
#import "NewIssuesViewController.h"



@interface TabBarViewController ()<UINavigationBarDelegate>

@end

@implementation TabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    IssuesViewController *issuesViewController = [IssuesViewController new];
    issuesViewController.title = @"View Issues";
    NewIssuesViewController *newIssueView = [NewIssuesViewController new];
    newIssueView.title = @"Add New Issue";
    
    UINavigationController* issueNavController = [[UINavigationController alloc] initWithRootViewController: issuesViewController];
    self.viewControllers = [[NSArray alloc] initWithObjects:issueNavController, newIssueView, nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
