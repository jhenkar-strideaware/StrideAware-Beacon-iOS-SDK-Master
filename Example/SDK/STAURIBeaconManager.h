//
//  STAURIBeaconManager.h
//  StrideAwareBeaconSDK
//
//  Created by StrideAware on 15/5/19.
//  Copyright (c) 2015年 StrideAware. All rights reserved.
//

#import <Foundation/Foundation.h>


@class STAURIBeaconManager;



@protocol STAURIBeaconManagerDelegate <NSObject>

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
- (void)URIBeaconManager:(STAURIBeaconManager *)manager didFoundURIBeacons:(NSArray *)beacons;

//- (void)URIBeaconManager:(STAURIBeaconManager *)manager didStopSncan:(NSArray *)beacons;

@end

@interface STAURIBeaconManager : NSObject

@property (nonatomic, weak) id <STAURIBeaconManagerDelegate> delegate;

-(void)startScanURIBeaconAround;
-(BOOL)stopScanURIBeacon;
@end
