//
//  AddCalculationTableViewController.h
//  High Voltage
//
//  Created by Shane Nelson on 4/28/17.
//  Copyright © 2017 Shane Nelson. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ChosenCalculationDelegate
- (void)calculationWasChosen:(NSString *)chosenCalculation;

@end


@interface AddCalculationTableViewController : UITableViewController
@property (nonatomic) NSArray *calculations;
@property (nonatomic) id<ChosenCalculationDelegate> delegate;


@end
