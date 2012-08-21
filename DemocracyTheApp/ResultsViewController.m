//
//  ResultsViewController.m
//  DemocracyTheApp
//
//  Created by Rose CW on 8/18/12.
//  Copyright (c) 2012 Rose CW/JJ. All rights reserved.
//

#import "ResultsViewController.h"
#import "IssuesModel.h"
#import <CorePlot-CocoaTouch.h>

@interface ResultsViewController () <CPTBarPlotDelegate, CPTBarPlotDataSource>

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
    self.results = [NSMutableArray arrayWithArray:[IssuesModel resultsForIssues:self.passingIssue]];
//    self.yesVotesLabel.text = [NSString stringWithFormat:@"Yeasayers: %@",[self.results objectAtIndex:1]];
//    self.noVotesLabel.text = [NSString stringWithFormat:@"Naysayers: %@", [self.results objectAtIndex:2]];
//    self.totalVotesLabel.text = [NSString stringWithFormat:@"Sayers: %@", [self.results objectAtIndex:0]];
    self.title = @"Results";
    
//    x-axis =
    
  //initalize graph
    //initialze plot
    double xAxisStart = 0;
    double xAxisLength = 3;
    
    double yAxisStart = 0;
    //double yAxisLength = [[self.results objectAtIndex:0] doubleValue];
    double yAxisLength = 5;
    CPTGraphHostingView* hostingView = [[CPTGraphHostingView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:hostingView];
    
    CPTXYGraph* graph = [[CPTXYGraph alloc]initWithFrame:self.view.bounds];
    hostingView.hostedGraph = graph;
    
    CPTXYPlotSpace* piespace = (CPTXYPlotSpace*)graph.defaultPlotSpace;
    piespace.xRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromDouble(xAxisStart) length: CPTDecimalFromDouble(xAxisLength)];
    piespace.yRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromDouble(yAxisStart) length:CPTDecimalFromDouble(yAxisLength)];
    
    CPTBarPlot* plot = [[CPTBarPlot alloc] initWithFrame:CGRectZero];
    plot.plotRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromDouble(0.0) length:CPTDecimalFromDouble(xAxisLength)];
                 
    plot.dataSource = self;
    
    [graph addPlot:plot];
    
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

-(NSUInteger) numberOfRecordsForPlot:(CPTPlot *)plot {
    return [self.results count];
    NSLog(@"[self.results count]");


}

-(NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)index {
    //pull out relevant results values
//    NSValue* value = [self.results objectAtIndex:index];
    CGPoint point = [[self.results objectAtIndex:index] CGPointValue];
    
    if (fieldEnum == CPTScatterPlotFieldX) {
        return [NSNumber numberWithFloat:point.x];
    } else {
        return [NSNumber numberWithFloat:point.y];
    }
}






@end
