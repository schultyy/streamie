//
//  STMainController.h
//  streamie
//
//  Created by Jan Schulte on 06/07/15.
//  Copyright (c) 2015 schultyy. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "STDataContext.h"

@interface STMainController : NSWindowController

@property (readonly, strong) STDataContext *dataContext;

-(void)addFeed;

@end
