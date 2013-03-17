//
//  ViewController.h
//  DiscountCalculator
//
//  Created by Kyle Maysey on 3/15/13.
//  Copyright (c) 2013 Kyle Maysey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DiscountModel.h"

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel* originalResult;       //Outlet for original result
@property (weak, nonatomic) IBOutlet UILabel *discountResult;       //Outlet for discount result
@property (retain, nonatomic) DiscountModel* transData;             //Retain model for transaction

@property (weak, nonatomic) IBOutlet UITextField* priceField;       //Outlet for price
@property (weak, nonatomic) IBOutlet UITextField* instantField;     //Outlet for instant
@property (weak, nonatomic) IBOutlet UITextField* discountField;    //Outlet for discount
@property (weak, nonatomic) IBOutlet UITextField* additionalField;  //Outlet for additional
@property (weak, nonatomic) IBOutlet UITextField* taxField;         //Outlet for tax

@end
