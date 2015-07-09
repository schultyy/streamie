//
// Created by Jan Schulte on 06/07/15.
// Copyright (c) 2015 schultyy. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class STFeed;


@interface STEpisodeListController : NSViewController

@property (readonly) NSArray *episodes;

-(id) initWithFeed: (STFeed *)feed;

@end
