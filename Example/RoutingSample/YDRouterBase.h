//
//  YDRouterBase.h
//  RoutingSample
//
//  Created by Egor Tolstoy on 3/21/15.
//  Copyright (c) 2015 etolstoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIViewController+Routing/UIViewController+Routing.h>

@interface YDRouterBase : NSObject <YDRouter>

- (void)showDetailViewControllerFromSourceViewController:(UIViewController *)sourceViewController
                                          withDictionary:(NSDictionary *)detailDictionary;
- (void)unwindToListViewControllerFromSourceViewController:(UIViewController *)sourceViewController;

@end
