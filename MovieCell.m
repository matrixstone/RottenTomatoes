//
//  MovieCell.m
//  Rotten Tomatoes
//
//  Created by Xu He on 1/22/15.
//  Copyright (c) 2015 Xu He. All rights reserved.
//

#import "MovieCell.h"


@implementation MovieCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
