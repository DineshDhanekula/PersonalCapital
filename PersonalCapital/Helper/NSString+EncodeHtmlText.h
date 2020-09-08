//
//  NSString+EncodeHtmlText.h
//  PersonalCapital
//
//  Created by Dinesh Kumar Dhanekula on 9/7/20.
//  Copyright © 2020 Dinesh Kumar Dhanekula. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (EncodeHtmlText)
+ (NSAttributedString*)encodeHtmlText:(NSString*)htmlText ;
@end
