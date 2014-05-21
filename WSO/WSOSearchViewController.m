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
#import "AFHTMLResponseSerializer.h"
#import "GDataXMLNode.h"

#define imageTag 0
#define nameTag 1
#define unixTag 2
#define roomTag 3


@interface WSOSearchViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, atomic) NSArray *results;

@end

@implementation WSOSearchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
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
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTMLResponseSerializer serializer];
    NSLog(@"Acceptable Content Types:\n%@", manager.responseSerializer.acceptableContentTypes);
    
    [manager POST:[NSString stringWithFormat:@"http://wso.williams.edu/search?class=home-search&method=get"]
       parameters:@{@"commit": @"Search Facebook",
                    @"search": name}
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              NSLog(@"\n\n\nPOST:\n %@", operation.responseObject);
              [self parseSearchResults:operation.responseObject];
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              NSLog(@"Error: %@\n\nResponseObject:%@", error,operation.responseObject);
          }];
}

-(void)parseSearchResults:(NSString*)results {
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithHTMLString:results encoding:NSASCIIStringEncoding error:nil];
    NSArray *names = [doc nodesForXPath:@"//html/body/article/section/div/aside[3]/div[2]" error:nil];
    NSLog(@"\n\nnames for XPath: %@",names);
}

#pragma mark UISearchBar delegate

-(void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
}

-(void) searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self downloadTest:searchBar.text];
    [searchBar resignFirstResponder];
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
    NSString *CellIdentifier = @"PersonCell";
    WSOFacebookTableViewCell *cell = (WSOFacebookTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[WSOFacebookTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
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

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65.0;
}

# pragma mark UIScrollView Delegate

-(void) scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.searchBar resignFirstResponder];
}

@end
