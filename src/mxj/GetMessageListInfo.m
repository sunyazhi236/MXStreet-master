//
//  GetMessageListInfo.m
//  mxj
//
//  Created by 齐乐乐 on 15/11/30.
//  Copyright © 2015年 bluemobi. All rights reserved.
//

#import "GetMessageListInfo.h"

@implementation GetMessageListInfo

//用字典初始化模型实例方法
-(instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end
