//
//  STFeedListController.m
//  streamie
//
//  Created by Jan Schulte on 06/07/15.
//  Copyright (c) 2015 schultyy. All rights reserved.
//

#import "STFeedListController.h"

@interface STFeedListController ()

@end

@implementation STFeedListController

-(id) initWithDataContext: (STDataContext *) context {
    self = [super initWithNibName:@"STFeedListView" bundle:nil];
    if(self) {
        [self setDataContext:context];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

@end
