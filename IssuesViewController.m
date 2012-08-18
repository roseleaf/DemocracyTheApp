//
//  IssuesViewController.m
//  DemocracyTheApp
//
//  Created by Rose CW on 8/17/12.
//  Copyright (c) 2012 Rose CW/JJ. All rights reserved.
//

#import "IssuesViewController.h"

@interface IssuesViewController () <UITableViewDataSource, UITableViewDelegate, UITabBarControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *issuesTable;

@end

@implementation IssuesViewController 
@synthesize issuesTable;

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
    
    // Do any additional setup after loading the view from its nib.
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

@end
