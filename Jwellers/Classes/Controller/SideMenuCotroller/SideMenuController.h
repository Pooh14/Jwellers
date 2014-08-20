//
//  SideMenuController.h
//  Jwellers
//
//  Created by pooja patel on 28/06/14.
//  Copyright (c) 2014 pooja patel. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SideMenuControllerDelegate <NSObject>
- (void) closeSideMenu;
- (void) LoadLoginDataWithId:(NSString*)objId andPwd:(NSString*)objPwd;
- (void) aboutPageCalled:(BOOL)objIsCalled;
@end

@interface SideMenuController : UIViewController

@property (nonatomic, strong)   id <SideMenuControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIView *touchView;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UILabel *lblLogin;
@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UIButton *btnArw;
@property (weak, nonatomic) IBOutlet UIView *loginDetailView;
@property (weak, nonatomic) IBOutlet UITextField *txtId;
@property (weak, nonatomic) IBOutlet UITextField *txtPwd;
@property (weak, nonatomic) IBOutlet UIButton *btnLoginExpand;

- (IBAction)btnLoginTapped:(id)sender;
- (IBAction)btnLoginViewExpandTapped:(id)sender;
- (IBAction)btnArwTapped:(id)sender;
- (IBAction)btnAboutClick:(id)sender;
- (IBAction)btnContactClick:(id)sender;

@end
