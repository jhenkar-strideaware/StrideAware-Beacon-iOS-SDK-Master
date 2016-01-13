//
//  STAProximityDemo.m
//  Example
//
//  Created by StrideAware on 14-4-23.
//  Copyright (c) 2014年 StrideAware. All rights reserved.
//

#import "STAProximityDemo.h"
#import "StrideAwareBeaconSDK.h"

static NSString * const kIdentifier = @"StrideAware.Example";

@interface STAProximityDemo ()<STABeaconManagerDelegate>

@property (nonatomic, strong) STABeaconManager  *beaconManager;
@property (nonatomic, strong) STABeaconRegion  *beaconRegion;

@end

@implementation STAProximityDemo

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
    NSLog(@"Lenth:%lu", (unsigned long)beacons.count);
    if (beacons.count > 0)
    {
        STABeacon *temp = [beacons firstObject];
        
        self.mStateShow.text     = [self textForProximity:temp.proximity];
        self.mImageView.image    = [self imageForProximity:temp.proximity];
    }
}

#pragma mark -

- (NSString *)textForProximity:(CLProximity)proximity
{
    switch (proximity) {
        case CLProximityFar:
            return @"Far";
            break;
        case CLProximityNear:
            return @"Near";
            break;
        case CLProximityImmediate:
            return @"Immediate";
            break;
        default:
            return @"Unknown";
            break;
    }
}

- (UIImage *)imageForProximity:(CLProximity)proximity
{
    switch (proximity) {
        case CLProximityFar:
            return [UIImage imageNamed:@"far_image"];
            break;
        case CLProximityNear:
            return [UIImage imageNamed:@"near_image"];
            break;
        case CLProximityImmediate:
            return [UIImage imageNamed:@"immediate_image"];
            break;
        default:
            return [UIImage imageNamed:@"unknown_image"];
            break;
    }
}

@end
