//
// Created by Jan Schulte on 06/07/15.
// Copyright (c) 2015 schultyy. All rights reserved.
//

#import "STFeedDownloader.h"
#import "MWFeedParser.h"

@interface STFeedDownloader()
@property (strong) MWFeedParser *feedParser;
@property (readwrite, retain) NSMutableArray *feedItems;
@end

@implementation STFeedDownloader

-(id) initWithAddress: (NSString *) address {
    self = [super init];
    if(self) {
        [self setFeedParser:[[MWFeedParser alloc] initWithFeedURL:[[NSURL alloc] initWithString:address]]];
        [[self feedParser] setDelegate:self];
    }
    return self;
}

-(BOOL) download {
    return [[self feedParser] parse];
}

- (void)feedParserDidStart:(MWFeedParser *)parser {
    [self setFeedItems:[[NSMutableArray alloc] init]];
}

- (void)feedParser:(MWFeedParser *)parser didParseFeedInfo:(MWFeedInfo *)info {

}

- (void)feedParser:(MWFeedParser *)parser didParseFeedItem:(MWFeedItem *)item {
    self.feedItems = [[self feedItems] arrayByAddingObject:item];
}

- (void)feedParserDidFinish:(MWFeedParser *)parser {

}

- (void)feedParser:(MWFeedParser *)parser didFailWithError:(NSError *)error{
}

@end
