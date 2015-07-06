//
//  STMainController.m
//  streamie
//
//  Created by Jan Schulte on 06/07/15.
//  Copyright (c) 2015 schultyy. All rights reserved.
//

#import "STMainController.h"

@interface STMainController ()

@end

@implementation STMainController

-(id) init {
    self = [super initWithWindowNibName:@"STMainWindow"];
    return self;
}

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

-(void)addFeed {
    NSLog(@"Add feed");
}

@end
