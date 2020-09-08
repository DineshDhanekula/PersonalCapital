//
//  PersonalCapitalServices.h
//  PersonalCapital
//
//  Created by Dinesh Kumar Dhanekula on 9/7/20.
//  Copyright © 2020 Dinesh Kumar Dhanekula. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PersonalCapitalServices : NSObject
+ (void)getDataFromUrl:(NSString*)urlString completionHandler:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completionHandler;
@end

NS_ASSUME_NONNULL_END
