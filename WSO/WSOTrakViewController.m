//
//  WSOTrakViewController.m
//  WSO
//
//  Created by Aaron Taylor on 5/5/14.
//  Copyright (c) 2014 Williams Students Online. All rights reserved.
//

#import "WSOTrakViewController.h"
#import "WSOAppDelegate.h"

@interface WSOTrakViewController () {
    NSString *type;
}

@property (weak, nonatomic) IBOutlet UISegmentedControl *selectionHeader;

-(IBAction)typeChanged:(id)sender;

@end

@implementation WSOTrakViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    type = @"default";
    
    [self.selectionHeader setTintColor:WSO_PURPLE];
    [self.selectionHeader setTitle:@"Factrak" forSegmentAtIndex:0];
    [self.selectionHeader setTitle:@"DormTrak" forSegmentAtIndex:1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)typeChanged:(id)sender {
    NSInteger selection = ((UISegmentedControl*)sender).selectedSegmentIndex;
    if (selection == 0) {
        type = @"Factrak";
    } else {
        type = @"Dormtrak";
    }
    [self.tableView reloadData];
}

# pragma mark - UITableViewDataSource methods

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@ item number %ld%ld",type,indexPath.section,indexPath.row];
    return cell;
}

# pragma mark - UITableViewDelegate methods

-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"Section: %ld",section];
}

@end
