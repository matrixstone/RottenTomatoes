//
//  MovieDetailedController.m
//  Rotten Tomatoes
//
//  Created by Xu He on 1/23/15.
//  Copyright (c) 2015 Xu He. All rights reserved.
//

#import "MovieDetailedController.h"

@interface MovieDetailedController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;

@end

@implementation MovieDetailedController

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
    self.title=@"Introduction";
    self.titleLabel.text=self.movie[@"title"];
    self.synopsisLabel.text=self.movie[@"synopsis"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
