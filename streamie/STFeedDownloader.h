//
// Created by Jan Schulte on 06/07/15.
// Copyright (c) 2015 schultyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MWFeedParser/MWFeedParser.h>


@interface STFeedDownloader : NSObject <MWFeedParserDelegate>

@property (readonly, retain) NSArray *feedItems;

-(id) initWithAddress: (NSString *) address;

-(BOOL) download;

@end
