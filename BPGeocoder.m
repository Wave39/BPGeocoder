//
//  BPGeocoder.m
//
//  Created by Brian Prescott on 5/15/14.
//
//

#import "BPGeocoder.h"

@implementation BPGeocoder

+ (NSCache *)placemarkArrayCache
{
    static NSCache *sharedInstance = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        sharedInstance = [NSCache new];
    });
    
    return sharedInstance;
}

- (void)geocodeAddressString:(NSString *)addressString completionHandler:(CLGeocodeCompletionHandler)completionHandler
{
    NSArray *cachedObject = [[BPGeocoder placemarkArrayCache] objectForKey:addressString];
    if (cachedObject != nil)
    {
        completionHandler(cachedObject, nil);
        return;
    }
    
    [super geocodeAddressString:addressString completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error)
        {
            completionHandler(nil, error);
        }
        else
        {
            [[BPGeocoder placemarkArrayCache] setObject:placemarks forKey:addressString];
            completionHandler(placemarks, nil);
        }
    }];
}

@end
