//
//  MainViewController.h
//  Jwellers
//
//  Created by pooja patel on 28/06/14.
//  Copyright (c) 2014 pooja patel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ComexDataController.h"
#import "LiveRateDetailController.h"
#import "JwellersManagerClass.h"
#import "SideMenuController.h"
#import "AboutAndContactController.h"

@interface MainViewController : UIViewController <JwellersManagerClassDelegate, SideMenuControllerDelegate, AboutAndContactControllerDelegate>
{
    ComexDataController *objComexDataController;
    LiveRateDetailController *objLiveRateDetailController;
    SideMenuController *objSideMenuController;
    AboutAndContactController *objAboutController;
}

@property (weak, nonatomic) IBOutlet UILabel *lblContactDetail;
@property (weak, nonatomic) IBOutlet UIScrollView *scrlContainerView;
@property (weak, nonatomic) IBOutlet UIView *containerView;

- (IBAction)menuClick:(id)sender;


@end
