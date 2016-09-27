//
//  ViewqiandanController.m
//  xiechengxxx
//
//  Created by Shenguang on 16/9/21.
//  Copyright © 2016年 Shenguang. All rights reserved.
//

#import "ViewqiandanController.h"
#import <NJKWebViewProgress.h>
#import <NJKWebViewProgressView.h>

@interface ViewqiandanController ()<UIWebViewDelegate,NJKWebViewProgressDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webview;
@property (nonatomic, strong) NJKWebViewProgress *progressProxy;
@property (nonatomic, strong) NJKWebViewProgressView *progressView;
@end

@implementation ViewqiandanController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"%s",__func__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.progressView = [[NJKWebViewProgressView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 5)];
    [self.view addSubview:_progressView];
    self.progressProxy = [[NJKWebViewProgress alloc] init]; // instance variable
    _webview.delegate = _progressProxy;
    _progressProxy.webViewProxyDelegate = self;
    _progressProxy.progressDelegate = self;
    NSLog(@"%@",self.httpURl);
    NSURL *url = [NSURL URLWithString:@"http://vbooking.ctrip.com/dingzhi/GrabRequire/index"];
    [_webview loadRequest:[NSURLRequest requestWithURL:url]];
    _webview.scalesPageToFit = YES;
}



- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"%s",__func__);
    if ([[webView.request.URL absoluteString]isEqualToString:@"http://vbooking.ctrip.com/dingzhi/GrabRequire/index"]) {
        [webView stringByEvaluatingJavaScriptFromString:@"var script = document.createElement('script');"
             "script.type = 'text/javascript';"
            "script.charset = 'utf-8';"
             "script.src='http://180.169.81.131/test/vbooking/go.js';"
             "document.getElementsByTagName('head')[0].appendChild(script);"];
    }
}


- (void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress{
    [_progressView setProgress:progress animated:NO];
}



@end
