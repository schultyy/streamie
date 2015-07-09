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
#import "STEpisodeListController.h"
#import "STFeedRepository.h"

@interface STMainController ()
@property (retain) STFeedSheet *feedSheet;
@property (readwrite, strong) STFeedListController *feedListController;
@property (readwrite, strong) STEpisodeListController *episodeListController;
@end

@implementation STMainController

-(id) init {
    self = [super initWithWindowNibName:@"STMainWindow"];
    if(self) {
        [self setFeedListController:[[STFeedListController alloc] initWithRepository:[[STFeedRepository alloc] init]]];
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
        NSString *feedAddress = [[self feedSheet] address];
        STFeedDownloader *feedDownloader = [[STFeedDownloader alloc] initWithAddress: feedAddress];
        if([feedDownloader download]) {
            STFeedRepository *repository = [[STFeedRepository alloc] init];
            [repository createNewFeedFromInfo:feedDownloader.feedInfo andFeedItems:feedDownloader.feedItems];
        }
    }
    [self setFeedSheet:nil];
}

#pragma mark - STFeedListProtocol

-(void) controller: (STFeedListController *) controller didSelectFeed: (NSManagedObject *)selectedFeed {
    [[self detailView] setContentView:nil];
    [self setEpisodeListController:nil];
    [self setEpisodeListController:[[STEpisodeListController alloc] initWithFeed:selectedFeed]];
    [[self detailView] setContentView:self.episodeListController.view];
}

@end
