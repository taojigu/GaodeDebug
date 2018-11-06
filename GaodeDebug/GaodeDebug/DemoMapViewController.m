//
//  DemoMapViewController.m
//  GaodeDebug
//
//  Created by 顾吉涛Air on 2018/11/6.
//  Copyright © 2018年 顾吉涛. All rights reserved.
//

#import "DemoMapViewController.h"
#import <MAMapKit/MAMapView.h>
#import "MAMapView+Util.h"

@interface DemoMapViewController ()

@property (nonatomic, strong)MAMapView *mapView;

@end

@implementation DemoMapViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    [self initMapView];
    [self loadMapView];
    
    [self move2CurrentLocation];
}

- (void)initMapView {
    _mapView = [[MAMapView alloc] initWithFrame:CGRectZero];
    //如果用下面这行来初始化mapView,就可以正常显示
    //_mapView = [[MAMapView alloc] initWithFrame:CGRectMake(30, 80, 300, 200)];
    _mapView.showsUserLocation = YES;
}

- (void)loadMapView {
    self.mapView.frame = CGRectMake(30, 80, 300, 200);
    [self.view addSubview:self.mapView];
}

- (void)move2CurrentLocation {
    MAUserLocation *userLoc = self.mapView.userLocation;
    CGFloat latitude = userLoc.location.coordinate.latitude;
    if (latitude == 0) {
        latitude = 110;
    }
    CGFloat longitude = userLoc.location.coordinate.longitude;
    if (longitude == 0) {
        longitude = 38;
    }
    [self moveToSpot:latitude longtitude:longitude];
}

-(void)moveToSpot:(double)latitude longtitude:(double)longtitude
{
    CLLocationCoordinate2D noLocation = CLLocationCoordinate2DMake(latitude, longtitude);
    
    MACoordinateRegion viewRegion = MACoordinateRegionMakeWithDistance(noLocation, 1000, 1000);
    MACoordinateRegion adjustedRegion = [self.mapView regionThatFits:viewRegion];
    [self.mapView setRegion:adjustedRegion animated:NO];
    return;
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
