//
// Created by Jan Schulte on 06/07/15.
// Copyright (c) 2015 schultyy. All rights reserved.
//

#import "STEpisodeListController.h"
#import "STFeed.h"

@interface STEpisodeListController()
@property (readwrite) NSArray *episodes;
@end

@implementation STEpisodeListController

-(id)initWithFeed:(STFeed *)feed {
    self = [super initWithNibName:@"STEpisodeListView" bundle:nil];
    if(self) {
        [self setEpisodes:NSArray.array];
    }
    return self;
}

@end
