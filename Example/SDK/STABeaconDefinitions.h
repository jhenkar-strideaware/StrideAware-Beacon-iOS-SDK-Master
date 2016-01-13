//
//  STABeaconDefinitions.h
//  StrideAwareBeaconSDK
//
//  Created by StrideAware on 14-4-22.
//  Copyright (c) 2014年 StrideAware. All rights reserved.
//

#import <Foundation/Foundation.h>

//BOOL misStrideAwareBeacon;
//StrideAware_Beacon_State mBeaconState;
//NSNumber *mBatteryLevel;
//NSString *mFirmwareVersion;
//
//
//NSString *mMacAdress;
//NSString* mProximityUUID;
//NSNumber* mMajor;
//
//NSNumber* mMinor;
//NSNumber* mMeasuredPower;
//STABeaconPower mTxPower;
//NSNumber* mAdvInterval;



typedef enum : char
{
    STABeaconPowerLevel1 = 4,
    STABeaconPowerLevel2 = 0,
    STABeaconPowerLevel3 = -4,
    STABeaconPowerLevel4 = -6,
    STABeaconPowerLevel5 = -8,
    STABeaconPowerLevel6 = -12,
    STABeaconPowerLevel7 = -16,
    STABeaconPowerLevel8 = -20,
    STABeaconPowerLevel9 = -23,
    STABeaconPowerLevel10 = -30,
    STABeaconPowerLevel11 = -40
} STABeaconPower;

#define     BEACON_STATE_DISABLE                0x01
#define     BEACON_STATE_IBEACON_NORMAL         0x02
#define     BEACON_STATE_IBEACON_TRIGGER        0x04
#define     BEACON_STATE_URIBEACON_NORMAL       0x08
#define     BEACON_STATE_URIBEACON_TRIGGER      0x10
#define     BEACON_STATE_ACCBEACON_NORMAL       0x20
#define     BEACON_STATE_ACCBEACON_TRIGGER      0x40
#define     BEACON_STATE_UNKNOWN                0

typedef NS_ENUM(uint8_t, StrideAware_Beacon_Acc_Data_Combination) {
    BEACON_ACC_DATA_ADD_MAC_ADRESS = 0x80,
    BEACON_ACC_DATA_ADD_ACC_DATA = 0x40,
    BEACON_ACC_DATA_ADD_TEMP_DATA = 0x20,
    BEACON_ACC_DATA_ADD_BATTERY_DATA = 0x10,
    BEACON_ACC_DATA_ADD_POSITION_DATA = 0x08,
};

typedef NS_ENUM(NSInteger, StrideAware_Beacon_Acc_Data_Broadcast_Type) {
    BEACON_ACC_DATA_BROADCASE_TYPE_AS_MANUFACTURER_DATA = 0,
    BEACON_ACC_DATA_BROADCASE_TYPE_AS_SERVICE_DATA,
};

typedef NS_ENUM(NSInteger, StrideAware_Audio_State) {
    BEACON_AUDIO_STATE_ENABLE = 0,
    BEACON_AUDIO_STATE_ENABLE_WHEN_START,
    BEACON_AUDIO_STATE_ENABLE_WHEN_TAP,
    BEACON_AUDIO_STATE_DISABLE,
    BEACON_AUDIO_STATE_UNKNOWN
};

typedef NS_ENUM(NSInteger, StrideAware_POSITION_DEFINE) {
    StrideAware_POSITION_DEFINE_A = 0,
    StrideAware_POSITION_DEFINE_B,
    StrideAware_POSITION_DEFINE_C,
    StrideAware_POSITION_DEFINE_D,
    StrideAware_POSITION_DEFINE_E,
    StrideAware_POSITION_DEFINE_F,
};


typedef void(^STACompletionBlock) (NSError* error);
typedef void(^STAUnsignedShortCompletionBlock) (unsigned short value, NSError* error);
typedef void(^STAPowerCompletionBlock) (STABeaconPower value, NSError* error);
typedef void(^STABoolCompletionBlock) (BOOL value, NSError* error);
typedef void(^STAStringCompletionBlock) (NSString* value, NSError* error);
typedef void(^STABeaconStateCompletionBlock) (uint8_t value, NSError* error);
typedef void(^STAAudioStateCompletionBlock) (StrideAware_Audio_State value, NSError* error);
typedef void(^STAReadBatteryWithTemperatureBlock) (uint8_t battery, float temperature, NSError* error);


////////////////////////////////////////////////////////////////////
// Interface definition

@interface STABeaconDefinitions : NSObject

@end
