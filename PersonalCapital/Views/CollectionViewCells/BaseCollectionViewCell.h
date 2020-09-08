//
//  BaseCollectionViewCell.h
//  PersonalCapital
//
//  Created by Dinesh Kumar Dhanekula on 9/7/20.
//  Copyright © 2020 Dinesh Kumar Dhanekula. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet NSString *ImageUrl;
@property UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) IBOutlet UIImageView *cellImage;

@end

