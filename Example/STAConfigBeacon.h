//
//  STAConfigBeacon.h
//  Example
//
//  Created by StrideAware on 14-4-23.
//  Copyright (c) 2014年 StrideAware. All rights reserved.
//

#import "ViewController.h"

#import "StrideAwareBeaconSDK.h"

@interface STAConfigBeacon : ViewController<UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate, STABeaconConfigManagerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *mTableView;
@end
