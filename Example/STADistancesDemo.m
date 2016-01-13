//
//  STADistancesDemo.m
//  Example
//
//  Created by StrideAware on 14-4-23.
//  Copyright (c) 2014年 StrideAware. All rights reserved.
//

#import "STADistancesDemo.h"
#import "StrideAwareBeaconSDK.h"

static NSString * const kIdentifier = @"strideaware.Example";

@interface STADistancesDemo ()<STABeaconManagerDelegate>

@property (nonatomic, strong) STABeaconManager  *beaconManager;
@property (nonatomic, strong) STABeaconRegion  *beaconRegion;
@end

@implementation STADistancesDemo

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
    
    _beaconManager = [[STABeaconManager alloc] init];
    _beaconManager.delegate = self;
    
    _beaconRegion = [[STABeaconRegion alloc] initWithProximityUUID:StrideAware_PROXIMITY_UUID identifier:kIdentifier];
    
    [_beaconManager startRangingBeaconsInRegion:_beaconRegion];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - STABeaconManager delegate

- (void)beaconManager:(STABeaconManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(STABeaconRegion *)region
{
    STABeacon *temp = [beacons firstObject];
    self.mProximityUUID.text = [temp.proximityUUID UUIDString];
    self.mMajorValue.text = [NSString stringWithFormat:@"%d", [temp.major intValue]];
    self.mMinorValue.text = [NSString stringWithFormat:@"%d", [temp.major intValue]];
    self.mAccValue.text = [NSString stringWithFormat:@"%.2f", temp.accuracy];
    
}
@end
