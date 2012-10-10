//
//  DemoViewController.h
//  MGDrawingSlate-Demo
//
//  Created by Mihir Garimella on 7/13/12.
//  Copyright (c) 2012 Mihir Garimella.
//  Licensed for use under the MIT License. See the license file included with this source code or visit http://opensource.org/licenses/MIT for more information.
//

#import <UIKit/UIKit.h>
#import "InfColorPicker/InfColorPickerController.h" //Color picker controller - only for demonstration app

@interface DemoViewController : UIViewController <InfColorPickerControllerDelegate, UIAlertViewDelegate>

//Necessary for MGDrawingSlate core functionality
@property (weak, nonatomic) IBOutlet UIView *placeholderView; //To be able to set the frame of the drawing slate in Interface Builder. The placeholder view is removed in the viewDidLoad method and is replaced with an MGDrawingSlate. Alternatively, one could just initialize the drawing slate with initWithFrame:CGRectMake(...).

//Only for demonstration app
- (IBAction)changeColor:(id)sender;
- (IBAction)changeLineWeight:(id)sender;
- (IBAction)clearSlate:(id)sender;
- (IBAction)saveImage:(id)sender;
- (IBAction)showInfo:(id)sender;

@end
