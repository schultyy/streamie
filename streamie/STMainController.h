//
//  STMainController.h
//  streamie
//
//  Created by Jan Schulte on 06/07/15.
//  Copyright (c) 2015 schultyy. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "STFeedListController.h"
#import "STDataContext.h"

@interface STMainController : NSWindowController

@property (readonly, strong) STDataContext *dataContext;
@property (readonly, strong) STFeedListController *feedListController;
@property IBOutlet NSBox *currentView;
-(void)addFeed;

@end
