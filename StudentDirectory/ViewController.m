//
//  ViewController.m
//  StudentDirectory
//
//  Created by nicholaslee on 28/03/2017.
//  Copyright © 2017 nicholaslee. All rights reserved.
//

#import "ViewController.h"
#import "Student+CoreDataClass.h"
#import "CoreDataManager.h"


@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *textField2;
@property (weak, nonatomic) IBOutlet UITextField *textField3;
@property (strong, nonatomic) NSMutableArray*students;
@property (nonatomic,assign) NSInteger selectIndex;


//@property (strong,nonatomic) NSManagedObjectContext *context;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self fetchData];
    [self setupData];
   
}


#pragma mark - setup

-(void)setupUI {

    [self.addButton addTarget:self action:@selector(addButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    self.tableView.dataSource = self;

}

-(void)setupData{

    self.students = [NSMutableArray array];

}


#pragma mark Actions

-(void)addButtonTap:(UIButton*)sender {

    
    //update tableView
    
    
    
    //1st method to access data
//    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];     //not good practice
    
    
    //3.singleton
      NSManagedObjectContext *context = [[CoreDataManager shared] managedObjectContext];
    
    //create an object
    Student *aStudent = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:context];
    
    aStudent.name = self.textField.text;
    aStudent.gender= self.textField2.text;
    aStudent.age = [self.textField3.text integerValue];
    
    
    
    //save it to coredata
    NSError *saveError = NULL;
    [context save:&saveError];
    
    if(saveError){
    
        
        return;
    
    }
    
    [self fetchData];
    
    

}

-(void)fetchData {

    NSFetchRequest *fetchRequest = [Student fetchRequest];
    NSManagedObjectContext *context = [[CoreDataManager shared]managedObjectContext];
    
    
    NSError *fetchError = NULL;
   self.students = [[context executeFetchRequest:fetchRequest error:&fetchError] mutableCopy];
    
    if(fetchError) {
    
    
        return ;
    }
    [self.tableView reloadData];
    
//    [self.tableView reloadData];
    
}

-(void)removeStudent:(Student*)student{
    NSManagedObjectContext *context = [[CoreDataManager shared]managedObjectContext];
    [context deleteObject:student];
    
    NSError *saveError = NULL;
    if(saveError) {
        return;
    }
    
    [self fetchData];

}

#pragma mark - uiTableView Datasource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.students.count;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [ tableView dequeueReusableCellWithIdentifier:@"studentCell" forIndexPath:indexPath];
    
    Student *student = self.students[indexPath.row];
    cell.textLabel.text = student.name;
    cell.detailTextLabel.text =[NSString stringWithFormat:@"Gender: %@" " " @"Age: %hd" , student.gender, student.age];
    
    return cell;


}

#pragma mark - tableView Delegate


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.selectIndex = indexPath.row;

}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
    Student *currentStudent = self.students[indexPath.row];
    [self removeStudent:currentStudent];
    }
    
    
    
}
@end
