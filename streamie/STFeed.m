//
// Created by Jan Schulte on 09/07/15.
// Copyright (c) 2015 schultyy. All rights reserved.
//

#import "STFeed.h"
#import "Underscore.h"
#import "STEpisode.h"

@interface STFeed()
@property (readwrite, strong) NSString *address;
@property (readwrite, strong) NSArray *episodes;
@end

@implementation STFeed

-(id) initWithManagedObject: (NSManagedObject *) managedObject {
    self = [super init];
    if(self) {
        [self setAddress:[managedObject valueForKey:@"address"]];
        NSSet *episodeEntities = [managedObject valueForKey:@"episodes"];
        self.episodes = Underscore.arrayMap(episodeEntities.allObjects, ^(NSManagedObject *episodeEntity){
           return [[STEpisode alloc] initWithManagedObject:episodeEntity];
        });
    }
    return self;
}

@end
