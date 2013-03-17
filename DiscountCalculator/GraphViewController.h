//
//  GraphViewController.h
//  DiscountCalculator
//
//  Created by Kyle Maysey on 3/15/13.
//  Copyright (c) 2013 Kyle Maysey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DiscountModel.h"
#import "drawingView.h"

@interface GraphViewController : UIViewController

@property (retain, nonatomic) DiscountModel* graphTransData;    //Model for transaction information
@property (retain, nonatomic) IBOutlet drawingView* myView;     //Outlet for sending info to view
@property (weak, nonatomic) IBOutlet UILabel *youSaved;         //Outlet for displaying how much money was saved

@end
