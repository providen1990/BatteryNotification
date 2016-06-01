//
//  ViewController.m
//  BatteryNotification
//
//  Created by Ryan Huynh on 5/31/16.
//  Copyright © 2016 Info Way. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    UITextView *textViewStatus;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // nsuserdefaul saving default data.
    NSString *configData = [[NSUserDefaults standardUserDefaults] objectForKey:@"user"];
    if (configData == NULL) {
        [_helloText setText:@"Hello User"];
        [_helloText setFont:[_helloText.font fontWithSize: 60]];
        
    }
    else{
        [_helloText setText:[[NSString alloc] initWithFormat:@"Hello %@", [[NSUserDefaults standardUserDefaults] objectForKey:@"user"]]];
        [_helloText setFont:[_helloText.font fontWithSize: 60]];
        
    }
    
    
    UIDevice *device = [UIDevice currentDevice];
    device.batteryMonitoringEnabled = YES;
    //add observer to viewcontroller listen to a change in batterylevel
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(batteryChanged:) name:@"UIDeviceBatteryLevelDidChangeNotification" object:device];
    
    [self batteryChanged:[device batteryLevel]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveConfig:(id)sender {
    [[NSUserDefaults standardUserDefaults] setObject:@"Ryan" forKey:@"user"];
    
}

- (IBAction)clearConfig:(id)sender {
    [[NSUserDefaults standardUserDefaults] setObject:NULL forKey:@"user"];
    
}

-(void)batteryChanged :(float)batteryLvl{
    
    
    if (batteryLvl == -1) {
        NSDate *alarmTime= [[NSDate date] dateByAddingTimeInterval:1000];
        UILocalNotification *batteryNotification = [[UILocalNotification alloc] init];
        batteryNotification.fireDate = alarmTime;
        batteryNotification.timeZone = [NSTimeZone defaultTimeZone];
        batteryNotification.soundName= UILocalNotificationDefaultSoundName;
        [[UIApplication sharedApplication] scheduleLocalNotification:batteryNotification];
    }
  
    
}
@end
