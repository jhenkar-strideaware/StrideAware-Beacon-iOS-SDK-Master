//
//  ReadBeaconParameters.h
//  Example
//
//  Created by StrideAware on 14-4-23.
//  Copyright (c) 2014年 StrideAware. All rights reserved.
//

#import "ViewController.h"
#import "StrideAwareBeaconSDK.h"

@interface STAReadBeaconParameters : ViewController
@property (weak, nonatomic) IBOutlet UILabel *mUUID;
@property (weak, nonatomic) IBOutlet UILabel *mMajorValue;
@property (weak, nonatomic) IBOutlet UILabel *mMinorValue;
@property (weak, nonatomic) IBOutlet UILabel *mBroadcastRete;
@property (weak, nonatomic) IBOutlet UILabel *mBattLevel;
@property (weak, nonatomic) IBOutlet UILabel *mDeviceName;
@property (weak, nonatomic) IBOutlet UILabel *mMeasuredPowerValue;
@property (weak, nonatomic) IBOutlet UILabel *TxPowerLevel;
@property (nonatomic, strong) STABeaconDevice          *mSelectBeaconDevice;
@end
