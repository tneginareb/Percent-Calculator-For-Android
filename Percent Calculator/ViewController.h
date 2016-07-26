//
//  ViewController.h
//  Percent Calculator
//
//  Created by Gent Berani on 12/4/15.
//  Copyright © 2015 GentBerani. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <QuartzCore/QuartzCore.h>
@interface ViewController : NSViewController <NSTextFieldDelegate>


@property (weak) IBOutlet NSButton *heightCheck;

@property (weak) IBOutlet NSButton *widthCheck;

@property (weak) IBOutlet NSButton *btnResult;
@property (weak) IBOutlet NSTextField *etWidth;
@property (weak) IBOutlet NSTextField *etHeight;
@property (weak) IBOutlet NSTextField *etViewWidhth;
@property (weak) IBOutlet NSTextField *etViewHeight;
@property (weak) IBOutlet NSTextField *lblResults;
@property (weak) IBOutlet NSTextField *lblDefaultWidth;
@property (weak) IBOutlet NSTextField *lblDefaultHeight;
- (IBAction)copyResult:(id)sender;
- (IBAction)checkBoxHeight:(id)sender;

- (IBAction)etViewWidthClick:(id)sender;
- (IBAction)etViewHeightClick:(id)sender;

- (IBAction)btnCalc:(id)sender;
- (IBAction)btnCopyRes:(id)sender;
- (IBAction)checkBoxWidth:(id)sender;




@end

