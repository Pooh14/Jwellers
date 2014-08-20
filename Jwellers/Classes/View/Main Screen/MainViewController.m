//
//  MainViewController.m
//  Jwellers
//
//  Created by pooja patel on 28/06/14.
//  Copyright (c) 2014 pooja patel. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    [super viewDidLoad];
    [[JwellersManagerClass sharedManager] setDelegate:self];
    [_scrlContainerView setShowsHorizontalScrollIndicator:NO];
    [_scrlContainerView setShowsVerticalScrollIndicator:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) viewWillAppear:(BOOL)animated{
}

#pragma Set ContactDetail

- (void)setContactDetail{
    ClsContactDetail *objContactDetail = [[ClsContactDetail alloc] init];
    objContactDetail = [[JwellersManagerClass sharedManager] getContactDetail];
    if (objContactDetail && objContactDetail.strPhoneNum) {
        _lblContactDetail.text = [[@"CONTACT: " stringByAppendingString:objContactDetail.strPhoneNum] stringByReplacingOccurrencesOfString:@",+" withString:@""];
    }
}

#pragma Add ComexViewCOntroller in ScrollView

- (void)addComexViewController{
    if (!objComexDataController) {
        objComexDataController = [self.storyboard instantiateViewControllerWithIdentifier:@"comexData"];
        [_scrlContainerView addSubview:objComexDataController.view];
        objComexDataController.view.frame = CGRectMake(0, objLiveRateDetailController.view.frame.size.height, objComexDataController.view.frame.size.width, 180);
        _scrlContainerView.contentSize = CGSizeMake(_scrlContainerView.frame.size.width, objLiveRateDetailController.view.frame.size.height+objComexDataController.view.frame.size.height);
    }
    else{
        [objComexDataController reloadData];
    }
}

#pragma Add LiverateViewController in ScrollView

- (void)addLiveRateViewController{
    if (!objLiveRateDetailController) {
        objLiveRateDetailController = [self.storyboard instantiateViewControllerWithIdentifier:@"liveRate"];
        [_scrlContainerView addSubview:objLiveRateDetailController.view];
        objLiveRateDetailController.view.frame = CGRectMake(0, 0, objLiveRateDetailController.view.frame.size.width, 450);
    }
    else{
        [objLiveRateDetailController reloadData];
    }
}

#pragma JwellersManagerClass Delegate

- (void)completeFetchingData{
    [self setContactDetail];
    [self addLiveRateViewController];
    [self addComexViewController];
    [[JwellersManagerClass sharedManager] performSelector:@selector(refreshData) withObject:nil afterDelay:4.0];
}

- (void)failToLoadData{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"isLogin"]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"User ID and Password is Incorrect" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isLogin"];
    }
    [[JwellersManagerClass sharedManager] performSelector:@selector(refreshData) withObject:nil afterDelay:4.0];
}

- (IBAction)menuClick:(id)sender {
    objSideMenuController = [self.storyboard instantiateViewControllerWithIdentifier:@"sideMenu"];
    objSideMenuController.delegate=self;
    [self.view addSubview:objSideMenuController.view];
    [objSideMenuController.view setFrame:CGRectMake(-320, 0, 320, self.view.frame.size.height)];
    [UIView animateWithDuration:1.0 animations:^{
        [objSideMenuController.view setFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
        [_containerView setFrame:CGRectMake(224, 0, _containerView.frame.size.width, _containerView.frame.size.height)];
        _containerView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);;
    } completion:^(BOOL finished) {
        
    }];
    
}

#pragma SideMenuController Delegate

- (void)closeSideMenu{
    [UIView animateWithDuration:1.0 animations:^{
        _containerView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
        [objSideMenuController.view setFrame:CGRectMake(-320, 0, 320, self.view.frame.size.height)];
        [_containerView setFrame:CGRectMake(0, 0, _containerView.frame.size.width, _containerView.frame.size.height)];
    } completion:^(BOOL finished) {
        
    }];

}

- (void) aboutPageCalled:(BOOL)objIsCalled{
    objAboutController = [self.storyboard instantiateViewControllerWithIdentifier:@"about"];
    //menu is only an example
//    objAboutController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [objAboutController setDelegate:self];
    [self presentViewController:objAboutController animated:YES completion:nil];
    [objAboutController loadWebViewWithIsLoadAbout:objIsCalled];
}

- (void) LoadLoginDataWithId:(NSString*)objId andPwd:(NSString*)objPwd{
    [[JwellersManagerClass sharedManager] loginWithId:objId andPwd:objPwd];
//    [[JwellersManagerClass sharedManager] performSelector:@selector(refreshData) withObject:nil afterDelay:4.0];
}

#pragma AboutAndContactUsController Delegate

-(void)closePresentViewController{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
