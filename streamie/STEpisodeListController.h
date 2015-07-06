//
// Created by Jan Schulte on 06/07/15.
// Copyright (c) 2015 schultyy. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface STEpisodeListController : NSViewController

@property (readonly) NSArray *episodes;

-(id) initWithFeed: (NSManagedObject *)feed;

@end
