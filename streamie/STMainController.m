//
//  STMainController.m
//  streamie
//
//  Created by Jan Schulte on 06/07/15.
//  Copyright (c) 2015 schultyy. All rights reserved.
//

#import "STMainController.h"
#import "STFeedSheet.h"

@interface STMainController ()
@property (retain) STFeedSheet *feedSheet;
@property (readwrite, strong) STDataContext *dataContext;
@end

@implementation STMainController

-(id) init {
    self = [super initWithWindowNibName:@"STMainWindow"];
    if(self) {
        [self setDataContext: [[STDataContext alloc] init]];
    }
    return self;
}

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

-(void)addFeed {
    [self setFeedSheet: [[STFeedSheet alloc] init]];
    [NSApp beginSheet:self.feedSheet.window modalForWindow:self.window modalDelegate:self didEndSelector:@selector(didEnd:returnCode:context:) contextInfo:NULL];
}

-(void)didEnd:(NSWindow *) sheet
   returnCode:(NSInteger) returnCode
      context:(void *) context {
    if(returnCode == 0) {
        NSManagedObject *feed = [[self dataContext] createFeed];
        [feed setValue:self.feedSheet.address forKey:@"address"];
        [[self dataContext] save:nil];
    }
    [self setFeedSheet:nil];
}

@end
