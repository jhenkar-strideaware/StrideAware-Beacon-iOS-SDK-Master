//
//  URIViewController.m
//  Example
//
//  Created by StrideAware on 15/5/22.
//  Copyright (c) 2015年 StrideAware. All rights reserved.
//

#import "URIViewController.h"

@interface URIViewController ()<STABeaconDeviceDelegate>
@property (weak, nonatomic) IBOutlet UITextField *BeaconURL;

@end

@implementation URIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    self.mSelectBeaconDevice.delegate = self;
    if (self.mSelectBeaconDevice && [self.mSelectBeaconDevice isSupportURIBeacon]) {
        [_BeaconURL setText:self.mSelectBeaconDevice.URIBeacon_URLString.absoluteString];
    }
}

#pragma mark - STABeaconDeviceDelegate delegate

- (void)beaconConnectionDidFail:(STABeaconDevice *)beacon withError:(NSError *)error
{
    [WaitProgressShow showErrorWithStatus:@"Connect the beacon Failed"];
    [self.navigationController popToRootViewControllerAnimated:true];
}

- (void)beaconDidDisconnect:(STABeaconDevice *)beacon withError:(NSError *)error
{
    [WaitProgressShow showErrorWithStatus:@"Disconnect from the Beacon"];
    [self.navigationController popToRootViewControllerAnimated:true];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (self.mSelectBeaconDevice && [self.mSelectBeaconDevice isSupportURIBeacon]) {
        [WaitProgressShow showWithStatus:@"Trying to configure..."];
        [self.mSelectBeaconDevice writeURIBeaconURL:textField.text txPower:35 WithCompletion:^(BOOL value, NSError *error){
            if (value) {
                [WaitProgressShow showSuccessWithStatus:@"Success"];
            }
            else
            {
                [WaitProgressShow showSuccessWithStatus:@"Failed"];
            }
            
        }];
    }
    
    return true;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
