//
// Created by Jan Schulte on 06/07/15.
// Copyright (c) 2015 schultyy. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class STFeedListController;

@protocol STFeedListProtocol <NSObject>
-(void) controller: (STFeedListController *) controller didSelectFeed: (NSManagedObject *)selectedFeed;
@end
