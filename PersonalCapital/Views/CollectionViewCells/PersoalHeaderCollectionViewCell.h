//
//  PersoalHeaderCollectionViewCell.h
//  PersonalCapital
//
//  Created by Dinesh Kumar Dhanekula on 9/6/20.
//  Copyright © 2020 Dinesh Kumar Dhanekula. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCollectionViewCell.h"
@interface PersoalHeaderCollectionViewCell : BaseCollectionViewCell

@property (strong, nonatomic) IBOutlet UILabel *cellInfo;
@property (strong, nonatomic) IBOutlet UILabel *subInfo;
@property (strong, nonatomic) IBOutlet UIView *border;

@end

