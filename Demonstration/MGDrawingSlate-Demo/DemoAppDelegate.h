//
//  DemoAppDelegate.h
//  MGDrawingSlate-Demo
//
//  Created by Mihir Garimella on 7/13/12.
//  Copyright (c) 2012 Mihir Garimella.
//  Licensed for use under the MIT License. See the license file included with this source code or visit http://opensource.org/licenses/MIT for more information.
//

#import <UIKit/UIKit.h>

@class DemoViewController;

@interface DemoAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) DemoViewController *viewController;

@end
