//
//  DetailWebViewController.m
//  PersonalCapital
//
//  Created by Dinesh Kumar Dhanekula on 9/7/20.
//  Copyright © 2020 Dinesh Kumar Dhanekula. All rights reserved.
//

#import "DetailWebViewController.h"
@interface DetailWebViewController ()<WKNavigationDelegate>
@property (strong,nonatomic) WKWebView *webView;
@end

@implementation DetailWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createWebView];
    if ([self.htmlContentText isEqualToString:@""] || self.htmlContentText == nil) {
           NSURL *nsurl=[NSURL URLWithString:self.url];
           NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
           [_webView loadRequest:nsrequest];
           _webView.hidden = true;
    } else {
        [self.activityIndicator startAnimating];
        _webView.hidden = true;
        [_webView loadHTMLString:self.htmlContentText baseURL:nil];
    }
}

- (void)createWebView {
    self.webView = [[WKWebView alloc]initWithFrame:self.view.bounds];
    [self.webView setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.webView.navigationDelegate = self;
    [self.view addSubview:_webView];
    [self.view addSubview:self.webView];
}



- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    [self.activityIndicator startAnimating];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [self.activityIndicator stopAnimating];
    _webView.hidden = false;
}
@end
