//
//  AboutAndContactController.m
//  Jwellers
//
//  Created by pooja patel on 02/07/14.
//  Copyright (c) 2014 pooja patel. All rights reserved.
//

#import "AboutAndContactController.h"

#define kAboutUrl @"http://www.mxgold.co/aboutus"
#define kContactUrl @"http://www.mxgold.co/contactus"

@interface AboutAndContactController ()

@end

@implementation AboutAndContactController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (IBAction)btnCloseTapped:(id)sender {
    if([_delegate respondsToSelector:@selector(closePresentViewController)]) {
        [_delegate closePresentViewController];
    }
}

-(void)loadWebViewWithIsLoadAbout:(BOOL)objIsLoadAbout
{
    _lblAbout.text = (objIsLoadAbout)?@"ABOUT US":@"CONTACT US";
    objAboutController = [self.storyboard instantiateViewControllerWithIdentifier:@"AboutController"];
    objAboutController.objIsLoadAbout =objIsLoadAbout;
    [_containerView addSubview:objAboutController.view];
    objAboutController.view.frame = CGRectMake(0, 0, 320, self.view.frame.size.height-60);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    _activityIndicator.hidden=YES;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    _activityIndicator.hidden=YES;
}

@end
