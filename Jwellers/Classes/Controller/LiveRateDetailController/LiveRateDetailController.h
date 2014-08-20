//
//  LiveRateDetailController.h
//  Jwellers
//
//  Created by pooja patel on 27/06/14.
//  Copyright (c) 2014 pooja patel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LiveRateDetailCell.h"
#import "JwellersManagerClass.h"

@interface LiveRateDetailController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) NSMutableArray *arrLiveRateDetail;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

-(void)reloadData;

@end
