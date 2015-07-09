//
// Created by Jan Schulte on 09/07/15.
// Copyright (c) 2015 schultyy. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface STEpisode : NSObject

@property (readonly, strong) NSString *author;
@property (readonly, strong) NSString *content;
@property (readonly, strong) NSDate *date;
@property (readonly, strong) NSString *identifier;
@property (readonly, strong) NSString *enclosure;
@property (readonly, strong) NSString *link;
@property (readonly, strong) NSString *summary;
@property (readonly, strong) NSString *title;
@property (readonly, strong) NSDate *updated;

-(id) initWithManagedObject: (NSManagedObject *) managedObject;

@end
