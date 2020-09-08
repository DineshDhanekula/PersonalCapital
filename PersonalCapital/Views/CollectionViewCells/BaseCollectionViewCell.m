//
//  BaseCollectionViewCell.m
//  PersonalCapital
//
//  Created by Dinesh Kumar Dhanekula on 9/7/20.
//  Copyright © 2020 Dinesh Kumar Dhanekula. All rights reserved.
//

#import "BaseCollectionViewCell.h"
#import "PersonalCapitalServices.h"

@implementation BaseCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
                [self createActivityIndicator];
    }
    return self;
}

- (void) createActivityIndicator {
    self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    self.activityIndicator.backgroundColor = UIColor.whiteColor;
    [self addSubview:self.activityIndicator];
    self.activityIndicator.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
}

- (void)setImageUrl:(NSString *)ImageUrl {
    [self.activityIndicator startAnimating];
    self.cellImage.hidden = true;
    [PersonalCapitalServices getDataFromUrl:ImageUrl completionHandler:^(NSData * _Nonnull data, NSURLResponse * _Nonnull response, NSError * _Nonnull error) {
                NSError *err;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.activityIndicator stopAnimating];
            self.cellImage.hidden = false;
            self.cellImage.image = [UIImage imageWithData:data];
        });
        if (err) {
            NSLog(@"Failed to get data");
            return;
        }
    }];
}

@end
