//
//  ClsComexData.h
//  Jwellers
//
//  Created by pooja patel on 25/06/14.
//  Copyright (c) 2014 pooja patel. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    UP,
    DOWN
}Status;

@interface ClsComexData : NSObject

@property (nonatomic, strong) NSString *strName;
@property (nonatomic) float floatAsk;
@property (nonatomic) float floatBid;
@property (nonatomic) Status objStatus;

- (id)initWithStrName:(NSString*)kObjStrName andFloatAsk:(float)kObjFloatAsk andFloatBid:(float)kObjFloatBid andObjStatus:(Status)kObjStatus;

@end
