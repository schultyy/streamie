//
//  STFeedListController.h
//  streamie
//
//  Created by Jan Schulte on 06/07/15.
//  Copyright (c) 2015 schultyy. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "STDataContext.h"

@interface STFeedListController : NSViewController

@property (retain) STDataContext *dataContext;

-(id) initWithDataContext: (STDataContext *) context;

@end
