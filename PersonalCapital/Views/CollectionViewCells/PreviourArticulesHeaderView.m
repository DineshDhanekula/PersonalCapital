//
//  PreviourArticulesHeaderView.m
//  PersonalCapital
//
//  Created by Dinesh Kumar Dhanekula on 9/7/20.
//  Copyright © 2020 Dinesh Kumar Dhanekula. All rights reserved.
//

#import "PreviourArticulesHeaderView.h"

@implementation PreviourArticulesHeaderView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configureHeader];
    }
    return self;
}

- (void)configureHeader {
    self.header = [[UILabel alloc]initWithFrame:CGRectMake(10, 0 ,self.bounds.size.width, 30)];
    self.header.numberOfLines = 1;
    self.header.font = [UIFont systemFontOfSize:28];
    [self.header setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:_header];
}

@end
