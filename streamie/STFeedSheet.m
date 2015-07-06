//
//  STFeedSheet.m
//  streamie
//
//  Created by Jan Schulte on 06/07/15.
//  Copyright (c) 2015 schultyy. All rights reserved.
//

#import "STFeedSheet.h"

@interface STFeedSheet ()

@end

@implementation STFeedSheet

-(id) init {
    self = [super initWithWindowNibName:@"STFeedSheet"];
    return self;
}

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

-(IBAction)addFeed:(id)sender {
    [[self window] orderOut:self];
    [NSApp endSheet:self.window returnCode:0];
}

-(IBAction)cancelAddFeed:(id)sender {
    [[self window] orderOut:self];
    [NSApp endSheet:self.window returnCode:1];
}

@end
