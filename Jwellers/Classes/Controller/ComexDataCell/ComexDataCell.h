//
//  ComexDataCell.h
//  Jwellers
//
//  Created by pooja patel on 27/06/14.
//  Copyright (c) 2014 pooja patel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComexDataCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIView *cellView;
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;
@property (weak, nonatomic) IBOutlet UILabel *lblBid;
@property (weak, nonatomic) IBOutlet UILabel *lblAsk;
@property (weak, nonatomic) IBOutlet UIImageView *imgBuy;
@property (weak, nonatomic) IBOutlet UIImageView *imgSell;
@property (weak, nonatomic) IBOutlet UIImageView *bgImage;

@property (nonatomic, strong) UIColor *lastBuyColor;
@property (nonatomic, strong) UIColor *lastSellColor;

@end
