//
//  DiscountModel.m
//  DiscountCalculator
//
//  Created by Kyle Maysey on 3/15/13.
//  Copyright (c) 2013 Kyle Maysey. All rights reserved.
//

#import "DiscountModel.h"

@implementation DiscountModel

//Purpose:  Calculate the transaction information.
//Input:    Values from the view, sent by the view controller
-(void) calcTransDataFromPrice:(double)price withInstDiscount:(double)instDisc withPercDiscount:(double)disc withAddtDiscount:(double)addtDisc withTax:(double)tax
{
    self.basePrice = [NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%f",price]];
    self.instantDiscount = [NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%f",instDisc]];
    
    double tempTotal, tempDisc;    //double variables used to perform discount calculation
    tempTotal = price * (1.0 + (tax / 100.0));   //Calculate original price of transaction
    
    self.originalPrice = [NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%f",tempTotal]];
    
    tempTotal = price - instDisc;       //Apply instant decrease
    
    tempDisc = tempTotal * (disc/100.0);    //Find dollar amount of initial discount
    
    self.initialDiscount = [NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%f",tempDisc]];
    
    tempTotal = tempTotal - tempDisc;       //Apply initial discount
    
    tempDisc = tempTotal * (addtDisc/100.0);    //Find dollar amount of additional discount
    
    self.additionalDiscount = [NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%f",tempDisc]];
    
    tempTotal = tempTotal - tempDisc;       //Apply additional discount
    
    tempDisc = tempTotal * (tax/100.0);     //Find dollar amount of tax
    
    self.taxAmount = [NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%f",tempDisc]];
    
    tempTotal = tempTotal + tempDisc;       //Apply tax to get final amount
    
    self.discountPrice = [NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%f",tempTotal]];
}

//Purpose:  Debugging statement to check contents of model
//Input:    None
-(void) printContents
{
    NSLog(@"base: %f\noriginal: %f\ndiscount: %f\ninstant: %f\ninitial: %f\naddt: %f\ntax: %f", [self.basePrice doubleValue], [self.originalPrice doubleValue],[self.discountPrice doubleValue], [self.instantDiscount doubleValue], [self.initialDiscount doubleValue], [self.additionalDiscount doubleValue], [self.taxAmount doubleValue]);
}

@end
