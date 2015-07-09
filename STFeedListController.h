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
@class STFeedRepository;

@interface STFeedListController : NSViewController

@property (readonly, assign) STFeedRepository *repository;
@property (readonly, strong) NSArray *feeds;
@property IBOutlet NSTableView *tableView;
@property IBOutlet NSArrayController *arrayController;
@property (assign) NSObject<STFeedListProtocol> *delegate;

-(id) initWithRepository: (STFeedRepository *) repository;

@end
