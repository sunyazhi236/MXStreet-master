//
//  TKQQLogin.m
//  mxj
//
//  Created by 齐乐乐 on 15/12/14.
//  Copyright © 2015年 bluemobi. All rights reserved.
//

#import "TKQQLogin.h"

@implementation TKQQLogin

+ (instancetype)shareInstance
{
    static TKQQLogin *shareInstance = nil;
    
    @synchronized(self) {
        if (!shareInstance) {
            shareInstance = [[self alloc] init];
        }
        return shareInstance;
    }
}

@end
