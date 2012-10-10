//
//  DemoAppDelegate.m
//  MGDrawingSlate-Demo
//
//  Created by Mihir Garimella on 7/13/12.
//  Copyright (c) 2012 Mihir Garimella.
//  Licensed for use under the MIT License. See the license file included with this source code or visit http://opensource.org/licenses/MIT for more information.
//

#import "DemoAppDelegate.h"

#import "DemoViewController.h"

@implementation DemoAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[DemoViewController alloc] initWithNibName:@"DemoViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
