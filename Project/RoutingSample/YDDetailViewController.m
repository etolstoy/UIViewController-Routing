//
//  YDDetailViewController.m
//  RoutingSample
//
//  Created by Egor Tolstoy on 3/21/15.
//  Copyright (c) 2015 etolstoy. All rights reserved.
//

#import "YDDetailViewController.h"

@interface YDDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *detailTextLabel;

@end

@implementation YDDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = self.detailDictionary[@"short"];
    self.detailTextLabel.text = self.detailDictionary[@"long"];
}

@end
