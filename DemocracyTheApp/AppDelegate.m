//
//  AppDelegate.m
//  DemocracyTheApp
//
//  Created by Rose CW on 8/17/12.
//  Copyright (c) 2012 Rose CW/JJ. All rights reserved.
//

#import "AppDelegate.h"
#import "IssuesViewController.h"
#import "TabBarViewController.h"
#import "NewIssuesViewController.h"
#import <Parse/Parse.h>
#import "Keys.h"
#import "CorePlot-CocoaTouch.h"


@implementation AppDelegate
@synthesize managedObjectContext;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [Parse setApplicationId:ParseApplicationKey clientKey:ParseClientKey];
    
    TabBarViewController *tabBar = [TabBarViewController new];
    self.window.rootViewController = tabBar;
    return YES;
    
}

-(void)tableView:(UITableView*) tableView numberOfRowsInSection:(NSInteger)section{
};

- (void)applicationWillResignActive:(UIApplication *)application
{

}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    
}

@end
