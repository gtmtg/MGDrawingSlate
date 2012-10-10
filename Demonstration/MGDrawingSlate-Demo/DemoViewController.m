//
//  DemoViewController.m
//  MGDrawingSlate-Demo
//
//  Created by Mihir Garimella on 7/13/12.
//  Copyright (c) 2012 Mihir Garimella.
//  Licensed for use under the MIT License. See the license file included with this source code or visit http://opensource.org/licenses/MIT for more information.
//

#import "DemoViewController.h"
#import "MGDrawingSlate/MGDrawingSlate.h" //MGDrawingSlate header file - necessary for MGDrawingSlate core functionality
#import <QuartzCore/QuartzCore.h> //Needed to export the MGDrawingSlate to an image (and in this case save it to the Camera Roll) - only for demonstration app

@interface DemoViewController ()

@end

@implementation DemoViewController
@synthesize placeholderView; //See header file for more info - necessary for MGDrawingSlate core functionality

MGDrawingSlate *drawingSlate; //MGDrawingSlate object - necessary for MGDrawingSlate core functionality
CGRect placeholderFrame; //Stores placeholder 

#pragma mark - Initialization

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    //Replace the placeholder view with an MGDrawingSlate - necessary for MGDrawingSlate core functionality
    placeholderFrame = self.placeholderView.frame;
    [self.placeholderView removeFromSuperview];
    drawingSlate = [[MGDrawingSlate alloc] initWithFrame:placeholderFrame]; //Creates MGDrawingSlate with default line weight (4) and drawing color (black)
    [self.view addSubview:drawingSlate];
    
}

#pragma mark - Demonstration App Methods

// Present color picker - only for demonsration app
- (IBAction)changeColor:(id)sender {
    
    InfColorPickerController *colorPicker = [InfColorPickerController colorPickerViewController];
    
    colorPicker.sourceColor = drawingSlate->drawingColor;
    colorPicker.delegate = self;
    
    [colorPicker presentModallyOverViewController:self];
    
}

//Get new color specified by user and set it - only for demonstration app
- (void) colorPickerControllerDidFinish: (InfColorPickerController*) colorPicker {
    
    [drawingSlate changeColorTo:colorPicker.resultColor];

    [self dismissModalViewControllerAnimated:YES];
    
}

//Present a dialogue asking for the new weight - only for demonstration app
- (IBAction)changeLineWeight:(id)sender {

    UIAlertView *changeWeight = [[UIAlertView alloc] initWithTitle:@"Change Line Weight" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [changeWeight setAlertViewStyle:UIAlertViewStylePlainTextInput];
    
    [[changeWeight textFieldAtIndex:0] setPlaceholder:@"Line Weight"];
    [[changeWeight textFieldAtIndex:0] setKeyboardType:UIKeyboardTypeNumberPad];
    [[changeWeight textFieldAtIndex:0] setText:[NSString stringWithFormat:@"%d",(int)drawingSlate->drawingPath.lineWidth]];
    
    [changeWeight show];
    
}

//Get new weight value specified by user and set it - only for demonstration app
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if(buttonIndex != alertView.cancelButtonIndex) {
        
        NSString *newWeightString = [[alertView textFieldAtIndex:0] text];
        [drawingSlate changeLineWeightTo:[newWeightString integerValue]];
        
    }
    
}

//Clear MGDrawingSlate - only for demonstration app
- (IBAction)clearSlate:(id)sender {
    
    //Capture current settings of the MGDrawingSlate in order to restore them back later
    NSInteger drawingWeight = (int)drawingSlate->drawingPath.lineWidth;
    UIColor *drawingColor = drawingSlate->drawingColor;
    
    [drawingSlate removeFromSuperview]; //Remove old MGDrawingSlate
    
    //Create new MGDrawingSlate and restore the settings
    drawingSlate = [[MGDrawingSlate alloc] initWithFrame:placeholderFrame];
    [self.view addSubview:drawingSlate];
    [drawingSlate changeLineWeightTo:drawingWeight];
    [drawingSlate changeColorTo:drawingColor];
    
}

//Save drawing to camera roll - only for demonstration app
- (IBAction)saveImage:(id)sender {
    
    UIGraphicsBeginImageContextWithOptions(drawingSlate.bounds.size, drawingSlate.opaque, 0.0);
    [drawingSlate.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(img, nil, nil, nil);
    
}

//Show copyright and license info - only for demonstration app
- (IBAction)showInfo:(id)sender {
    
    UIAlertView *info = [[UIAlertView alloc] initWithTitle:@"About" message:@"Both MGDrawingSlate and this demonstration app are © 2012 Mihir Garimella and are licensed for use under the MIT License. Some rights reserved.\n\nThe color picker used in this demonstration app is © 2011 InfinitApps, and is also licensed for use under the MIT License." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [info show];
    
}

#pragma mark - Miscellaneous Methods

- (void)viewDidUnload
{
    
    [self setPlaceholderView:nil];
    [super viewDidUnload];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
    
}

@end
