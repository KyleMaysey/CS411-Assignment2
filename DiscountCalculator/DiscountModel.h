//
//  DiscountModel.h
//  DiscountCalculator
//
//  Created by Kyle Maysey on 3/15/13.
//  Copyright (c) 2013 Kyle Maysey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DiscountModel : NSObject

@property (retain, nonatomic) NSDecimalNumber* basePrice;           //property to store the base price or transaction
@property (retain, nonatomic) NSDecimalNumber* originalPrice;       //property to store the original sale price of the transaction
@property (retain, nonatomic) NSDecimalNumber* discountPrice;       //property to store the discounted sale price of the transaction
@property (retain, nonatomic) NSDecimalNumber* instantDiscount;     //property to store instant amount reduction of price
@property (retain, nonatomic) NSDecimalNumber* initialDiscount;     //property to store initial discount in dollars
@property (retain, nonatomic) NSDecimalNumber* additionalDiscount;  //property to store the additional discount in dollars
@property (retain, nonatomic) NSDecimalNumber* taxAmount;           //property to store the tax in dollars


//Purpose:  Calculate the transaction information.
//Input:    Values from the view, sent by the view controller
-(void) calcTransDataFromPrice:(double)price withInstDiscount:(double)instDisc withPercDiscount:(double)disc withAddtDiscount:(double)addtDisc withTax:(double)tax;


//Purpose:  Debugging statement to check contents of model
//Input:    None
-(void) printContents;

@end
