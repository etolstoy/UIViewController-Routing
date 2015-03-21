//
//  ViewController.m
//  RoutingSample
//
//  Created by Egor Tolstoy on 3/21/15.
//  Copyright (c) 2015 etolstoy. All rights reserved.
//

#import "YDListTableViewController.h"
#import "YDRouterBase.h"

#import <UIViewController+Routing/UIViewController+Routing.h>

static NSString *YDItemCellIdentifier = @"ItemCell";

@interface YDListTableViewController ()

@property (strong, nonatomic) NSArray *dataArray;

@property (strong, nonatomic) YDRouterBase *router;

@end

@implementation YDListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.router = [[YDRouterBase alloc] init];
    
    self.dataArray = @[
                       @{
                           @"short" : @"First Item",
                           @"long" : @"The description of first item"
                           },
                       @{
                           @"short" : @"Second Item",
                           @"long" : @"The description of second item"
                           },
                       @{
                           @"short" : @"Third Item",
                           @"long" : @"The description of third item"
                           },
                       @{
                           @"short" : @"Fourth Item",
                           @"long" : @"The description of forth item"
                           },
                       @{
                           @"short" : @"Fifth Item",
                           @"long" : @"The description of fifth item"
                           },
                       ];
    [self.tableView reloadData];
}

-(IBAction)prepareForUnwind:(UIStoryboardSegue *)segue {
}

#pragma mark - UITableViewDataSource & UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YDItemCellIdentifier forIndexPath:indexPath];
    
    NSDictionary *detailDictionary = self.dataArray[indexPath.row];
    cell.textLabel.text = detailDictionary[@"short"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *detailDictionary = self.dataArray[indexPath.row];
    [self.router showDetailViewControllerFromSourceViewController:self withDictionary:detailDictionary];
}

@end
