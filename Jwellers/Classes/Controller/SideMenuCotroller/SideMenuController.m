//
//  SideMenuController.m
//  Jwellers
//
//  Created by pooja patel on 28/06/14.
//  Copyright (c) 2014 pooja patel. All rights reserved.
//

#import "SideMenuController.h"

@interface SideMenuController ()

@end

@implementation SideMenuController

-(void)viewWillAppear:(BOOL)animated{
    [self initialize];
}

-(void)initialize{
    UITapGestureRecognizer *viewTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    [_touchView addGestureRecognizer:viewTapRecognizer];
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"isLogin"]) {
        [_lblLogin setText:@"LOGOUT"];
        _btnArw.hidden=YES;
//        [_loginView setHidden:YES];
//        CGRect rect = _containerView.frame;
//        rect.origin = CGPointMake(0, 50);
//        _containerView.frame = rect;
    }
    else
    {
        [_lblLogin setText:@"LOGIN"];
        [_btnArw setHidden:NO];
    }

}

- (IBAction)btnLoginTapped:(id)sender{
//    if([_delegate respondsToSelector:@selector(closeSideMenu)]) {
//        [_delegate closeSideMenu];
//    }
        [_txtId resignFirstResponder];
        [_txtPwd resignFirstResponder];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isLogin"];
        if([_delegate respondsToSelector:@selector(closeSideMenu)]) {
            [_delegate closeSideMenu];
        }
        if([_delegate respondsToSelector:@selector(LoadLoginDataWithId:andPwd:)]) {
            [_delegate LoadLoginDataWithId:_txtId.text andPwd:_txtPwd.text];
        }
   
}

- (IBAction)btnLoginViewExpandTapped:(id)sender{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"isLogin"])
    {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isLogin"];
        if([_delegate respondsToSelector:@selector(closeSideMenu)]) {
            [_delegate closeSideMenu];
        }
    }
    else
    {
        int increaseHeight= 112;
        _loginDetailView.hidden=NO;
        [_loginDetailView setAlpha:0.0];
        _containerView.hidden=NO;
        [UIView animateWithDuration:1.0 animations:^{
            [_loginView setFrame:CGRectMake(_loginView.frame.origin.x, _loginView.frame.origin.y, _loginView.frame.size.width, _loginView.frame.size.height+increaseHeight)];
            [_containerView setFrame:CGRectMake(_containerView.frame.origin.x, _containerView.frame.origin.y+increaseHeight, _containerView.frame.size.width, _containerView.frame.size.height)];
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.5 animations:^{
                [_loginDetailView setAlpha:1.0];
                [_btnLoginExpand setHidden:YES];
                _containerView.hidden=NO;
                [_btnArw setImage:[UIImage imageNamed:@"up.png"] forState:UIControlStateNormal];
                
            } completion:^(BOOL finished) {
            }];
        }];
    }
}

- (IBAction)btnArwTapped:(id)sender {
    _btnArw.userInteractionEnabled=NO;
    int decreaseHeight= 112;
    _loginDetailView.hidden=NO;
    [_loginDetailView setAlpha:1.0];
    [UIView animateWithDuration:0.5 animations:^{
        [_loginDetailView setAlpha:0.0];
        [_btnLoginExpand setHidden:NO];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 animations:^{
            [_loginView setFrame:CGRectMake(_loginView.frame.origin.x, _loginView.frame.origin.y, _loginView.frame.size.width, _loginView.frame.size.height-decreaseHeight)];
            [_containerView setFrame:CGRectMake(_containerView.frame.origin.x, _containerView.frame.origin.y-decreaseHeight, _containerView.frame.size.width, _containerView.frame.size.height)];
//            _btnArw.center = CGPointMake(_btnArw.center.x, _loginView.center.y);
           } completion:^(BOOL finished) {
               [_btnArw setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
               _btnArw.userInteractionEnabled=YES;
        }];
    }];

}

- (IBAction)btnAboutClick:(id)sender {
    if([_delegate respondsToSelector:@selector(closeSideMenu)]) {
        [_delegate closeSideMenu];
    }
    if([_delegate respondsToSelector:@selector(aboutPageCalled:)]) {
        [_delegate aboutPageCalled:YES];
    }
}

- (IBAction)btnContactClick:(id)sender {
    if([_delegate respondsToSelector:@selector(closeSideMenu)]) {
        [_delegate closeSideMenu];
    }
    if([_delegate respondsToSelector:@selector(aboutPageCalled:)]) {
        [_delegate aboutPageCalled:NO];
    }
}

-(IBAction) viewTapped:(UITapGestureRecognizer*)recognizer
{
    [_txtPwd resignFirstResponder];
    [_txtId resignFirstResponder];
    if([_delegate respondsToSelector:@selector(closeSideMenu)]) {
        [_delegate closeSideMenu];
    }
}

@end
