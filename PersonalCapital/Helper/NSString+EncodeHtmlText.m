//
//  NSString+EncodeHtmlText.m
//  PersonalCapital
//
//  Created by Dinesh Kumar Dhanekula on 9/7/20.
//  Copyright © 2020 Dinesh Kumar Dhanekula. All rights reserved.
//

#import "NSString+EncodeHtmlText.h"

@implementation NSString (EncodeHtmlText)

+ (NSAttributedString*)encodeHtmlText:(NSString*)htmlText {
            NSAttributedString * str = [[NSAttributedString alloc] initWithData:[htmlText dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    return str;
}

@end
