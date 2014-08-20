//
//  JwellersManagerClass.h
//  Jwellers
//
//  Created by pooja patel on 26/06/14.
//  Copyright (c) 2014 pooja patel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Header.h"

@protocol JwellersManagerClassDelegate <NSObject>
- (void) completeFetchingData;
- (void) failToLoadData;
@end

@interface JwellersManagerClass : NSObject
{
    NSMutableArray *arrComexData;
    ClsContactDetail *objContactDetail;
    NSMutableArray *arrLiveRateDetail;
}

@property (nonatomic, strong)   id <JwellersManagerClassDelegate> delegate;
@property (nonatomic, strong) NSString* strId;
@property (nonatomic, strong) NSString *strPwd;

+ (id)sharedManager;
- (NSMutableArray*)getArrComexData;
- (NSMutableArray*)getArrLiveRateDetail;
- (ClsContactDetail*)getContactDetail;
- (void)refreshData;
- (void)loginWithId:(NSString*)strId andPwd:(NSString*)strPwd;
- (NSMutableArray *)getContactArray;
- (NSMutableArray *)getAboutArray;
@end
