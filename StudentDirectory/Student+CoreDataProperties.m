//
//  Student+CoreDataProperties.m
//  StudentDirectory
//
//  Created by nicholaslee on 28/03/2017.
//  Copyright © 2017 nicholaslee. All rights reserved.
//

#import "Student+CoreDataProperties.h"

@implementation Student (CoreDataProperties)

+ (NSFetchRequest<Student *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Student"];
}

@dynamic name;
@dynamic gender;
@dynamic age;

@end
