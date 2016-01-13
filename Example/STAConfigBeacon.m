//
//  STAConfigBeacon.m
//  Example
//
//  Created by StrideAware on 14-4-23.
//  Copyright (c) 2014年 StrideAware. All rights reserved.
//

#import "STAConfigBeacon.h"
#import "STAReadBeaconParameters.h"
#import "WaitProgressShow.h"
#import "StrideAwareBeaconSDK.h"

@interface STAConfigBeacon ()

@property (nonatomic)        NSMutableArray *mBeaconDeviceList;
@property (nonatomic)        STABeaconConfigManager *mBeaconConfigManager;
@property (nonatomic)        STABeaconDevice *mBeaconDevice;

@end

@implementation STAConfigBeacon

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _mBeaconDeviceList = [[NSMutableArray alloc] init];
    _mBeaconConfigManager = [[STABeaconConfigManager alloc] init];
    _mBeaconConfigManager.delegate = self;
}


-(void)viewDidAppear:(BOOL)animated
{
    [_mBeaconDeviceList removeAllObjects];
    [self.mTableView reloadData];
    [_mBeaconConfigManager startStrideAwareBeaconsDiscovery];
    
    
    if (_mBeaconDevice) {
        [_mBeaconDevice disconnectBeacon];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - STABeaconConfigManager delegate

-(void)beaconConfigManager:(STABeaconConfigManager *)manager didDiscoverBeacon:(STABeaconDevice *)beacon RSSI:(NSNumber *)RSSI AdvData:(NSDictionary *)AdvData
{
    if ([RSSI intValue] > 0 || [RSSI intValue] < -40) {
        return;
    }
    
    if ([_mBeaconDeviceList containsObject:beacon]) {
        [_mBeaconDeviceList removeObject:beacon];
    }
    [_mBeaconDeviceList addObject:beacon];
    [self.mTableView reloadData];
}



#pragma mark - Table view data source

-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
	return _mBeaconDeviceList.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
	return 1;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Scanning...";
}


- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    cell = [tv dequeueReusableCellWithIdentifier:@"BeaconDeviceCell"];

    UILabel *name = (UILabel*)[cell viewWithTag:1];
    UILabel *BeaconID = (UILabel*)[cell viewWithTag:2];
    UILabel *rssi = (UILabel*)[cell viewWithTag:3];
    
    STABeaconDevice *temp = [_mBeaconDeviceList objectAtIndex:indexPath.row];
    
    name.text = temp.name;
    BeaconID.text = [temp.peripheral.identifier UUIDString];
    rssi.text = [NSString stringWithFormat:@"%ld", (long)temp.rssi];
    
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView  deselectRowAtIndexPath:indexPath animated:YES];
    _mBeaconDevice = [_mBeaconDeviceList objectAtIndex:indexPath.row];
    if ([_mBeaconDevice isConnectable]) {
        [self performSegueWithIdentifier:@"BeaconMain" sender:nil];
    }
    else
    {
        [WaitProgressShow showErrorWithStatus:@"Current device is in Non-Connectable mode"];
    }

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString: @"BeaconMain"])
    {
       STAReadBeaconParameters *ReadParaController = (STAReadBeaconParameters*) segue.destinationViewController;
        ReadParaController.mSelectBeaconDevice = _mBeaconDevice;
    }
}



@end
