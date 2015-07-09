//
//  STFeedListController.m
//  streamie
//
//  Created by Jan Schulte on 06/07/15.
//  Copyright (c) 2015 schultyy. All rights reserved.
//

#import "STFeedListController.h"
#import "STFeedListProtocol.h"
#import "STFeedRepository.h"

@interface STFeedListController ()
@property (readwrite, assign) STFeedRepository *repository;
@property (readwrite, strong) NSArray *feeds;
@end

@implementation STFeedListController

-(id)initWithRepository:(STFeedRepository *)repository {
    self = [super initWithNibName:@"STFeedListView" bundle:nil];
    if(self) {
        [self setRepository:repository];
        id feeds = [[self repository] loadFeeds];
        [self setFeeds:feeds];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [[self tableView] setTarget:self];
    [[self tableView] setDoubleAction:@selector(feedDoubleClick:)];
}


-(void) feedDoubleClick: (id) sender {
    NSInteger selectedRow = [[self tableView] selectedRow];

    NSManagedObject *selectedFeed = [[self arrayController] selectedObjects][0];

    if(selectedFeed) {
        [[self delegate] controller:self didSelectFeed:selectedFeed];
    }
}

@end
