//
//  DeleteCommentInput.m
//  mxj
//
//  Created by 齐乐乐 on 15/12/11.
//  Copyright © 2015年 bluemobi. All rights reserved.
//

#import "DeleteCommentInput.h"

@implementation DeleteCommentInput

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
