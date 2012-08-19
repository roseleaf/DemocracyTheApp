//
//  NewIssuesViewController.m
//  DemocracyTheApp
//
//  Created by Rose CW on 8/17/12.
//  Copyright (c) 2012 Rose CW/JJ. All rights reserved.
//

#import "NewIssuesViewController.h"
#import <Parse/Parse.h>
#import "IssuesModel.h"
#import "IssuesViewController.h"

@interface NewIssuesViewController () <UITabBarControllerDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *issueInput;

@end

@implementation NewIssuesViewController
@synthesize issueInput;

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
    self.issueInput.delegate = self;

}

- (void)viewDidUnload
{
    [self setIssueInput:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSString *newIssue = self.issueInput.text;
    [IssuesModel addIssue:newIssue];
    [self.issueInput resignFirstResponder];
    self.tabBarController.selectedIndex = 0;
    return NO;
}

@end
