//
//  ViewController.m
//  xiechengxxx
//
//  Created by Shenguang on 16/9/21.
//  Copyright © 2016年 Shenguang. All rights reserved.
//

#import "ViewController.h"
#import <NJKWebViewProgress.h>
#import <NJKWebViewProgressView.h>
#import "ViewqiandanController.h"
//NJKWebViewProgressDelegate
@interface ViewController ()<UIWebViewDelegate,NJKWebViewProgressDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webview2;
@property (nonatomic, strong) NJKWebViewProgress *progressProxy;
@property (nonatomic, strong) NJKWebViewProgressView *progressView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webview2.scalesPageToFit = YES;
    self.progressView = [[NJKWebViewProgressView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 10)];
    [self.view addSubview:_progressView];
    self.progressProxy = [[NJKWebViewProgress alloc] init]; // instance variable
    _webview2.delegate = _progressProxy;
    _progressProxy.webViewProxyDelegate = self;
    _progressProxy.progressDelegate = self;
    [self.webview2 loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://vbooking.ctrip.com/dingzhi/GrabRequire/index"]]];
    
    //http://vbooking.ctrip.com/dingzhi-vbooking-web/roblist?from=http%3A%2F%2Fvbooking.ctrip.com%2Fvbkh5%2Fboard
    //电脑版
    //http://vbooking.ctrip.com/Package_Vendor_Vbooking/UserManagement/Login2.aspx
    
//    [self.webview2 stringByEvaluatingJavaScriptFromString:@"var script = document.createElement('script');"
//     "script.type = 'text/javascript';"
//     "script.src='http://180.169.81.131/test/vbooking/go.js';"
//     "document.getElementsByTagName('head')[0].appendChild(script);"];
}

- (void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress{
    [_progressView setProgress:progress animated:NO];
}





- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    if (navigationType == UIWebViewNavigationTypeLinkClicked)
    {
//        if ([[webView.request.URL absoluteString]isEqualToString:@"http://vbooking.ctrip.com/dingzhi/GrabRequire/index"]) {
//            NSURL *url = [request URL];
//            NSLog(@"%@",[url absoluteString]);
//            UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//            
//            ViewqiandanController *VC = [story instantiateViewControllerWithIdentifier:@"dd"];
//            VC.httpURl = url;
//            [UIApplication sharedApplication].keyWindow.rootViewController = VC;
//            //[_webview2 loadRequest:request];
//            
//            return NO;
//            
//        }
        
    }else if (navigationType == UIWebViewNavigationTypeOther){
        if ([[webView.request.URL absoluteString]isEqualToString:@"http://vbooking.ctrip.com/dingzhi/#%23%23"]) {
            //NSURL *url = [request URL];
            NSURL *url = [NSURL URLWithString:@"//vbooking.ctrip.com/dingzhi/GrabRequire/index"];
            NSLog(@"%@",[url absoluteString]);
            UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            
            ViewqiandanController *VC = [story instantiateViewControllerWithIdentifier:@"dd"];
            VC.httpURl = url;
            [UIApplication sharedApplication].keyWindow.rootViewController = VC;
            //[_webview2 loadRequest:request];
            
            return NO;
            
        }
    }
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
