//
//  STAURIBeacon.h
//  StrideAwareBeaconSDK
//
//  Created by StrideAware on 15/5/19.
//  Copyright (c) 2015年 StrideAware. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, StrideAwareURIBeaconRegion) {
    StrideAwareURIBeaconRegionNear = 0,              /*between 0 and 0.5 meter*/
    StrideAwareURIBeaconRegionMid,                   /*between 0.5 and 2 meters*/
    StrideAwareURIBeaconRegionFar,                   /*larger than 2 meters*/
    StrideAwareURIBeaconRegionUnknown,               /*distance could not be determined*/
};

@interface STAURIBeacon : NSObject

- (id)initWithObject:(id)object;

/** iOS bluetooth device identifier. */
@property(nonatomic, copy) NSUUID* identifier;

@property(nonatomic, assign) NSInteger RSSI;

/** URI of the beacon. */
@property(nonatomic, copy) NSURL* URI;

/** Measured power level. */
@property(nonatomic, assign) int txPowerLevel;

/** Flags. The flags need to be set to 0. */
@property(nonatomic, assign) NSUInteger flags;

/** returns YES if it's going to fit in a bluetooth LE advertisement packet. */
- (BOOL)isValid;

/** returns the region of the beacon */
- (StrideAwareURIBeaconRegion)region;
@end
