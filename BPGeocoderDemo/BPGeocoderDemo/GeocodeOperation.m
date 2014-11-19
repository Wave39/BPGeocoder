//
//  GeocodeOperation.m
//  BPGeocoderDemo
//
//  Created by Brian Prescott on 11/19/14.
//  Copyright (c) 2014 Brian Prescott. All rights reserved.
//

#import "GeocodeOperation.h"

#import <MapKit/MapKit.h>
#import "BPGeocoder.h"

@implementation GeocodeOperation

- (id)initWithParentCell:(UITableViewCell *)cell andLocation:(NSString *)locationString
{
    self = [super init];
    if (self)
    {
        _theCell = cell;
        _locationString = locationString;
    }
    
    return self;
}

- (void)cancel
{
}

- (void)main
{
    BPGeocoder *geocoder = [[BPGeocoder alloc] init];
    [geocoder geocodeAddressString:_locationString
                 completionHandler:^(NSArray* placemarks, NSError* error) {
                     
                     dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,
                                                              (unsigned long)NULL), ^(void) {
                         
                         if (error)
                         {
                             NSLog(@"Error attempting to geocode address: %@", _locationString);
                             NSLog(@"The error was: %@", [error localizedDescription]);
                         }
                         else if (placemarks.count == 0)
                         {
                         }
                         else if (placemarks.count > 0)
                         {
                             CLPlacemark *topResult = [placemarks objectAtIndex:0];
                             MKPlacemark *placemark = [[MKPlacemark alloc] initWithPlacemark:topResult];
                             CLLocationCoordinate2D latLon = [(CLCircularRegion *)placemark.region center];
                             NSLog(@"%@\n(%f, %f) %@", _locationString, latLon.latitude, latLon.longitude,
                                   (geocoder.retrievedFromCache ? @"(cached)" : @""));
                             dispatch_async(dispatch_get_main_queue(), ^{
                                 _theCell.textLabel.text = [NSString stringWithFormat:@"%@\n(%f, %f) %@",
                                                            _locationString, latLon.latitude, latLon.longitude,
                                                            (geocoder.retrievedFromCache ? @"(cached)" : @"")];
                             });
                         }
                     });
                 }
     ];
}

@end
