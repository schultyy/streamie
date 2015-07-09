//
// Created by Jan Schulte on 09/07/15.
// Copyright (c) 2015 schultyy. All rights reserved.
//

#import "STEpisode.h"


@interface STEpisode()

@property (readwrite, strong) NSString *author;
@property (readwrite, strong) NSString *content;
@property (readwrite, strong) NSDate *date;
@property (readwrite, strong) NSString *identifier;
@property (readwrite, strong) NSString *enclosure;
@property (readwrite, strong) NSString *link;
@property (readwrite, strong) NSString *summary;
@property (readwrite, strong) NSString *title;
@property (readwrite, strong) NSDate *updated;

@end

@implementation STEpisode

-(id) initWithManagedObject: (NSManagedObject *) managedObject {
    self = [super init];
    if(self) {
        [self setAuthor:[managedObject valueForKey:@"author"]];
        [self setContent:[managedObject valueForKey:@"content"]];
        [self setDate:[managedObject valueForKey:@"date"]];
        [self setIdentifier:[managedObject valueForKey:@"identifier"]];
        //[self setEnclosure:[managedObject valueForKey:@"enclosure"]];
        [self setLink:[managedObject valueForKey:@"link"]];
        [self setSummary:[managedObject valueForKey:@"summary"]];
        [self setTitle:[managedObject valueForKey:@"title"]];
        [self setUpdated:[managedObject valueForKey:@"updated"]];
    }
    return self;
}

@end
