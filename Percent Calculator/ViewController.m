//
//  ViewController.m
//  Percent Calculator
//
//  Created by Gent Berani on 12/4/15.
//  Copyright © 2015 GentBerani. All rights reserved.
// Window Title change

#import "ViewController.h"

@implementation ViewController{
    NSUserDefaults *prefs;
    
}
bool widthIsChecked;
@synthesize lblDefaultHeight,lblDefaultWidth,lblResults,etHeight,etViewHeight,etViewWidhth,etWidth,
widthCheck,heightCheck;

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    [lblDefaultWidth setHidden:YES];
    [lblDefaultHeight setHidden:YES];
    prefs = [NSUserDefaults standardUserDefaults];
    if([prefs objectForKey:@"defWidth"]){
        etWidth.stringValue = [[prefs objectForKey:@"defWidth"] stringValue];
    }
    if([prefs objectForKey:@"defHeight"]){
        etHeight.stringValue = [[prefs objectForKey:@"defHeight"] stringValue];
    }
    
    etViewWidhth.delegate = self;
    etViewHeight.delegate = self;
    etWidth.delegate = self;
    etHeight.delegate = self;
    
    
    
    [self setChecksValue];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
}

- (void)controlTextDidChange:(NSNotification *)notification {
    NSTextField *textField = [notification object];
    
    
    if((textField == etViewWidhth || textField == etWidth) && !widthIsChecked){
        widthCheck.state = true;
        [self setCheckBoxWidthTrue];
    }
    
    if((textField == etViewHeight || textField == etHeight) && widthIsChecked){
        heightCheck.state = true;
        [self setCheckBoxHeightTrue];
    }
    
    if(textField.stringValue.length>0)
        [self calculate];
    else
        lblResults.stringValue = @"Result";
}


- (IBAction)copyResult:(id)sender {
    NSPasteboard *pasteBoard = [NSPasteboard generalPasteboard];
    [pasteBoard declareTypes:[NSArray arrayWithObjects:NSStringPboardType, nil] owner:nil];
    [pasteBoard setString: [lblResults stringValue] forType:NSStringPboardType];
    
    [self.btnResult setTitle:@"Copied"];
    [self.btnResult setWantsLayer:YES];
    [[self.btnResult cell] setBackgroundColor:[NSColor redColor]];
    
}

- (IBAction)etViewWidthClick:(id)sender {
    widthCheck.state = true;
    [self setCheckBoxWidthTrue];
    if(etWidth.stringValue.length>0 && etViewWidhth.stringValue.length>0){
        [self calculate];
    }
}


- (IBAction)etViewHeightClick:(id)sender {
    heightCheck.state=true;
    [self setCheckBoxHeightTrue];
    
    if(etHeight.stringValue.length>0 && etViewHeight.stringValue.length>0){
        [self calculate];
    }
    
    
}

- (IBAction)btnCalc:(id)sender {
    
    [self calculate];
}

-(void)calculate{
    
    if(widthCheck.state == false && heightCheck.state== false){
        NSRunAlertPanel(@"Choose an Option", @"Please choose Width or Height as option!", @"OK", nil, nil);
        return;
    }
    
    
    if(widthIsChecked){
        float result =0;
        float width=[etWidth.stringValue floatValue],viewWidth=[etViewWidhth.stringValue floatValue];
        result = (viewWidth / width)*100;
        NSString *g = [NSString stringWithFormat:@"%.01f%%",result];
        if(![g containsString:@"nan"] && ![g containsString:@"inf"])
            lblResults.stringValue = g;
        
    }else{
        float result =0;
        float height=[etHeight.stringValue floatValue],viewHeight=[etViewHeight.stringValue floatValue];
        result = (viewHeight / height)*100;
        NSString *g = [NSString stringWithFormat:@"%.01f%%",result];
        if(![g containsString:@"nan"] && ![g containsString:@"inf"])
            lblResults.stringValue = g;
    }
    
    
    if(etWidth.stringValue.length>0){
        int width = [etWidth.stringValue intValue];
        [prefs setInteger:width forKey:@"defWidth"];
        [self.btnResult setTitle:@"Copy Result"];
    }
    if(etHeight.stringValue.length>0){
        int height = [etHeight.stringValue intValue];
        [prefs setInteger:height forKey:@"defHeight"];
        [self.btnResult setTitle:@"Copy Result"];
    }
    
}


- (IBAction)btnCopyRes:(id)sender {
}
- (IBAction)checkBoxWidth:(id)sender {
    
    [self setCheckBoxWidthTrue];
}
- (IBAction)checkBoxHeight:(id)sender {
    
    [self setCheckBoxHeightTrue];
}

-(void)setChecksValue{
    if([prefs objectForKey:@"widthChecked"]){
        if([[prefs objectForKey:@"widthChecked"] intValue] == 1){
            widthIsChecked = true;
            
            widthCheck.state = true;
            heightCheck.state = false;
        }else{
            widthIsChecked = false;
            
            widthCheck.state = false;
            heightCheck.state = true;
        }
    }else{
        widthCheck.state = false;
        heightCheck.state=false;
    }
}

-(void)setCheckBoxWidthTrue{
    [prefs setInteger:1 forKey:@"widthChecked"];
    widthIsChecked = true;
    heightCheck.state = false;
}
-(void)setCheckBoxHeightTrue{
    [prefs setInteger:0 forKey:@"widthChecked"];
    widthIsChecked = false;
    widthCheck.state = false;
}
- (IBAction)clearDefaultClick:(id)sender {
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    etWidth.stringValue = @"";
    etHeight.stringValue = @"";
    etViewHeight.stringValue =  @"";
    etViewWidhth.stringValue = @"";
}

- (IBAction)etWidthClick:(id)sender {
    widthCheck.state = true;
    [self setCheckBoxWidthTrue];
    
    if(etWidth.stringValue.length>0 && etViewWidhth.stringValue.length>0){
        [self calculate];
    }
}
- (IBAction)etHeightClick:(id)sender {
    heightCheck.state = true;
    [self setCheckBoxHeightTrue];
    if(etHeight.stringValue.length>0 && etViewHeight.stringValue.length>0){
        [self calculate];
    }
}


@end
