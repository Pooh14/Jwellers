//
//  ClsLiveRateDetail.m
//  Jwellers
//
//  Created by pooja patel on 25/06/14.
//  Copyright (c) 2014 pooja patel. All rights reserved.
//

#import "ClsLiveRateDetail.h"

@implementation ClsLiveRateDetail

- (id) initWithIntInStock:(NSInteger)kIntInStock andIntInTabel:(NSInteger)kIntInTabel andStrProductName:(NSString*)kStrProductName andDblBuyPrice:(double)kDblBuyPrice andDblSellPrice:(double)kDblSellPrice andObjStatus:(Status)kObjStatus{
    _intInStock = kIntInStock;
    _intInTabel = kIntInTabel;
    _strProductName = kStrProductName;
    _dblBuyPrice = kDblBuyPrice;
    _dblSellPrice = kDblSellPrice;
    _objStatus = kObjStatus;
    return self;
}

@end
