//
//  GetFollowListInput.m
//  mxj
//
//  Created by 齐乐乐 on 15/11/29.
//  Copyright © 2015年 bluemobi. All rights reserved.
//

#import "GetFollowListInput.h"

@implementation GetFollowListInput

+(instancetype)shareInstance
{
    static id shareInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        shareInstance = [[self alloc] initWithNull];
    });
    
    return shareInstance;
}

@end
