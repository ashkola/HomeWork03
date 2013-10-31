//
//  RoutesViewController.m
//  HomeWork03
//
//  Created by Admin on 10/31/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import "RoutesViewController.h"

@interface RoutesViewController ()
@property NSArray* vehicles;
@end

@implementation RoutesViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _vehicles = [NSArray array];
    for (int i=1; i<=20; i++){
        _vehicles = [_vehicles arrayByAddingObject:[Vehicle getVehicleWithName:[NSString stringWithFormat:@"Маршрут %d",i] price:@(10 + arc4random()%(90))]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.section) {
        case 0:
            return [self getTopCell:indexPath forTable:tableView];
            break;
            
        default:
            return [self getBottomCell:indexPath forTable:tableView];
            break;
    }

}

-(TopCell*)getTopCell:(NSIndexPath*)indexPath forTable:(UITableView*)tableView{
    static NSString *CellIdentifier = @"TopCell";
    TopCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.nameLabel.text = [[_vehicles objectAtIndex:indexPath.row] name];
    cell.priceLabel.text = [NSString stringWithFormat:@"%@", [[_vehicles objectAtIndex:indexPath.row] price]];
    cell.image.image = [UIImage imageNamed:@"checked"];
    return cell;
}

-(TopCell*)getBottomCell:(NSIndexPath*)indexPath forTable:(UITableView*)tableView{
    static NSString *CellIdentifier = @"TopCell";
    TopCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.nameLabel.text = [[_vehicles objectAtIndex:indexPath.row+10] name];
    cell.priceLabel.text = [NSString stringWithFormat:@"%@", [[_vehicles objectAtIndex:indexPath.row+10] price]];
    cell.image.image =[UIImage imageNamed:@"unchecked"];
    return cell;
}


@end
        