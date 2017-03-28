//
//  Teacher+CoreDataProperties.m
//  StudentDirectory
//
//  Created by nicholaslee on 28/03/2017.
//  Copyright © 2017 nicholaslee. All rights reserved.
//

#import "Teacher+CoreDataProperties.h"

@implementation Teacher (CoreDataProperties)

+ (NSFetchRequest<Teacher *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Teacher"];
}

@dynamic name;
@dynamic subject;

@end
