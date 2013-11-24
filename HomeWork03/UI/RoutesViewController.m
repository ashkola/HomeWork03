//
//  RoutesViewController.m
//  HomeWork03
//
//  Created by Admin on 10/31/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import "RoutesViewController.h"
#import "AppDelegate.h"

@interface RoutesViewController ()
@property (strong,nonatomic) NSArray* vehicles;
@property (strong,nonatomic) NSMutableArray* modelRoutes;

@end

@implementation RoutesViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

-	(void)awakeFromNib{
//    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://itomy.ch/routes.php"]];
//    AFJSONRequestOperation* operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
//        NSLog(@"%@",JSON);
//        self.vehicles = JSON;
//        [self.tableView reloadData];
//    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
//        NSLog(@"%@",error);
//    }];
//    [operation start];


}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.modelRoutes = [[NSMutableArray alloc]init];
    APIRouteClient *client = [APIRouteClient getClient];
    [client updateRouteList:^(NSArray *routes) {
        NSManagedObjectContext* context = ((AppDelegate*)[UIApplication sharedApplication]).objectContext;
        for (NSDictionary *routeDictionary in routes) {
//            Route* singleRoute =[[Route alloc] initWithDictionary:routeDictionary];
            Route* singleRoute = [NSEntityDescription insertNewObjectForEntityForName:@"Route" inManagedObjectContext:context];
            [self.modelRoutes addObject:singleRoute];
        }
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];

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
    return self.modelRoutes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    switch (indexPath.section) {
//        case 0:
//            return [self getTopCell:indexPath forTable:tableView];
//            break;
//            
//        default:
//            return [self getBottomCell:indexPath forTable:tableView];
//            break;
//    }
    return [self getTopCell:indexPath forTable:tableView];

}

-(TopCell*)getTopCell:(NSIndexPath*)indexPath forTable:(UITableView*)tableView{
    static NSString *CellIdentifier = @"TopCell";
    TopCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    Route *currentRow = [self.modelRoutes objectAtIndex:indexPath.row];
    
    cell.nameLabel.text = [NSString stringWithFormat:@"%@", currentRow.route_title];
    cell.priceLabel.text = [NSString stringWithFormat:@"%@ грн.", currentRow.route_price];
    switch (currentRow.isFavorite) {
        case YES:
            cell.image.image = [UIImage imageNamed:@"checked"];
            break;
        default:
            cell.image.image = [UIImage imageNamed:@"unchecked"];
            break;
    }

    return cell;
}

//-(TopCell*)getBottomCell:(NSIndexPath*)indexPath forTable:(UITableView*)tableView{
//    static NSString *CellIdentifier = @"TopCell";
//    TopCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    cell.nameLabel.text = [[_vehicles objectAtIndex:indexPath.row+10] name];
//    cell.priceLabel.text = [NSString stringWithFormat:@"%@", [[_vehicles objectAtIndex:indexPath.row+10] price]];
//    cell.image.image =[UIImage imageNamed:@"unchecked"];
//    return cell;
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TopCell *cell = (TopCell *)[tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"%@", indexPath);
}


@end
        