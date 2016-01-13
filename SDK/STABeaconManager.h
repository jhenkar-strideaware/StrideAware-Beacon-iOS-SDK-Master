//
//  STABeaconManager.h
//  StrideAwareBeaconSDK
//
//  Created by StrideAware on 14-4-22.
//  Copyright (c) 2014年 StrideAware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "STABeaconRegion.h"
#import "STABeacon.h"

#define StrideAware_PROXIMITY_UUID   [[NSUUID alloc] initWithUUIDString:@"EBEFD083-70A2-47C8-9837-E7B5634DF524"]

@class STABeaconManager;

/**
 
 The STABeaconManagerDelegate protocol defines the delegate methods to respond for related events.
 */

@protocol STABeaconManagerDelegate <NSObject>

@optional

/**
 * Delegate method invoked during ranging.
 * Allows to retrieve NSArray of all discoverd beacons
 * represented with STABeacon objects.
 *
 * @param manager StrideAware beacon manager
 * @param beacons all beacons as STABeacon objects
 * @param region StrideAware beacon region
 *
 * @return void
 */
- (void)beaconManager:(STABeaconManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(STABeaconRegion *)region;

/**
 * Delegate method invoked wehen ranging fails
 * for particular region. Related NSError object passed.
 *
 * @param manager StrideAware beacon manager
 * @param region StrideAware beacon region
 * @param error object containing error info
 *
 * @return void
 */
-(void)beaconManager:(STABeaconManager *)manager rangingBeaconsDidFailForRegion:(STABeaconRegion *)region
           withError:(NSError *)error;


/**
 * Delegate method invoked wehen monitoring fails
 * for particular region. Related NSError object passed.
 *
 * @param manager StrideAware beacon manager
 * @param region StrideAware beacon region
 * @param error object containing error info
 *
 * @return void
 */
-(void)beaconManager:(STABeaconManager *)manager monitoringDidFailForRegion:(STABeaconRegion *)region
           withError:(NSError *)error;
/**
 * Method triggered when iOS device enters StrideAware
 * beacon region during monitoring.
 *
 * @param manager StrideAware beacon manager
 * @param region StrideAware beacon region
 *
 * @return void
 */
-(void)beaconManager:(STABeaconManager *)manager didEnterRegion:(STABeaconRegion *)region;


/**
 * Method triggered when iOS device leaves StrideAware
 * beacon region during monitoring.
 *
 * @param manager StrideAware beacon manager
 * @param region StrideAware beacon region
 *
 * @return void
 */
-(void)beaconManager:(STABeaconManager *)manager didExitRegion:(STABeaconRegion *)region;

/**
 * Method triggered when StrideAware beacon region state
 * was determined using requestStateForRegion:
 *
 * @param manager StrideAware beacon manager
 * @param state StrideAware beacon region state
 * @param region StrideAware beacon region
 *
 * @return void
 */
-(void)beaconManager:(STABeaconManager *)manager didDetermineState:(CLRegionState)state
           forRegion:(STABeaconRegion *)region;
@end



/**
 
 The STABeaconManager class defines the interface for handling and configuring the StrideAware beacons and get related events to your application. You use an instance of this class to establish the parameters that describes each beacon behavior. You can also use a beacon manager object to retrieve all beacons in range.
 
 A beacon manager object provides support for the following location-related activities:
 
 * Monitoring distinct regions of interest and generating location events when the user enters or leaves those regions (works in background mode).
 * Reporting the range to nearby beacons and ther distance for the device.
 
 */

@interface STABeaconManager : NSObject <CLLocationManagerDelegate>

@property (nonatomic, weak) id <STABeaconManagerDelegate> delegate;

/**
 Allows to avoid beacons with unknown state (proximity == 0), when ranging. Default value is NO.
 */
@property (nonatomic) BOOL avoidUnknownStateBeacons;

@property (nonatomic, strong) STABeaconRegion*         virtualBeaconRegion;


/// @name CoreLocation based iBeacon monitoring and ranging methods

/**
 * Range all StrideAware beacons that are visible in range.
 * Delegate method beaconManager:didRangeBeacons:inRegion:
 * is used to retrieve found beacons. Returned NSArray contains
 * STABeacon objects.
 *
 * @param region StrideAware beacon region
 *
 * @return void
 */
-(void)startRangingBeaconsInRegion:(STABeaconRegion*)region;

/**
 * Start monitoring for particular region.
 * Functionality works in the background mode as well.
 * Every time you enter or leave region appropriet
 * delegate method inovked: beaconManager:didEnterRegtion:
 * and beaconManager:didExitRegion:
 *
 * @param region StrideAware beacon region
 *
 * @return void
 */
-(void)startMonitoringForRegion:(STABeaconRegion*)region;

/**
 * Stops ranging StrideAware beacons.
 *
 * @param region StrideAware beacon region
 *
 * @return void
 */
-(void)stopRangingBeaconsInRegion:(STABeaconRegion*)region;

/**
 * Unsubscribe application from iOS monitoring of
 * StrideAware beacon region.
 *
 * @param region StrideAware beacon region
 *
 * @return void
 */
-(void)stopMonitoringForRegion:(STABeaconRegion *)region;

/**
 * Allows to validate current state for particular region
 *
 * @param region StrideAware beacon region
 *
 * @return void
 */
-(void)requestStateForRegion:(STABeaconRegion *)region;




@end

