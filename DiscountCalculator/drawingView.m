//
//  drawingView.m
//  DiscountCalculator
//
//  Created by Kyle Maysey on 3/16/13.
//  Copyright (c) 2013 Kyle Maysey. All rights reserved.
//

#import "drawingView.h"

@implementation drawingView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


//Purpose:  Initilize when view is read from archive
//Input:    None
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        customRectHeight = 300.0;   //Set drawn rect height
        customRectWidth = 100.0;    //Set drawn rect width
        customRectPadding  = 40.0;  //Set drawn rect padding
    }
    
    return self;
}

//Purpose:  Draw function when view is told to refresh
//Input:    None
- (void)drawRect:(CGRect)rect
{
    
    CGContextRef context = UIGraphicsGetCurrentContext();   //Get graphics context
    
    if ([self.totalAmt doubleValue] != 0.0)                 //Check if amount was entered
    {
        
        // And drawing with a red fill color
        CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 1.0);  //Set red fill color for first bar

    
        CGContextFillRect(context, CGRectMake(customRectPadding, customRectPadding, customRectWidth, customRectHeight));
    
        double diffPerc = [self.priceDiff doubleValue] / [self.totalAmt doubleValue];
        diffPerc = diffPerc * customRectHeight;     //Calculate the height of bar for saved amount
    
        CGContextSetRGBFillColor(context, 1.0, 0.0, 1.0, 1.0);
    
        CGContextFillRect(context, CGRectMake((2 * customRectPadding + customRectWidth), customRectPadding, customRectWidth, diffPerc));    //Draw "saved" bar purple
    
        CGContextSetRGBFillColor(context, 0.0, 0.0, 1.0, 1.0);
        CGContextFillRect(context, CGRectMake((2 * customRectPadding + customRectWidth), (customRectPadding + diffPerc), customRectWidth, (customRectHeight - diffPerc)));  //Draw discount price bar blue.
        
    }
    
    
    
}


@end
