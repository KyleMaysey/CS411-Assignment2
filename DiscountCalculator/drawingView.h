//
//  drawingView.h
//  DiscountCalculator
//
//  Created by Kyle Maysey on 3/16/13.
//  Copyright (c) 2013 Kyle Maysey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface drawingView : UIView
{
    float customRectHeight;
    float customRectWidth;
    float customRectPadding;
}

@property (strong, nonatomic) NSDecimalNumber* priceDiff;   //Property storing price difference.  Used to derive height of discount price bar
@property (strong, nonatomic) NSDecimalNumber* totalAmt;    //Property for original price.  Used in deriving height of price difference and discount price bar.
@property (strong, nonatomic) NSDecimalNumber* discAmt;     //Property for discount amount.

@end
