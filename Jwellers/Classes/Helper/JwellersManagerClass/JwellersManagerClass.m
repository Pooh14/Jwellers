//
//  JwellersManagerClass.m
//  Jwellers
//
//  Created by pooja patel on 26/06/14.
//  Copyright (c) 2014 pooja patel. All rights reserved.
//

#import "JwellersManagerClass.h"

@implementation JwellersManagerClass

+ (id)sharedManager {
    static JwellersManagerClass *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
        arrComexData = [[NSMutableArray alloc] init];
        arrLiveRateDetail =[[NSMutableArray alloc] init];
        [self getAllData];
    }
    return self;
}

- (void)refreshData{
    arrComexData = [[NSMutableArray alloc] init];
    arrLiveRateDetail =[[NSMutableArray alloc] init];
    [self getAllData];
}

- (void)loginWithId:(NSString*)kStrId andPwd:(NSString*)kStrPwd
{
    _strId = kStrId;
    _strPwd = kStrPwd;
//    [self getAllData];
}

- (NSString*)getUrl{
    if (_strId) {
        return kClientLogin;
    }
    return kGeneralUrl;
}

- (NSDictionary*)getParameterDict{
    NSMutableDictionary *parDic = [NSMutableDictionary dictionary];
    
    if (!([[NSUserDefaults standardUserDefaults] boolForKey:@"isLogin"])) {
        _strId = _strPwd = nil;
    }
    if (_strId) {
        [parDic setObject:_strId forKey:kClientLoginKeyId];
        [parDic setObject:_strPwd forKey:kClientLoginKeyPwd];
    }
    else{
        [parDic setObject:kGeneralUrlObject forKey:kGeneralUrlKey];
    }
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:parDic options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    NSDictionary *dictparam = [NSDictionary dictionaryWithObject:jsonString forKey:(_strPwd)?kClientLoginMainKey:kGeneralUrlMainKey];

    return dictparam;
}

- (void)getAllData{
    
    AFHTTPRequestOperationManager *operationManager = [AFHTTPRequestOperationManager manager];
    operationManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    AFHTTPRequestOperation *operation = [operationManager POST:[self getUrl] parameters:[self getParameterDict] constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *objFullDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if ([objFullDict objectForKey:@"ComexData"]==[NSNull null]) {
            NSLog(@"null");
        }
        if ([objFullDict objectForKey:@"ComexData"]!=[NSNull null])
        {
            if (arrComexData.count==0) {
                for (NSDictionary *objDict in [objFullDict objectForKey:@"ComexData"])
                {
                    ClsComexData *objClsComexData = (ClsComexData*)[[ClsComexData alloc] initWithStrName:[objDict objectForKey:@"symbol"] andFloatAsk:[[objDict objectForKey:@"ask"] floatValue] andFloatBid:[[objDict objectForKey:@"bid"] floatValue] andObjStatus:[self getStatusOfString:[objDict objectForKey:@"status"]]];
                    [arrComexData addObject:objClsComexData];
                }
            }
        }
        else{
            if([_delegate respondsToSelector:@selector(failToLoadData)]) {
                [_delegate failToLoadData];
            }
            return ;
        }
        
        if ([objFullDict objectForKey:@"Liverate_Details"]!=[NSNull null])
        {
            if (arrLiveRateDetail.count==9) {
                NSLog(@"prob");
            }
            if (arrLiveRateDetail.count==0) {
                for (NSDictionary *objDict in [objFullDict objectForKey:@"Liverate_Details"])
                {
                    ClsLiveRateDetail *objClsLiveRateDetail = [[ClsLiveRateDetail alloc] initWithIntInStock:[[objDict objectForKey:@"InStock"] integerValue] andIntInTabel:[[objDict objectForKey:@"InTable"] integerValue] andStrProductName:[objDict objectForKey:@"ProductName"] andDblBuyPrice:[[objDict objectForKey:@"buy"] doubleValue] andDblSellPrice:[[objDict objectForKey:@"sell"] doubleValue] andObjStatus:[self getStatusOfString:[objDict objectForKey:@"status"]]];
                    [arrLiveRateDetail addObject:objClsLiveRateDetail];
                }
            }
            if (arrLiveRateDetail.count==18) {
                NSLog(@"prob");
            }
        }
        else{
            if([_delegate respondsToSelector:@selector(failToLoadData)]) {
                [_delegate failToLoadData];
            }
            return;
        }
        NSString* strContactDetail = [objFullDict objectForKey:@"ForBookingNo"];
        objContactDetail = [[ClsContactDetail alloc] initWithArrContactDetail:strContactDetail];
        if([_delegate respondsToSelector:@selector(completeFetchingData)]) {
            [_delegate completeFetchingData];
        }

        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
        if([_delegate respondsToSelector:@selector(failToLoadData)]) {
            [_delegate failToLoadData];
        }

    }];
    [operation start];
}

- (Status)getStatusOfString:(NSString*)strStatus{
    if ([strStatus isEqualToString:@"up"]) {
        return UP;
    }
    else if ([strStatus isEqualToString:@"down"]){
        return DOWN;
    }
    return DOWN;
}

- (NSMutableArray*)getArrComexData{
    return arrComexData;
}

- (NSMutableArray*)getArrLiveRateDetail{
    return arrLiveRateDetail;
}

- (ClsContactDetail*)getContactDetail{
    return objContactDetail;
}

- (NSMutableArray *)getContactArray
{
    NSMutableDictionary *allDict;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"AboutAndContact" ofType:@"plist"];
    allDict = [[NSMutableDictionary alloc]initWithContentsOfFile:path];
    NSMutableArray *contactArray = [[NSMutableArray alloc] initWithArray:[allDict objectForKey:@"contact"]];
    return contactArray;

}

- (NSMutableArray *)getAboutArray
{
    NSMutableDictionary *allDict;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"AboutAndContact" ofType:@"plist"];
    allDict = [[NSMutableDictionary alloc]initWithContentsOfFile:path];
    NSMutableArray *aboutArray = [[NSMutableArray alloc] initWithArray:[allDict objectForKey:@"about"]];
    return aboutArray;

}

@end
