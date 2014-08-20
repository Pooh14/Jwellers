//
//  LiveRateDetailController.m
//  Jwellers
//
//  Created by pooja patel on 27/06/14.
//  Copyright (c) 2014 pooja patel. All rights reserved.
//

#import "LiveRateDetailController.h"
#import "Header.h"

@interface LiveRateDetailController ()

@end

@implementation LiveRateDetailController

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
    _arrLiveRateDetail = [[NSMutableArray alloc] initWithArray:[[JwellersManagerClass sharedManager] getArrLiveRateDetail]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma CollectionView DataScource Methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSLog(@"count: %d",_arrLiveRateDetail.count);
    if (_arrLiveRateDetail.count==18) {
        NSLog(@"prob");
    }
    return _arrLiveRateDetail.count+1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LiveRateDetailCell *cell = (LiveRateDetailCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"liveRateCell" forIndexPath:indexPath];
    cell.imgBuy.alpha = cell.imgSell.alpha = 0.0;
    cell.imgBuy.transform = cell.imgSell.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.0, 0.0);
    if (indexPath.row!=0) {
        ClsLiveRateDetail *objLiverateDetail = [_arrLiveRateDetail objectAtIndex:indexPath.row-1];
        cell.lblProduct.text = objLiverateDetail.strProductName;
        if ([cell.lblBuy.text integerValue]>[[[[NSString stringWithFormat:@"%f", objLiverateDetail.dblBuyPrice] componentsSeparatedByString:@"."] firstObject] integerValue]) {
            [cell.imgBuy setImage:[UIImage imageNamed:@"red_glow.png"]];
            if (cell.lastBuyColor && ![cell.lastBuyColor isEqual:[UIColor redColor]]) {
                [UIView animateWithDuration:0.3 animations:^{
                    cell.imgBuy.alpha =0.5;
                    cell.imgBuy.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2);
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:0.3 animations:^{
                        cell.imgBuy.alpha =0.0;
                        cell.imgBuy.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0, 0);
                        
                    }];
                }];
            }
            cell.lastBuyColor = [UIColor redColor];
            
            [cell.lblBuy setTextColor:[UIColor redColor]];

        }
        else{
            
            
            [cell.imgBuy setImage:[UIImage imageNamed:@"green_glow.png"]];
            if (cell.lastBuyColor && ![cell.lastBuyColor isEqual:[UIColor greenColor]]) {
                [UIView animateWithDuration:0.3 animations:^{
                    cell.imgBuy.alpha =0.5;
                    cell.imgBuy.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2);
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:0.3 animations:^{
                        cell.imgBuy.alpha =0.0;
                        cell.imgBuy.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0, 0);
                    }];
                }];
            }
            cell.lastBuyColor = [UIColor greenColor];
            [cell.lblBuy setTextColor:[UIColor greenColor]];
        }
        if ([cell.lblSell.text integerValue]>[[[[NSString stringWithFormat:@"%f", objLiverateDetail.dblSellPrice] componentsSeparatedByString:@"."] firstObject] integerValue]) {
            
            [cell.imgSell setImage:[UIImage imageNamed:@"red_glow.png"]];
            if (cell.lastSellColor && ![cell.lastSellColor isEqual:[UIColor redColor]]) {
                [UIView animateWithDuration:0.3 animations:^{
                    cell.imgSell.alpha =0.5;
                    cell.imgSell.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2);
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:0.3 animations:^{
                        cell.imgSell.alpha =0.0;
                        cell.imgSell.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0, 0);
                        
                    }];
                }];
            }
            cell.lastSellColor = [UIColor redColor];
            
            [cell.lblSell setTextColor:[UIColor redColor]];
            
        }
        else{
            
            [cell.imgSell setImage:[UIImage imageNamed:@"green_glow.png"]];
            if (cell.lastSellColor && ![cell.lastSellColor isEqual:[UIColor greenColor]]) {
                [UIView animateWithDuration:0.3 animations:^{
                    cell.imgSell.alpha =0.5;
                    cell.imgSell.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2);
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:0.3 animations:^{
                        cell.imgSell.alpha =0.0;
                        cell.imgSell.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0, 0);
                    }];
                }];
            }
            cell.lastSellColor = [UIColor greenColor];
            
            [cell.lblSell setTextColor:[UIColor greenColor]];
        }
        cell.lblBuy.text = [[[NSString stringWithFormat:@"%f",objLiverateDetail.dblBuyPrice] componentsSeparatedByString:@"."] firstObject];
        cell.lblSell.text = [[[NSString stringWithFormat:@"%f", objLiverateDetail.dblSellPrice] componentsSeparatedByString:@"."] firstObject];
        cell.lblStk.hidden=YES;
        cell.imgStk.hidden=NO;
        cell.lblProduct.textColor = cell.lblStk.textColor = [UIColor blackColor];
        if (objLiverateDetail.intInStock == 0)
        {
            cell.imgStk.image = [UIImage imageNamed:@"not-available.png"];
        }
        else
        {
            cell.imgStk.image = [UIImage imageNamed:@"available.png"];
        }
        if ([cell.lblProduct.text rangeOfString:@"GM"].location!=NSNotFound)
        {
            [cell.containerView setBackgroundColor:[UIColor colorWithRed:249.0/255.0 green:163.0/255.0 blue:75.0/255.0 alpha:0.9]];
        }
        else
        {
            [cell.containerView setBackgroundColor:[UIColor colorWithRed:245.0/255.0 green:240.0/255.0 blue:215.0/255.0 alpha:0.9]];
        }
        cell.bgImage.hidden = YES;
    }
    else{
        [cell.containerView setBackgroundColor:[UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.70]];
        cell.lblProduct.textColor = cell.lblBuy.textColor = cell.lblSell.textColor = cell.lblStk.textColor = [UIColor whiteColor];
        cell.lblProduct.text = [@"product" uppercaseString];
        cell.lblBuy.text = [@"buy" uppercaseString];
        cell.lblSell.text = [@"sell" uppercaseString];
        cell.lblStk.text =[@"stk" uppercaseString];
        cell.lblStk.hidden=NO;
        cell.imgStk.hidden=YES;
        cell.bgImage.hidden = NO;
    }
    
    return cell;
}


-(void)reloadData{
    _arrLiveRateDetail = [[NSMutableArray alloc] initWithArray:[[JwellersManagerClass sharedManager] getArrLiveRateDetail]];
    [_collectionView reloadData];
}


#pragma CollectionView Delegate Methods

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
