//
//  PersonalCapitalItems.h
//  PersonalCapital
//
//  Created by Dinesh Kumar Dhanekula on 9/4/20.
//  Copyright © 2020 Dinesh Kumar Dhanekula. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersonalCapitalItemAuthor.h"

//@class PersonalCapitalItems;

@interface PersonalCapitalItem : NSObject
@property (strong,nonatomic) NSString *itemId;
@property (strong,nonatomic) NSString *itemurl;
@property (strong,nonatomic) NSString *category;
@property (strong,nonatomic) NSString *title;
@property (strong,nonatomic) NSString *encoded_title;
@property (strong,nonatomic) NSString *featured_image;
@property (strong,nonatomic) NSString *summary;
@property (strong,nonatomic) NSString *insight_summary;
@property (strong,nonatomic) NSString *content;
@property (strong,nonatomic) NSString *summary_html;
@property (strong,nonatomic) NSString *content_html;
@property (strong,nonatomic) NSString *date_published;
@property (strong,nonatomic) NSString *date_modified;
@property (strong,nonatomic) PersonalCapitalItemAuthor *author;
@end
