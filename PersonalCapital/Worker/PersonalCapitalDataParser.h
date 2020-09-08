//
//  PersonalCapitalDataParser.h
//  PersonalCapital
//
//  Created by Dinesh Kumar Dhanekula on 9/7/20.
//  Copyright © 2020 Dinesh Kumar Dhanekula. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersonalCapitalProfile.h"

@interface PersonalCapitalDataParser : NSObject

+ (PersonalCapitalProfile*)parseDataIntoPersonalCapitalProfile :(NSDictionary*)jsonData;
@end

