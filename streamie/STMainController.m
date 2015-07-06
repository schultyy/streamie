//
//  STMainController.m
//  streamie
//
//  Created by Jan Schulte on 06/07/15.
//  Copyright (c) 2015 schultyy. All rights reserved.
//

#import "STMainController.h"
#import "STFeedSheet.h"
#import "STFeedDownloader.h"
#import "Underscore.h"
#import "STEpisodeListController.h"

@interface STMainController ()
@property (retain) STFeedSheet *feedSheet;
@property (readwrite, strong) STFeedListController *feedListController;
@property (readwrite, strong) STEpisodeListController *episodeListController;
@property (readwrite, strong) STDataContext *dataContext;
@end

@implementation STMainController

-(id) init {
    self = [super initWithWindowNibName:@"STMainWindow"];
    if(self) {
        [self setDataContext: [[STDataContext alloc] init]];
        [self setFeedListController: [[STFeedListController alloc] initWithDataContext:self.dataContext]];
        [[self feedListController] setDelegate:self];
    }
    return self;
}

- (void)windowDidLoad {
    [super windowDidLoad];
    
    [[self masterView] setContentView: self.feedListController.view];
}

-(void)addFeed {
    [self setFeedSheet: [[STFeedSheet alloc] init]];
    [NSApp beginSheet:self.feedSheet.window modalForWindow:self.window modalDelegate:self didEndSelector:@selector(didEnd:returnCode:context:) contextInfo:NULL];
}

-(void)didEnd:(NSWindow *) sheet
   returnCode:(NSInteger) returnCode
      context:(void *) context {
    if(returnCode == 0) {
        NSManagedObject *feed = [[self dataContext] createFeed];
        [feed setValue:self.feedSheet.address forKey:@"address"];
        [[self dataContext] save:nil];
        STFeedDownloader *feedDownloader = [[STFeedDownloader alloc] initWithAddress: self.feedSheet.address];
        if([feedDownloader download]) {
            [self storeEpisodes: feedDownloader.feedItems forFeed: feed];
        }

    }
    [self setFeedSheet:nil];
}

- (void)storeEpisodes:(NSArray *)array forFeed: (NSManagedObject *) feed {
    NSMutableSet *episodes = [feed mutableSetValueForKey:@"episodes"];
    Underscore.arrayEach(array, ^(MWFeedItem *episode) {
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
        [episodes addObject:episodeEntity];
    });

    [[self dataContext] save: nil];
}

#pragma mark - STFeedListProtocol

-(void) controller: (STFeedListController *) controller didSelectFeed: (NSManagedObject *)selectedFeed {
    [[self detailView] setContentView:nil];
    [self setEpisodeListController:nil];
    [self setEpisodeListController:[[STEpisodeListController alloc] initWithFeed:selectedFeed]];
    [[self detailView] setContentView:self.episodeListController.view];
}

@end
