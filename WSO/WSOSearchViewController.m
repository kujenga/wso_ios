//
//  WSOSecondViewController.m
//  WSO
//
//  Created by Aaron Taylor on 5/4/14.
//  Copyright (c) 2014 Williams Students Online. All rights reserved.
//

#import "WSOSearchViewController.h"
#import "WSOFacebookTableViewCell.h"

#import <Foundation/NSXMLParser.h>
#import "AFNetworking.h"

#define imageTag 0
#define nameTag 1
#define unixTag 2
#define roomTag 3


@interface WSOSearchViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *resultsTableView;

@end

@implementation WSOSearchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.resultsTableView.dataSource = self;
    self.resultsTableView.delegate = self;
    
    self.searchBar.delegate = self;
    
    [self downloadTest:@"Aaron"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - Web access methods

- (void) downloadTest:(NSString*) name {
    
    //NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://wso.williams.edu/facebook?search=Aaron"]];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSLog(@"Acceptable Content Types:\n%@", manager.responseSerializer.acceptableContentTypes);
    
    /*
    AFHTTPRequestOperation * op = [manager HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", operation.responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@\n\nResponseObject:%@", error,operation.responseData);
    }];
    */
    
    
    
    [manager GET:[NSString stringWithFormat:@"http://wso.williams.edu/facebook?Aaron"] parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", operation.responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@\n\nResponseObject:%@", error,operation.responseObject);
    }];
    
    
}

# pragma mark - UITableView
# pragma mark Data Source methods

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WSOFacebookTableViewCell *cell = (WSOFacebookTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"PersonCell"];
    
    //UIImageView *imageView = (UIImageView*)[cell.contentView viewWithTag:imageTag];
    //UIImage * faceImage = [UIImage imageNamed:@"07-map-marker@2x"];
    //imageView.image = faceImage;
    UILabel * name = (UILabel*)[cell.contentView viewWithTag:nameTag];
    name.text = @"Williams Student";
    UILabel * unix = (UILabel*)[cell.contentView viewWithTag:unixTag];
    unix.text = @"eph1";
    UILabel * room = (UILabel*)[cell.contentView viewWithTag:roomTag];
    room.text = @"Hopkins Hall";
    return cell;
}

# pragma mark Delegate methods

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
