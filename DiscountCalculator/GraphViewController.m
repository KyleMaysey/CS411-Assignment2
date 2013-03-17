//
//  GraphViewController.m
//  DiscountCalculator
//
//  Created by Kyle Maysey on 3/15/13.
//  Copyright (c) 2013 Kyle Maysey. All rights reserved.
//

#import "GraphViewController.h"
#import "ViewController.h"

@interface GraphViewController ()

@end

@implementation GraphViewController

@synthesize graphTransData;


//Purpose:  Function called when ViewController recieved from storyboard
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}


//Purpose:  Function called when view successfully loads
//          Used to send information needed for drawing to the view
//Input:    None
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    double temp = [self.graphTransData.originalPrice doubleValue];
    temp = temp - [self.graphTransData.discountPrice doubleValue];      //Calculate price difference
    self.myView.priceDiff = [NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%f", temp]];      //Send price difference to view
    self.myView.totalAmt = self.graphTransData.originalPrice;       //Send original price to view
    self.myView.discAmt = self.graphTransData.discountPrice;        //Send discount price to view
    
    [self.myView setNeedsDisplay];      //Tell view it needs to redraw
    
    if (temp > 0.0)     //Update UI label for price difference
    {
        UILabel *totalLabel = [[UILabel alloc]initWithFrame:CGRectMake(65, 200, 100, 40)];
        [totalLabel setBackgroundColor:[UIColor clearColor]];
        [totalLabel setText:[NSString stringWithFormat:@"$%.2f", self.graphTransData.originalPrice.doubleValue]];
        [self.myView addSubview:totalLabel];
        
        UILabel *diffLabel = [[UILabel alloc]initWithFrame:CGRectMake(200, 50, 100, 40)];
        [diffLabel setBackgroundColor:[UIColor clearColor]];
        [diffLabel setText:[NSString stringWithFormat:@"$%.2f", temp]];
        [self.myView addSubview:diffLabel];
        
        UILabel *discLabel = [[UILabel alloc]initWithFrame:CGRectMake(200, 280, 100, 40)];
        [discLabel setBackgroundColor:[UIColor clearColor]];
        [discLabel setText:[NSString stringWithFormat:@"$%.2f", self.graphTransData.discountPrice.doubleValue]];
        [self.myView addSubview:discLabel];
        
        self.youSaved.text = [NSString stringWithFormat:@"$ %.2f", temp];
    }
    else
    {
        self.youSaved.text = @"Nothing";
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Purpose:  Send model back to ViewController
//Input:    The ViewController requesting segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ((ViewController*)(segue.destinationViewController)).transData = self.graphTransData;
}


@end
