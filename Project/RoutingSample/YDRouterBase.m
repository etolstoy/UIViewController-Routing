//
//  YDRouterBase.m
//  RoutingSample
//
//  Created by Egor Tolstoy on 3/21/15.
//  Copyright (c) 2015 etolstoy. All rights reserved.
//

#import "YDRouterBase.h"
#import "YDDetailViewController.h"

static NSString *const YDDetailSegueIdentifier = @"detailViewControllerSegue";

@implementation YDRouterBase

#pragma mark - YDRouter Methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *sourceViewController = segue.sourceViewController;
    YDPreparationBlock block = [sourceViewController preparationBlockForSegue:segue];
    
    if (block) {
        block(segue);
    }
}

#pragma mark - Public Methods

- (void)showDetailViewControllerFromSourceViewController:(UIViewController *)sourceViewController
                                          withDictionary:(NSDictionary *)detailDictionary {
    YDPreparationBlock preparationBlock =  ^void(UIStoryboardSegue *segue) {
        YDDetailViewController *destinationViewController = segue.destinationViewController;
        destinationViewController.detailDictionary = detailDictionary;
    };
    
    [sourceViewController performSegueWithIdentifier:YDDetailSegueIdentifier
                                              sender:self
                                    preparationBlock:preparationBlock];
}

@end
