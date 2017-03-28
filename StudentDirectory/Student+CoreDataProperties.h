//
//  Student+CoreDataProperties.h
//  StudentDirectory
//
//  Created by nicholaslee on 28/03/2017.
//  Copyright © 2017 nicholaslee. All rights reserved.
//

#import "Student+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Student (CoreDataProperties)

+ (NSFetchRequest<Student *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *gender;
@property (nonatomic) int16_t age;

@end

NS_ASSUME_NONNULL_END
