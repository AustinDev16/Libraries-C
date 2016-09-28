//
//  APBMainViewController.m
//  Libraries-C
//
//  Created by Austin Blaser on 9/28/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

#import "APBMainViewController.h"
#import "APBSearchController.h"
#import "APBLibrary.h"

@interface APBMainViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation APBMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Search Libraries.io";
    self.searchBar.delegate = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(searchResultsUpdated) name:@"searchResultsUpdated" object:nil];
    
}

-(void)searchResultsUpdated
{
    [[self tableView] reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[APBSearchController sharedController] searchResults] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"resultCell"];
    APBLibrary *library = [[APBSearchController sharedController] searchResults][indexPath.row];
    
    cell.textLabel.text = library.name;
    
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
