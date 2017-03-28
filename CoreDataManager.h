//
//  CoreDataManager.h
//  StudentDirectory
//
//  Created by nicholaslee on 28/03/2017.
//  Copyright © 2017 nicholaslee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataManager : NSObject
+(instancetype)shared;
- (NSManagedObjectContext *) managedObjectContext;

@end
