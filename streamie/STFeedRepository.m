//
// Created by Jan Schulte on 09/07/15.
// Copyright (c) 2015 schultyy. All rights reserved.
//

#import <MWFeedParser/MWFeedItem.h>
#import "STFeedRepository.h"
#import "MWFeedInfo.h"
#import "STDataContext.h"
#import "Underscore.h"

@interface STFeedRepository()

@property (strong) STDataContext *dataContext;

@end

@implementation STFeedRepository

-(id) init {
    self = [super init];
    if(self) {
        [self setDataContext:[[STDataContext alloc] init]];
    }
    return self;
}

-(void) createNewFeedFromInfo: (MWFeedInfo *) feedInfo andFeedItems: (NSArray *) feedItems {
    NSManagedObject *feed = [[self dataContext] createFeed];
    [feed setValue:feedInfo.link forKey:@"address"];
    NSSet *episodes = [NSSet setWithArray:
        Underscore.arrayMap(feedItems, ^(MWFeedItem *episode) {
            return [self createEpisodeFromFeedItem:episode];
    })];
    [feed setValue:episodes forKey:@"episodes"];
    [[self dataContext] save:nil];
}

- (NSManagedObject *) createEpisodeFromFeedItem: (MWFeedItem *) episode {
    NSManagedObject *episodeEntity = [[self dataContext] createEpisode];
    [episodeEntity setValue:episode.title forKey:@"title"];
    [episodeEntity setValue:episode.link forKey:@"link"];
    [episodeEntity setValue:episode.author forKey:@"author"];
    [episodeEntity setValue:episode.date forKey:@"date"];
    [episodeEntity setValue:episode.updated forKey:@"updated"];
    [episodeEntity setValue:episode.summary forKey:@"summary"];
    [episodeEntity setValue:episode.content forKey:@"content"];
    //[episodeEntity setValue:episode.enclosures forKey:@"enclosure"];
    [episodeEntity setValue:episode.identifier forKey:@"identifier"];
    return episodeEntity;
}

@end
