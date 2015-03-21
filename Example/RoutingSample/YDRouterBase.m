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
static NSString *const YDUnwindToListSegueIdentifier = @"listTableViewControllerUnwindSegue";

@implementation YDRouterBase

#pragma mark - YDRouter Methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *sourceViewController = segue.sourceViewController;
    YDSeguePreparationBlock block = [sourceViewController preparationBlockForSegue:segue];
    
    if (block) {
        block(segue);
    }
}

- (UIStoryboardSegue *)segueForUnwindingToViewController:(UIViewController *)toViewController fromViewController:(UIViewController *)fromViewController identifier:(NSString *)identifier {
    YDUnwindSeguePreparationBlock block = [fromViewController preparationBlockForSegueIdentifier:identifier];
    if (block) {
        return block(toViewController, fromViewController, identifier);
    }
    return nil;
}

#pragma mark - Public Methods

- (void)showDetailViewControllerFromSourceViewController:(UIViewController *)sourceViewController
                                          withDictionary:(NSDictionary *)detailDictionary {
    YDSeguePreparationBlock preparationBlock =  ^void(UIStoryboardSegue *segue) {
        YDDetailViewController *destinationViewController = segue.destinationViewController;
        destinationViewController.detailDictionary = detailDictionary;
    };
    
    [sourceViewController performSegueWithIdentifier:YDDetailSegueIdentifier
                                              sender:self
                                    preparationBlock:preparationBlock];
}

- (void)unwindToListViewControllerFromSourceViewController:(UIViewController *)sourceViewController {
    YDUnwindSeguePreparationBlock preparationBlock = ^UIStoryboardSegue* (UIViewController *toViewController, UIViewController *fromViewController, NSString *identifier) {
        return [UIStoryboardSegue segueWithIdentifier:YDUnwindToListSegueIdentifier source:fromViewController destination:toViewController performHandler:^{
            NSLog(@"123");
        }];
    };
    
    [sourceViewController performSegueWithIdentifier:YDUnwindToListSegueIdentifier sender:self preparationBlock:preparationBlock];
}

@end
