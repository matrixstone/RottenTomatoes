//
//  MoviesController.m
//  Rotten Tomatoes
//
//  Created by Xu He on 1/22/15.
//  Copyright (c) 2015 Xu He. All rights reserved.
//

#import "MoviesController.h"
#import "MovieCell.h"
#import "UIImageView+AFNetworking.h"
#import "MovieDetailedController.h"
#import "Reachability.h"
//helper method cateogry

@interface MoviesController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *names;
@property (nonatomic, strong) NSArray *movies;
//@property (nonatomic, strong) UIRefreshControl *refreshControl;
@property (nonatomic, strong) Reachability *internetReachableFoo;
@end

@implementation MoviesController

// Checks if we have an internet connection or not
- (Boolean)testInternetConnection
{
    self.internetReachableFoo = [Reachability reachabilityWithHostname:@"www.google.com"];
    
    // Internet is reachable
    self.internetReachableFoo.reachableBlock = ^(Reachability*reach)
    {
        // Update the UI on the main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"Yayyy, we have the interwebs!");
        });
    };

    
    
    // Internet is not reachable
    self.internetReachableFoo.unreachableBlock = ^(Reachability*reach)
    {
        // Update the UI on the main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"Someone broke the internet :(");
            UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"Net working error!"
                                                               message:@"We are experiencing net working error!"
                                                              delegate:self
                                                     cancelButtonTitle:@"OK"
                                                     otherButtonTitles:nil];
            [theAlert show];
            
        });
    };
    
    Boolean result=[self.internetReachableFoo startNotifier];
//    if (self.internetReachableFoo.reachableBlock) {
//        return 1;
//    }else if (self.internetReachableFoo.unreachableBlock){
//        return 0;
//    }else{
//        return -1;
//    }
    return result;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.names = @[@"Jimmy", @"Alice"];
    self.title=@"Movies";
    
    NSURL *url = [NSURL URLWithString:@"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=dagqdghwaq3e3mxyrp7kmmj5&limit=20&country=us"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        self.movies=responseDictionary[@"movies"];
        [self.tableView reloadData];
//        NSLog(@"response: %@", responseDictionary);
    }];
    self.tableView.dataSource = self;
    self.tableView.rowHeight=184;
    self.tableView.delegate = self;
    NSLog(@"Load Data");
    Boolean connectionResult = [self testInternetConnection];
//    NSLog(connectionResult? @"Yes we have the internet" : @"No we dont have the internet");
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MovieCell" bundle:nil] forCellReuseIdentifier:@"MovieCell"] ;
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]
                                        init];
    refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"pull to Refresh"];
    [refreshControl addTarget:self action:@selector(refreshView:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
//    if (self.refreshControl) {
//        [self.refreshControl endRefreshing];
////        [self.refreshControl removeFromSuperview];
//    }
    
}

- (void)refreshView:(UIRefreshControl *)controller
{
    NSLog(@"Test for refreshing");
    [self viewDidLoad];
//    [self performSelector:@selector(endRefreshing:) withObject:nil afterDelay:1];
    sleep(2);
    [controller endRefreshing];
//    NSLog(@"end refreshing");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    NSLog(@"movie count : %d", self.movies.count);
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *cell = [[UITableViewCell alloc]init];
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell"];
//    cell.textLabel.text=self.names[indexPath.row];
//    cell.textLabel.text=[NSString stringWithFormat:@"Section %d, Row %d", indexPath.section, indexPath.row];
    NSDictionary *movie=self.movies[indexPath.row];
    cell.titleLabel.text=movie[@"title"];
    cell.synopsisLabel.text=movie[@"synopsis"];
    [cell.posterView setImageWithURL:[NSURL URLWithString:[movie valueForKeyPath:@"posters.thumbnail"]]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MovieDetailedController *vc = [[MovieDetailedController alloc] init];
    vc.movie=self.movies[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
