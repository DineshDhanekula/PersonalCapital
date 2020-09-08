//
//  PersoalHeaderCollectionViewCell.m
//  PersonalCapital
//
//  Created by Dinesh Kumar Dhanekula on 9/6/20.
//  Copyright © 2020 Dinesh Kumar Dhanekula. All rights reserved.
//

#import "PersoalHeaderCollectionViewCell.h"
@implementation PersoalHeaderCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configureImage];
        [self configureCellInfo];
        [self configureSubInfo];
        [self configureBorder];
    }
    return self;
}

- (void)configureImage {
    self.cellImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height-110)];
    [self.cellImage setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.contentView addSubview:self.cellImage];
}


- (void)configureCellInfo {
    self.cellInfo = [[UILabel alloc]initWithFrame:CGRectMake(5, self.cellImage.frame.size.height + 10 ,self.bounds.size.width, 30)];
    self.cellInfo.numberOfLines = 1;
    self.cellInfo.font = [UIFont systemFontOfSize:22];
    [self.cellInfo setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.contentView addSubview:self.cellInfo];
}

- (void)configureSubInfo {
    self.subInfo = [[UILabel alloc]initWithFrame:CGRectMake(5,self.cellImage.frame.size.height  + 40, self.bounds.size.width - 10, 55)];
    self.subInfo.numberOfLines = 2;
    self.subInfo.textAlignment = NSTextAlignmentJustified;
    [self.subInfo setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.contentView addSubview:self.subInfo];
}

- (void) configureBorder {
    self.border = [[UILabel alloc]initWithFrame:CGRectMake(0, self.cellImage.frame.size.height  + 95, self.bounds.size.width, 1)];
    self.border.backgroundColor = UIColor.lightGrayColor;
    [self.border setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.contentView addSubview:self.border];
}
@end
