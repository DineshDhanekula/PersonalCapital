//
//  DetailWebViewController.h
//  PersonalCapital
//
//  Created by Dinesh Kumar Dhanekula on 9/7/20.
//  Copyright © 2020 Dinesh Kumar Dhanekula. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "BaseViewController.h"

@interface DetailWebViewController : BaseViewController

@property (strong,nonatomic) NSString *url;
@property (strong,nonatomic) NSString *htmlContentText;

@end

