//
//  RoutesViewController.m
//  HomeWork03
//
//  Created by Admin on 10/31/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import "RoutesViewController.h"

@interface RoutesViewController ()
@property (strong,nonatomic) NSArray* vehicles;
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

-	(void)awakeFromNib{
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://itomy.ch/routes.php"]];
    AFJSONRequestOperation* operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSLog(@"%@",JSON);
        self.vehicles = JSON;
        [self.tableView reloadData];
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"%@",error);
    }];
    [operation start];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    _vehicles = [NSArray array];
//    for (int i=1; i<=20; i++){
//        _vehicles = [_vehicles arrayByAddingObject:[Vehicle getVehicleWithName:[NSString stringWithFormat:@"Маршрут %d",i] price:@(10 + arc4random()%(90))]];
//    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _vehicles.count;
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
    cell.nameLabel.text = [NSString stringWithFormat:@"Маршрут %@", [[_vehicles objectAtIndex:indexPath.row] objectForKey:@"route_title"]];
    cell.priceLabel.text = [NSString stringWithFormat:@"%@ грн.", [[_vehicles objectAtIndex:indexPath.row] objectForKey:@"route_price"]];
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
        