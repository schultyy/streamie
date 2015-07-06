//
//  STDataContext.h
//  streamie
//
//  Created by Jan Schulte on 06/07/15.
//  Copyright (c) 2015 schultyy. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface STDataContext : NSObject
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@end
