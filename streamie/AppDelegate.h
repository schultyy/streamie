//
//  AppDelegate.h
//  streamie
//
//  Created by Jan Schulte on 06/07/15.
//  Copyright (c) 2015 schultyy. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "STMainController.h"
#import "STDataContext.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (readonly, strong) STMainController *mainController;

-(IBAction)addFeed:(id)sender;

@end

