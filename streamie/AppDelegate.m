//
//  AppDelegate.m
//  streamie
//
//  Created by Jan Schulte on 06/07/15.
//  Copyright (c) 2015 schultyy. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (readwrite, strong) STMainController *mainController;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [self setMainController: [[STMainController alloc] init]];
    [[self mainController] showWindow:self];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

-(IBAction)addFeed:(id)sender {
    [[self mainController] addFeed];
}

@end
