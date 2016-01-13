//
//  STANotificationDemo.h
//  Example
//
//  Created by StrideAware on 14-4-23.
//  Copyright (c) 2014年 StrideAware. All rights reserved.
//

#import "ViewController.h"

@interface STANotificationDemo : ViewController

- (IBAction)OnSwitchValueChanged:(id)sender;
@property (weak, nonatomic) IBOutlet UISwitch *mEnterSwitch;

@property (weak, nonatomic) IBOutlet UISwitch *mExitSwitch;
@end
