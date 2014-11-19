//
//  ViewController.m
//  BPGeocoderDemo
//
//  Created by Brian Prescott on 11/19/14.
//  Copyright (c) 2014 Brian Prescott. All rights reserved.
//

#import "ViewController.h"

#import "GeocodeOperation.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *addressArray;
@property (nonatomic, strong) NSOperationQueue *geocodeOperationQueue;

@end

@implementation ViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_addressArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0;
}

- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ViewControllerCell";
    
    UITableViewCell *cell = [_theTable dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.font = [UIFont systemFontOfSize:14.0];
        cell.textLabel.numberOfLines = 0;
    }
    
    NSString *addressString = _addressArray[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", addressString];
    
    GeocodeOperation *op = [[GeocodeOperation alloc] initWithParentCell:cell andLocation:addressString];
    [op start];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _addressArray = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"AddressList" ofType:@"plist"]];
    _geocodeOperationQueue = [[NSOperationQueue alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
