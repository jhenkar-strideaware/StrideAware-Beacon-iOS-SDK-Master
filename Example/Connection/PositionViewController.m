//
//  PositionViewController.m
//  Example
//
//  Created by StrideAware on 15/5/22.
//  Copyright (c) 2015年 StrideAware. All rights reserved.
//

#import "PositionViewController.h"

@interface PositionViewController ()<STABeaconDeviceDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *mPositionImage;

@end

@implementation PositionViewController

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
    if (self.mSelectBeaconDevice && ![self.mSelectBeaconDevice isPositionDetecting]) {
        [self.mSelectBeaconDevice startDetectPosition];
    }
}

-(void) viewDidDisappear:(BOOL)animated
{
    if (self.mSelectBeaconDevice && [self.mSelectBeaconDevice isMotionDetecting]) {
        [self.mSelectBeaconDevice stopDetectPosition];
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

- (void)beaconDidPositionChanged:(STABeaconDevice *)beacon position:(StrideAware_POSITION_DEFINE)position
{
    switch (position) {
        case StrideAware_POSITION_DEFINE_A:
            [self.mPositionImage setImage:[UIImage imageNamed:@"position_a"]];
            break;
        case StrideAware_POSITION_DEFINE_B:
            [self.mPositionImage setImage:[UIImage imageNamed:@"position_b"]];
            break;
        case StrideAware_POSITION_DEFINE_C:
            [self.mPositionImage setImage:[UIImage imageNamed:@"position_c"]];
            break;
        case StrideAware_POSITION_DEFINE_D:
            [self.mPositionImage setImage:[UIImage imageNamed:@"position_d"]];
            break;
        case StrideAware_POSITION_DEFINE_E:
            [self.mPositionImage setImage:[UIImage imageNamed:@"position_e"]];
            break;
        case StrideAware_POSITION_DEFINE_F:
            [self.mPositionImage setImage:[UIImage imageNamed:@"position_f"]];
            break;
        default:
            break;
    }
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
