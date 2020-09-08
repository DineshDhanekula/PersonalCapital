//
//  PersonalCapitalDataParser.m
//  PersonalCapital
//
//  Created by Dinesh Kumar Dhanekula on 9/7/20.
//  Copyright © 2020 Dinesh Kumar Dhanekula. All rights reserved.
//

#import "PersonalCapitalDataParser.h"
#import "NSString+EncodeHtmlText.h"
#import "Constants.h"

@implementation PersonalCapitalDataParser

+(PersonalCapitalProfile*)parseDataIntoPersonalCapitalProfile :(NSDictionary*)jsonData {
  PersonalCapitalProfile* personalCapitalProfile = [PersonalCapitalProfile new];
    if (jsonData[PersonalCapitalProfileVersion]) {
        personalCapitalProfile.version = jsonData[PersonalCapitalProfileVersion];
    }
    if (jsonData[PersonalCapitalProfileUser_comment]) {
        personalCapitalProfile.user_comment = jsonData[PersonalCapitalProfileUser_comment];
    }
    if (jsonData[PersonalCapitalProfileHome_page_url]) {
        personalCapitalProfile.home_page_url = jsonData[PersonalCapitalProfileHome_page_url];
    }
    if (jsonData[PersonalCapitalProfileFeed_url]) {
        personalCapitalProfile.feed_url = jsonData[PersonalCapitalProfileFeed_url];
    }
    if (jsonData[PersonalCapitalProfileTitle]) {
        personalCapitalProfile.title = jsonData[PersonalCapitalProfileTitle];
    }
    if (jsonData[PersonalCapitalProfileDescription]) {
        personalCapitalProfile.pagedescription = jsonData[PersonalCapitalProfileDescription];
    }
    if (jsonData[PersonalCapitalProfileItems]) {
        NSMutableArray<PersonalCapitalItem *> *personalCapitalItems = NSMutableArray.new;
        NSMutableArray *items = jsonData[PersonalCapitalProfileItems];
        for (NSDictionary *item in items) {
            PersonalCapitalItem *capitalItem = PersonalCapitalItem.new;
            if (item[PersonalCapitalProfileItemsId]) {
                capitalItem.itemId = item[PersonalCapitalProfileItemsId];
            }
            if (item[PersonalCapitalProfileItemsUrl]) {
                capitalItem.itemurl = item[PersonalCapitalProfileItemsUrl];
            }
            if (item[PersonalCapitalProfileItemsCategory]) {
                capitalItem.category = item[PersonalCapitalProfileItemsCategory];
            }
            if (item[PersonalCapitalProfileItemsTitle]) {
                capitalItem.title = [NSString encodeHtmlText:item[PersonalCapitalProfileItemsTitle]].string;
                
            }
            if (item[PersonalCapitalProfileItemsEncoded_title]) {
                capitalItem.encoded_title = item[PersonalCapitalProfileItemsEncoded_title];
            }
            if (item[PersonalCapitalProfileItemsFeatured_image]) {
                capitalItem.featured_image = item[PersonalCapitalProfileItemsFeatured_image];
            }
            if (item[PersonalCapitalProfileItemsSummary]) {
                capitalItem.summary = [NSString encodeHtmlText:item[PersonalCapitalProfileItemsSummary]].string;
            }
            if (item[PersonalCapitalProfileItemsInsight_summary]) {
                capitalItem.insight_summary = item[PersonalCapitalProfileItemsInsight_summary];
            }
            if (item[PersonalCapitalProfileItemsContent]) {
                capitalItem.content = item[PersonalCapitalProfileItemsContent];
            }
            if (item[PersonalCapitalProfileItemsSummary_html]) {
                capitalItem.summary_html = item[PersonalCapitalProfileItemsSummary_html];
            }
            if (item[PersonalCapitalProfileItemsContent_html]) {
                capitalItem.content_html = item[PersonalCapitalProfileItemsContent_html];
            }
            if (item[PersonalCapitalProfileItemsDate_published]) {
                capitalItem.date_published = item[PersonalCapitalProfileItemsDate_published];
            }
            if (item[PersonalCapitalProfileItemsDate_modified]) {
                capitalItem.date_modified = item[PersonalCapitalProfileItemsDate_modified];
            }
            //            PersonalCapitalItemAuthor *personalCapitalItemAuthor = PersonalCapitalItemAuthor.new;
            //            if (item[@"author"]) {
            //                NSDictionary *author = item[@"author"];
            //                if (author[@"name"]) {
            //                    personalCapitalItemAuthor.author = [NSString stringWithFormat: @"Craig Birk, CFP\u00ae"];
            //                 personalCapitalItem.author = personalCapitalItemAuthor;
            //                }
            //            }
            [personalCapitalItems addObject:capitalItem];
        }
        personalCapitalProfile.personalCapitalitems = personalCapitalItems;
    }
  return personalCapitalProfile;
}

@end
