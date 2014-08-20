//
//  ClsLiveRateDetail.h
//  Jwellers
//
//  Created by pooja patel on 25/06/14.
//  Copyright (c) 2014 pooja patel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClsLiveRateDetail : NSObject

@property (nonatomic) NSInteger intInStock;
@property (nonatomic) NSInteger intInTabel;
@property (nonatomic, strong) NSString *strProductName;
@property (nonatomic) double dblBuyPrice;
@property (nonatomic) double dblSellPrice;
@property (nonatomic) Status objStatus;

- (id) initWithIntInStock:(NSInteger)kIntInStock andIntInTabel:(NSInteger)kIntInTabel andStrProductName:(NSString*)kStrProductName andDblBuyPrice:(double)kDblBuyPrice andDblSellPrice:(double)kDblSellPrice andObjStatus:(Status)kObjStatus;

@end
