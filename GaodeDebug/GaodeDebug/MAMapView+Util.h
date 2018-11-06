//
//  MAMapView+Util.h
//  NeighbourFriends
//
//  Created by GuJitao on 15/12/6.
//  Copyright © 2015年 gujitao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MAMapKit/MAMapKit.h>

@interface MAMapView(Util)

-(void)clearMapView;
-(void)moveToSpot:(double)latitude longtitude:(double)longtitude;
-(void)moveToSpot2:(double)latitude longtitude:(double)longtitude;

@end
