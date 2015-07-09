//
// Created by Jan Schulte on 09/07/15.
// Copyright (c) 2015 schultyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MWFeedInfo;


@interface STFeedRepository : NSObject

-(void) createNewFeedFromInfo: (MWFeedInfo *) feedInfo andFeedItems: (NSArray *) feedItems;

@end
