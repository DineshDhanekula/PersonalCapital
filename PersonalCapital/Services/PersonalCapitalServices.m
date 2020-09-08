//
//  PersonalCapitalServices.m
//  PersonalCapital
//
//  Created by Dinesh Kumar Dhanekula on 9/7/20.
//  Copyright © 2020 Dinesh Kumar Dhanekula. All rights reserved.
//

#import "PersonalCapitalServices.h"

@implementation PersonalCapitalServices

+ (void)getDataFromUrl:(NSString*)urlString completionHandler:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completionHandler {
    NSURL *url = [NSURL URLWithString:urlString];
    dispatch_async(dispatch_get_global_queue(0,0), ^{
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        completionHandler(data,response,error);
    }]resume];
    });
}

@end
