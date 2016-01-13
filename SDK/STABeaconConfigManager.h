//
//  STABeaconConfigManager.h
//  StrideAwareBeaconSDK
//
//  Created by StrideAware on 14-4-22.
//  Copyright (c) 2014年 StrideAware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STABeaconDevice.h"


@class STABeaconConfigManager;

/**
 
 The STABeaconManagerDelegate protocol defines the delegate methods to respond for related events.
 */

@protocol STABeaconConfigManagerDelegate <NSObject>

@optional

/**
 * Delegate method invoked to handle discovered
 * STABeacon objects using CoreBluetooth framework
 * in particular region.
 *
 * @param manager StrideAware beacon manager
 * @param beacon discovered Beacon
 *
 * @return void
 */

- (void)beaconConfigManager:(STABeaconConfigManager *)manager didDiscoverBeacon:(STABeaconDevice *)beacon RSSI:(NSNumber *)RSSI AdvData:(NSDictionary*)AdvData;

///**
// * Delegate method invoked when CoreBluetooth based
// * discovery process fails.
// *
// * @param manager StrideAware beacon config manager
// *
// * @return void
// */
//
//- (void)beaconConfigManagerDiscoveryDidFail:(STABeaconDevice*)beacon manager:(NSError*)error;

@end


@interface STABeaconConfigManager : NSObject

@property (nonatomic, weak) id <STABeaconConfigManagerDelegate> delegate;


/// @name CoreBluetooth based utility methods


/**
 * Start beacon discovery process based on CoreBluetooth
 * framework. Method is useful for older beacons discovery
 * that are not advertising as iBeacons.
 *
 *
 * @return void
 */
-(void)startStrideAwareBeaconsDiscovery;


/**
 * Stops CoreBluetooth based beacon discovery process.
 *
 * @return void
 */
-(void)stopStrideAwareBeaconDiscovery;


@end
