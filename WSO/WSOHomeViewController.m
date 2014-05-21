//
//  WSOHomeViewController.m
//  WSO
//
//  Created by Aaron Taylor on 5/4/14.
//  Copyright (c) 2014 Williams Students Online. All rights reserved.
//

#import "WSOHomeViewController.h"
#import "WSOInfoViewController.h"
#import "WSOAppDelegate.h"

@interface WSOHomeViewController () {
    NSIndexPath *selectedPath;
}

@property NSDictionary *sampleData;
@property NSString * CellIdentifier;

-(NSString*) infoForIndexPath:(NSIndexPath*) indexPath;

@end

@implementation WSOHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// creates a small selection of sample data for app demo
    // TODO: replace this with actual data from the WSO server
    self.sampleData = @{@"Announcements":@[@"School ends soon!",@"new WSO app in the works",@"get hyped for summer"],
                        @"Exchange":@[@"selling chairs",@"want fridge"],
                        @"Lost and Found":@[@"found an ID card",@"lost my jacket",@"lost my dignity"],
                        @"Jobs":@[@"hiring summer developers",@"in need of lowly cable boys"],
                        @"Rides":@[@"heading to albany",@"roadtrip to mexico!"]};
    
    self.CellIdentifier = @"Cell";
    
    [self.tabBarController.tabBar setTintColor:WSO_PURPLE];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString*) infoForIndexPath:(NSIndexPath *)indexPath {
    NSString *key = self.sampleData.allKeys[indexPath.section];
    return [[self.sampleData objectForKey:key] objectAtIndex:indexPath.row];
}

# pragma mark - UITableViewDataSource methods

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sampleData.allKeys.count;
}

-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.sampleData.allKeys[section];
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.CellIdentifier];
    }
    cell.textLabel.text = [self infoForIndexPath:indexPath];
    return cell;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.sampleData objectForKey:self.sampleData.allKeys[section]] count];
}

# pragma mark - UITableViewDelegate methods

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    selectedPath = indexPath;
    // manual segue is triggered in this way to ensure that the selected row is stored before the perpareForSegue method is called
    // this ensures that the proper info is passed along
    [self performSegueWithIdentifier:@"ShowInfo" sender:self];
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    view.tintColor = WSO_PURPLE;
    
    // if you have index/header text in your tableview change your index text color
    UITableViewHeaderFooterView *headerIndexText = (UITableViewHeaderFooterView *)view;
    [headerIndexText.textLabel setTextColor:[UIColor whiteColor]];
    
}

# pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    [(WSOInfoViewController*)[segue destinationViewController] setInfo:[self infoForIndexPath:selectedPath]];
}

@end
