//
//  AboutControllerViewController.h
//  Jwellers
//
//  Created by pooja patel on 13/07/14.
//  Copyright (c) 2014 pooja patel. All rights reserved.
//

#import "ViewPagerController.h"
#import "ContentController.h"

@interface AboutController : ViewPagerController <ViewPagerDataSource, ViewPagerDelegate>
{
    NSMutableArray *aboutArray;
    NSMutableArray *contactArray;
    NSMutableArray *objArray;
}

@property (nonatomic) BOOL objIsLoadAbout;

@end
