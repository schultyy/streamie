//
//  STFeedListController.h
//  streamie
//
//  Created by Jan Schulte on 06/07/15.
//  Copyright (c) 2015 schultyy. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "STDataContext.h"

@protocol STFeedListProtocol;

@interface STFeedListController : NSViewController

@property (retain) STDataContext *dataContext;
@property IBOutlet NSTableView *tableView;
@property IBOutlet NSArrayController *arrayController;
@property (assign) NSObject<STFeedListProtocol> *delegate;

-(id) initWithDataContext: (STDataContext *) context;

@end
