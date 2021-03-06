//
//  STMainController.h
//  streamie
//
//  Created by Jan Schulte on 06/07/15.
//  Copyright (c) 2015 schultyy. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "STFeedListController.h"
#import "STFeedListProtocol.h"

@class STEpisodeListController;

@interface STMainController : NSWindowController<STFeedListProtocol>

@property (readonly, strong) STFeedListController *feedListController;
@property (readonly, strong) STEpisodeListController *episodeListController;
@property IBOutlet NSBox *masterView;
@property IBOutlet NSBox *detailView;
-(void)addFeed;

@end
