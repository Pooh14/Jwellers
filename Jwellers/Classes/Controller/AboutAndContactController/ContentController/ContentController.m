//
//  AboutController.m
//  Jwellers
//
//  Created by pooja patel on 13/07/14.
//  Copyright (c) 2014 pooja patel. All rights reserved.
//

#import "ContentController.h"

@interface ContentController ()

@end

@implementation ContentController

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
    [_webView loadHTMLString:_htmlString baseURL:_baseUrl];
    [_lblTitle setText:_strTitle];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
