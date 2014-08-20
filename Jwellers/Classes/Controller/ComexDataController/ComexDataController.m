//
//  ComexDataController.m
//  Jwellers
//
//  Created by pooja patel on 27/06/14.
//  Copyright (c) 2014 pooja patel. All rights reserved.
//

#import "ComexDataController.h"
#import "Header.h"
#import "JwellersManagerClass.h"

@interface ComexDataController ()

@end

@implementation ComexDataController

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
    _arrComexDataArray = [[NSMutableArray alloc] initWithArray:[[JwellersManagerClass sharedManager] getArrComexData]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma CollectionView DataScource Methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _arrComexDataArray.count+1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ComexDataCell *cell = (ComexDataCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"comexCell" forIndexPath:indexPath];
    cell.imgBuy.alpha = cell.imgSell.alpha = 0.0;
    cell.imgBuy.transform = cell.imgSell.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.0, 0.0);
    if (indexPath.row!=0) {
        ClsComexData *objClsComexData = [_arrComexDataArray objectAtIndex:indexPath.row-1];
        cell.lblDescription.text = objClsComexData.strName;
        NSNumberFormatter* nf=[[NSNumberFormatter alloc]init];
        nf.minimumFractionDigits=(indexPath.row==1)?4:(indexPath.row==2)?3:2;
        nf.maximumFractionDigits=(indexPath.row==1)?4:(indexPath.row==2)?3:2;
        
        if ([cell.lblBid.text floatValue]>[[nf stringFromNumber:[NSNumber numberWithFloat:objClsComexData.floatBid]] floatValue]) {
            
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
            [cell.lblBid setTextColor:[UIColor redColor]];
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
            
            [cell.lblBid setTextColor:[UIColor greenColor]];
        }
        if ([cell.lblAsk.text floatValue]>[[nf stringFromNumber:[NSNumber numberWithFloat:objClsComexData.floatAsk]] floatValue]) {
            [cell.lblAsk setTextColor:[UIColor greenColor]];
        }
        else{
            [cell.lblAsk setTextColor:[UIColor redColor]];
        }

        cell.lblBid.text = [nf stringFromNumber:[NSNumber numberWithFloat:objClsComexData.floatBid]];
        cell.lblAsk.text = [nf stringFromNumber:[NSNumber numberWithFloat:objClsComexData.floatAsk]];
         cell.lblDescription.textColor = [UIColor blackColor];
        [cell.cellView setBackgroundColor:[UIColor colorWithRed:245.0/255.0 green:240.0/255.0 blue:215.0/255.0 alpha:0.9]];

        cell.bgImage.hidden = YES;

    }
    else{
        [cell.cellView setBackgroundColor:[UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.70]];

        cell.lblAsk.textColor = cell.lblBid.textColor = cell.lblDescription.textColor = [UIColor whiteColor];
        cell.lblDescription.text = [@"description" uppercaseString];
        cell.lblBid.text = [@"bid" uppercaseString];
        cell.lblAsk.text = [@"ask" uppercaseString];
        cell.bgImage.hidden = NO;

    }

    return cell;
}

-(void)reloadData{
    _arrComexDataArray = [[NSMutableArray alloc] initWithArray:[[JwellersManagerClass sharedManager] getArrComexData]];
    [_collectionView reloadData];
}

#pragma CollectionView Delegate Methods

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}


@end
