//
//  AboutController.h
//  Jwellers
//
//  Created by pooja patel on 13/07/14.
//  Copyright (c) 2014 pooja patel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentController : UIViewController

@property (nonatomic, strong) NSString *strTitle;
@property (nonatomic, strong) NSString *htmlString;
@property (nonatomic, strong) NSURL *baseUrl;

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

@end
