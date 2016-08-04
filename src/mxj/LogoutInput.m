//
//  LogoutInput.m
//  mxj
//
//  Created by 齐乐乐 on 16/1/8.
//  Copyright © 2016年 bluemobi. All rights reserved.
//

#import "LogoutInput.h"

@implementation LogoutInput

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
