//
//  BaseViewController.h
//  Example
//
//  Created by StrideAware on 15/5/22.
//  Copyright (c) 2015年 StrideAware. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StrideAwareBeaconSDK.h"
#import "WaitProgressShow.h"

@interface BaseViewController : UIViewController
@property (nonatomic, strong) STABeaconDevice          *mSelectBeaconDevice;
@end
