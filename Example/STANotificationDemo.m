//
//  STANotificationDemo.m
//  Example
//
//  Created by StrideAware on 14-4-23.
//  Copyright (c) 2014年 StrideAware. All rights reserved.
//

#import "STANotificationDemo.h"
#import "StrideAwareBeaconSDK.h"

static NSString * const kIdentifier = @"StrideAware.Example";

@interface STANotificationDemo ()<STABeaconManagerDelegate>

@property (nonatomic, strong) STABeaconManager  *beaconManager;
@property (nonatomic, strong) STABeaconRegion  *beaconRegion;

@end

@implementation STANotificationDemo

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.beaconManager = [[STABeaconManager alloc] init];
    self.beaconManager.delegate = self;
    
    _beaconRegion = [[STABeaconRegion alloc] initWithProximityUUID:StrideAware_PROXIMITY_UUID identifier:kIdentifier];
    
    self.beaconRegion.notifyOnEntry = self.mEnterSwitch.isOn;
    self.beaconRegion.notifyOnExit = self.mExitSwitch.isOn;
    
    [self.beaconManager startMonitoringForRegion:self.beaconRegion];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)OnSwitchValueChanged:(id)sender {
    
    [self.beaconManager stopMonitoringForRegion:self.beaconRegion];
    
    self.beaconRegion.notifyOnEntry = self.mEnterSwitch.isOn;
    self.beaconRegion.notifyOnExit = self.mExitSwitch.isOn;
    
    [self.beaconManager startMonitoringForRegion:self.beaconRegion];
    
}


#pragma mark - STABeaconManager delegate

- (void)beaconManager:(STABeaconManager *)manager didEnterRegion:(STABeaconRegion *)region
{
    UILocalNotification *notification = [UILocalNotification new];
    notification.alertBody = @"Enter region notification";
    
    [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
}

- (void)beaconManager:(STABeaconManager *)manager didExitRegion:(STABeaconRegion *)region
{
    UILocalNotification *notification = [UILocalNotification new];
    notification.alertBody = @"Exit region notification";
    
    [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
}

@end
