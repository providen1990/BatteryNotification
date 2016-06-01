//
//  ViewController.h
//  BatteryNotification
//
//  Created by Ryan Huynh on 5/31/16.
//  Copyright © 2016 Info Way. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *helloText;
- (IBAction)saveConfig:(id)sender;
- (IBAction)clearConfig:(id)sender;


@end

