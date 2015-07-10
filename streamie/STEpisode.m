//
// Created by Jan Schulte on 09/07/15.
// Copyright (c) 2015 schultyy. All rights reserved.
//

#import "STEpisode.h"
#import "Underscore.h"
#import "STEnclosure.h"


@interface STEpisode()

@property (readwrite, strong) NSString *author;
@property (readwrite, strong) NSString *content;
@property (readwrite, strong) NSDate *date;
@property (readwrite, strong) NSString *identifier;
@property (readwrite, strong) NSArray *enclosures;
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
        [self setLink:[managedObject valueForKey:@"link"]];
        [self setSummary:[managedObject valueForKey:@"summary"]];
        [self setTitle:[managedObject valueForKey:@"title"]];
        [self setUpdated:[managedObject valueForKey:@"updated"]];
        self.enclosures = Underscore.arrayMap([managedObject valueForKey:@"enclosures"], ^(NSManagedObject *enclosureEntity) {
           return [[STEnclosure alloc] initWithManagedObject:enclosureEntity];
        });
    }
    return self;
}

@end
