//
//  MovieCell.h
//  Rotten Tomatoes
//
//  Created by Xu He on 1/22/15.
//  Copyright (c) 2015 Xu He. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@end
