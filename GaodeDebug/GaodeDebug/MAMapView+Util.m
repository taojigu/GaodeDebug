//
//  MAMapView+Util.m
//  NeighbourFriends
//
//  Created by GuJitao on 15/12/6.
//  Copyright © 2015年 gujitao. All rights reserved.
//

#import "MAMapView+Util.h"

@implementation MAMapView(Util)


-(void)clearMapView
{
    for (id<MAAnnotation> annotation in self.annotations)
    {
        if ([annotation class] == [MAUserLocation class])
        {
            continue;
        }
        
        MAAnnotationView* antView = [self viewForAnnotation:annotation];
        [antView removeFromSuperview];
    }
    
    [self removeAnnotations:self.annotations];
}


-(void)moveToSpot:(double)latitude longtitude:(double)longtitude
{
    CLLocationCoordinate2D noLocation = CLLocationCoordinate2DMake(latitude, longtitude);
    
    MACoordinateRegion viewRegion = MACoordinateRegionMakeWithDistance(noLocation, 1000, 1000);
    MACoordinateRegion adjustedRegion = [self regionThatFits:viewRegion];
    dispatch_time_t when = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC));
    dispatch_after(when, dispatch_get_main_queue(), ^{
        [self setRegion:adjustedRegion animated:NO];
    });
    return;
}

-(void)moveToSpot2:(double)latitude longtitude:(double)longtitude {
    MACoordinateSpan span = MACoordinateSpanMake(8,8);
    MACoordinateRegion region;
    region.center = CLLocationCoordinate2DMake(latitude,longtitude);
    region.span = span;
    //解决地图越拉近，指定的坐标越偏右的问题。
    MAMapRect rect = MAMapRectForCoordinateRegion(region);
    [self setVisibleMapRect:rect animated:YES];
    
    [self setRegion:region  animated:YES];
    
}

/*
-(void)moveToSpot:(double)latitude longtitude:(double)longtitude
{
    CLLocationCoordinate2D noLocation = CLLocationCoordinate2DMake(latitude, longtitude);

    MACoordinateRegion viewRegion = MACoordinateRegionMakeWithDistance(noLocation, 2000, 2000);
    MACoordinateRegion adjustedRegion = [self regionThatFits:viewRegion];
    [self setRegion:adjustedRegion animated:NO];
    return;
    

}*/

@end
