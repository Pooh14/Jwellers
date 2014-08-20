//
//  AboutAndContactController.h
//  Jwellers
//
//  Created by pooja patel on 02/07/14.
//  Copyright (c) 2014 pooja patel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AboutController.h"

@protocol AboutAndContactControllerDelegate <NSObject>
- (void) closePresentViewController;
@end

@interface AboutAndContactController : UIViewController <UIWebViewDelegate>
{
    AboutController *objAboutController;
}
@property (nonatomic, strong)   id <AboutAndContactControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UILabel *lblAbout;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

- (IBAction)btnCloseTapped:(id)sender;
-(void)loadWebViewWithIsLoadAbout:(BOOL)objIsLoadAbout;

@end
