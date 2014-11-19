//
//  GeocodeOperation.h
//  BPGeocoderDemo
//
//  Created by Brian Prescott on 11/19/14.
//  Copyright (c) 2014 Brian Prescott. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GeocodeOperation : NSOperation

@property (nonatomic, weak) UITableViewCell *theCell;
@property (nonatomic, copy) NSString *locationString;

- (id)initWithParentCell:(UITableViewCell *)cell andLocation:(NSString *)locationString;

@end
