//
//  GetBlacklistInput.h
//  mxj
//  查询黑名单
//  Created by 齐乐乐 on 15/11/30.
//  Copyright © 2015年 bluemobi. All rights reserved.
//

#import "BaseInput.h"

@interface GetBlacklistInput : BaseInput

@property(nonatomic, copy) NSString *pagesize; //每页行数
@property(nonatomic, copy) NSString *current;  //页号
@property(nonatomic, copy) NSString *userId;   //用户Id

+(instancetype)shareInstance;

@end
