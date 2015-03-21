//
//  UIViewController+Routing.h
//
//  Created by Egor Tolstoy on 07.02.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YDRouter;

/**
 *  A block, which configurates specific segue's destination  and source view controllers
 *
 *  @param segue Specific segue
 */
typedef void (^YDSeguePreparationBlock)(UIStoryboardSegue *segue);

typedef UIStoryboardSegue* (^YDUnwindSeguePreparationBlock)(UIViewController *toViewController, UIViewController *fromViewController, NSString *identifier);

@interface UIViewController (Routing)

/**
 *  Abstract router for forwarding -prepareForSegue: method
 */
@property (nonatomic, strong) id <YDRouter> router;

/**
 *  This method allows to pass a configuration block, which will be called in -prepareForSegue:
 *
 *  @param identifier Current segue identifier
 *  @param sender     Sender
 *  @param block      Configuration block
 */
- (void)performSegueWithIdentifier:(NSString *)identifier
                            sender:(id)sender
                  preparationBlock:(YDSeguePreparationBlock)block;

/**
 *  This method returns the configuration block for a specific segue
 *
 *  @param segue Current segue
 *
 *  @return Configuration block
 */
- (YDSeguePreparationBlock)preparationBlockForSegue:(UIStoryboardSegue *)segue;

- (YDUnwindSeguePreparationBlock)preparationBlockForSegueIdentifier:(NSString *)segueIdentifier;

@end

/**
 *  Abstract router protocol
 */
@protocol YDRouter <NSObject>

/**
 *  This method is called before current segue execution. It is used instead of ViewController.
 *
 *  @param segue  Current segue
 *  @param sender Sender
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;

- (UIStoryboardSegue *)segueForUnwindingToViewController:(UIViewController *)toViewController fromViewController:(UIViewController *)fromViewController identifier:(NSString *)identifier;

@end
