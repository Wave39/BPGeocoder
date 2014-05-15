//
//  BPGeocoder.h
//
//  Created by Brian Prescott on 5/15/14.
//
//

#import <CoreLocation/CoreLocation.h>

@interface BPGeocoder : CLGeocoder
{
}

- (void)geocodeAddressString:(NSString *)addressString completionHandler:(CLGeocodeCompletionHandler)completionHandler;

@end
