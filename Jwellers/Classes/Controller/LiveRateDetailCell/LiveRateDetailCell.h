//
//  LiveRateDetailCell.h
//  Jwellers
//
//  Created by pooja patel on 27/06/14.
//  Copyright (c) 2014 pooja patel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LiveRateDetailCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UILabel *lblProduct;
@property (weak, nonatomic) IBOutlet UILabel *lblBuy;
@property (weak, nonatomic) IBOutlet UILabel *lblSell;
@property (weak, nonatomic) IBOutlet UILabel *lblStk;
@property (weak, nonatomic) IBOutlet UIImageView *imgStk;
@property (weak, nonatomic) IBOutlet UIImageView *imgBuy;
@property (weak, nonatomic) IBOutlet UIImageView *imgSell;
@property (nonatomic, strong) UIColor *lastBuyColor;
@property (nonatomic, strong) UIColor *lastSellColor;
@property (weak, nonatomic) IBOutlet UIImageView *bgImage;


@end
