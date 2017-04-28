//
//  EquasionsTableViewController.m
//  High Voltage
//
//  Created by Shane Nelson on 4/28/17.
//  Copyright © 2017 Shane Nelson. All rights reserved.
//

#import "EquasionsTableViewController.h"
#import "AddCalculationTableViewController.h"
#import "EquasionsCell.h"

@interface EquasionsTableViewController () <UIPopoverPresentationControllerDelegate, ChosenCalculationDelegate>
{
  NSDictionary *allCalculations;
  NSMutableArray *remainingCalculations;
  NSMutableArray *visibleCalculations;
}

@end

@implementation EquasionsTableViewController

//static NSString * const reuseIdentifier @"CalculationCell";

- (void)viewDidLoad
{
    [super viewDidLoad];
  allCalculations = @{@"Watts": @"watts",
                      @"Volts": @"volts",
                      @"Amps": @"amps",
                      @"Ohms": @"ohms"};
  
  remainingCalculations = [[NSMutableArray alloc] init];
  [remainingCalculations addObjectsFromArray:[allCalculations allKeys]];
  
  visibleCalculations = [[NSMutableArray alloc] init];
   
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  if ([segue.identifier isEqualToString:@"AddCalculationPopoverSegue"])
  {
    AddCalculationTableViewController *calculationVC = [segue destinationViewController];
    calculationVC.calculations = remainingCalculations;
    calculationVC.popoverPresentationController.delegate = self;
    calculationVC.delegate =self;
    CGFloat contentHeight = 44.0f * remainingCalculations.count;
    calculationVC.preferredContentSize = CGSizeMake(200.0f, contentHeight);
  }
  else
  {
    printf("Error");
  }
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
  return UIModalPresentationNone;
}

- (void)calculationWasChosen:(NSString *)chosenCalculation
{
  [self.navigationController dismissViewControllerAnimated:YES completion:nil];
  [visibleCalculations addObject: chosenCalculation];
  [remainingCalculations removeObject:chosenCalculation];
  if (remainingCalculations.count == 0)
  {
    self.navigationItem.rightBarButtonItem.enabled = NO;
  }
  [self.tableView reloadData];
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return visibleCalculations.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EquasionsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EquasionCell" forIndexPath:indexPath];
    
  NSString *calculationName = visibleCalculations[indexPath.item];
  cell.imageView.image = [UIImage imageNamed:allCalculations[calculationName]];
  cell.calculationLabel.text = calculationName;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
