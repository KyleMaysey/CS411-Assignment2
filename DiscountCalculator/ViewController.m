//
//  ViewController.m
//  DiscountCalculator
//
//  Created by Kyle Maysey on 3/15/13.
//  Copyright (c) 2013 Kyle Maysey. All rights reserved.
//

#import "ViewController.h"
#import "GraphViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#define FieldCount 5

@synthesize transData;      //Synthesize model to overwrite getter

//Purpose:  Resign first responders on touch events
//Input:    Event signal sent
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.priceField resignFirstResponder];
    [self.instantField resignFirstResponder];
    [self.discountField resignFirstResponder];
    [self.additionalField resignFirstResponder];
    [self.taxField resignFirstResponder];
}

//Purpose:  Action the occurs on press of Calculate button
//Input:    The calculate button
- (IBAction)calcPrice:(UIButton *)sender
{
    [self.transData calcTransDataFromPrice:[self.priceField.text doubleValue] withInstDiscount:[self.instantField.text doubleValue] withPercDiscount:[self.discountField.text doubleValue] withAddtDiscount:[self.additionalField.text doubleValue] withTax:[self.taxField.text doubleValue]];
    
    [self.transData printContents];
    
    self.originalResult.text = [NSString stringWithFormat:@"%.2f", [self.transData.originalPrice doubleValue]];
    
    self.discountResult.text = [NSString stringWithFormat:@"%.2f", [self.transData.discountPrice doubleValue]];
}


//Purpose:  To generate a custom toolbar to help with textfield navigation
//Input:    Touched a textfield
-(BOOL) textFieldShouldBeginEditing:(UITextField *)textField
{
    //NSLog(@"made it");        //Realized I wasn't delegating textfield
    
    //Following code slightly altered from that found in textfield demo in class repo
    NSUInteger tempTag = textField.tag;
    NSUInteger nextTag = (tempTag + 1) % FieldCount;
    
    int temp = (tempTag - 1);
    if (temp < 0)
        temp = FieldCount - 1;
    
    NSUInteger prevTag = temp % FieldCount;
    
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    [toolbar sizeToFit];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
                                   initWithTitle: @"←"
                                   style: UIBarButtonItemStyleDone
                                   target: self
                                   action:@selector(backClicked:)];
    backButton.tag = prevTag;
    
    UIBarButtonItem *forwButton = [[UIBarButtonItem alloc]
                                   initWithTitle: @"➔"
                                   style: UIBarButtonItemStyleDone
                                   target: self
                                   action:@selector(forwClicked:)];
    forwButton.tag = nextTag;
    
    UIBarButtonItem *flexButton = [[UIBarButtonItem alloc]
                                   initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace
                                   target: self
                                   action: nil];
    
    UIBarButtonItem *doneButton =[[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem: UIBarButtonSystemItemDone
                                  target: self
                                  action: @selector(doneClicked:)];
    doneButton.tag = tempTag;
    
    NSArray* itemsArray = @[backButton, forwButton, flexButton, doneButton];
    
    [toolbar setItems: itemsArray];
    
    [textField setInputAccessoryView: toolbar];
    
    return YES;
    
}


//Purpose:  Move to next text field when right arrow button on toolbar pressed
//Input:    Right arrow button
- (void)forwClicked: (UIBarButtonItem*) sender
{
    NSInteger tag = sender.tag;
    if( tag == 0 )
    {
        [self.priceField becomeFirstResponder];
    }
    else if (tag == 1)
    {
        [self.instantField becomeFirstResponder];
    }
    else if (tag == 2)
    {
        [self.discountField becomeFirstResponder];
    }
    else if (tag == 3)
    {
        [self.additionalField becomeFirstResponder];
    }
    else
    {
        [self.taxField becomeFirstResponder];
    }
}

//Purpose:  Move to previous text field when left arrow button on toolbar pressed
//Input:    Left arrow button
- (void)backClicked: (UIBarButtonItem*) sender
{
    NSInteger tag = sender.tag;
    if( tag == 0 )
    {
        [self.priceField becomeFirstResponder];
    }
    else if (tag == 1)
    {
        [self.instantField becomeFirstResponder];
    }
    else if (tag == 2)
    {
        [self.discountField becomeFirstResponder];
    }
    else if (tag == 3)
    {
        [self.additionalField becomeFirstResponder];
    }
    else
    {
        [self.taxField becomeFirstResponder];
    }
}

//Purpose:  Resign first responders when done button on toolbar is pressed
//Input:    Done button
- (void) doneClicked: (UIBarButtonItem*) sender
{
    NSInteger tag = sender.tag;
    if( tag == 0 )
    {
        [self.priceField resignFirstResponder];
    }
    else if (tag == 1)
    {
        [self.instantField resignFirstResponder];
    }
    else if (tag == 2)
    {
        [self.discountField resignFirstResponder];
    }
    else if (tag == 3)
    {
        [self.additionalField resignFirstResponder];
    }
    else
    {
        [self.taxField resignFirstResponder];
    }
}


//Purpose:  Custom setter for lazy instantiation of model data by
//Input:    None
-(DiscountModel*) transData
{
    if(transData == nil)
    {
        transData = [[DiscountModel alloc]init];
    }
    
    return transData;
}

//Purpose:  Function called after view loads
//Input:    None
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

//Purpose:  Function called after memory warning
//Input:    None
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Purpose:  Send model to GraphViewController
//Input:    The ViewController requesting segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ((GraphViewController*)(segue.destinationViewController)).graphTransData = self.transData;
}

@end
