//
//  ClsComexData.m
//  Jwellers
//
//  Created by pooja patel on 25/06/14.
//  Copyright (c) 2014 pooja patel. All rights reserved.
//

#import "ClsComexData.h"

@implementation ClsComexData

- (id)initWithStrName:(NSString*)kObjStrName andFloatAsk:(float)kObjFloatAsk andFloatBid:(float)kObjFloatBid andObjStatus:(Status)kObjStatus{
    _strName = kObjStrName;
    _floatAsk = kObjFloatAsk;
    _floatBid = kObjFloatBid;
    _objStatus = kObjStatus;
    return self;
}


@end
