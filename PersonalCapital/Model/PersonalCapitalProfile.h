//
//  PersonalCapitalProfile.h
//  PersonalCapital
//
//  Created by Dinesh Kumar Dhanekula on 9/4/20.
//  Copyright © 2020 Dinesh Kumar Dhanekula. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersonalCapitalItem.h"

@interface PersonalCapitalProfile : NSObject
@property (strong,nonatomic) NSString *version;
@property (strong,nonatomic) NSString *user_comment;
@property (strong,nonatomic) NSString *home_page_url;
@property (strong,nonatomic) NSString *feed_url;
@property (strong,nonatomic) NSString *title;
@property (strong,nonatomic) NSString *pagedescription;
@property (strong,nonatomic) NSMutableArray<PersonalCapitalItem*> *personalCapitalitems;
@end
