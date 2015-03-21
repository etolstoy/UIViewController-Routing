//
//  YDDetailViewController.m
//  RoutingSample
//
//  Created by Egor Tolstoy on 3/21/15.
//  Copyright (c) 2015 etolstoy. All rights reserved.
//

#import "YDDetailViewController.h"
#import "YDRouterBase.h"

#import <UIViewController+Routing/UIViewController+Routing.h>

@interface YDDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *detailTextLabel;
@property (strong, nonatomic) YDRouterBase *router;

@end

@implementation YDDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = self.detailDictionary[@"short"];
    self.detailTextLabel.text = self.detailDictionary[@"long"];
}

- (IBAction)unwindButtonTapped:(id)sender {
    [self.router unwindToListViewControllerFromSourceViewController:self];
}

@end
