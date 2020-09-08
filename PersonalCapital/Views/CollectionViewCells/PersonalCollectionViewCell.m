//
//  PersonalCollectionViewCell.m
//  PersonalCapital
//
//  Created by Dinesh Kumar Dhanekula on 9/6/20.
//  Copyright © 2020 Dinesh Kumar Dhanekula. All rights reserved.
//

#import "PersonalCollectionViewCell.h"

@implementation PersonalCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configureImage];
        [self configureCellInfo];
        self.contentView.layer.cornerRadius = 10.0f;
        self.contentView.layer.borderWidth  = 1.0f;
        self.contentView.layer.masksToBounds = YES;
        self.contentView.layer.borderColor  = [UIColor grayColor].CGColor;
    }
    return self;
}

- (void)configureImage {
    self.cellImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height-60)];
    [self.cellImage setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.contentView addSubview:self.cellImage];
}


- (void)configureCellInfo {
    self.cellInfo = [[UILabel alloc]initWithFrame:CGRectMake(5, self.cellImage.frame.size.height + 10 ,self.bounds.size.width, 50)];
    self.cellInfo.numberOfLines = 2;
    self.cellInfo.font = [UIFont systemFontOfSize:20];
    [self.cellInfo setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.contentView addSubview:self.cellInfo];
}

@end
