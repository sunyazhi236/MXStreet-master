//
//  ImageWaterView.m
//  hlrenTest
//
//  Created by blue on 13-4-23.
//  Copyright (c) 2013年 blue. All rights reserved.
//

#import "ImageWaterView.h"

@implementation ImageWaterView
@synthesize arrayImage;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithHexString:@"#f2f3f3"];
    }
    return self;
}

-(id)initWithDataArray:(NSArray*)array withFrame:(CGRect)rect intoFlag:(int)intoFlag
{
    self = [super initWithFrame:rect];
    
    if (self) {
        self.backgroundColor = [UIColor colorWithHexString:@"#f2f3f3"];
        self.arrayImage = array;
        //初始化参数
        [self initParameter:intoFlag];
        
    }
    return self;
}

-(void)initParameter:(int)intoFlag
{
    //每一列的视图初始化
    firstView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 0)];
    secondView = [[UIView alloc] initWithFrame:CGRectMake(WIDTH, 0, WIDTH, 0)];
    _firstView = firstView;
    _secondView = secondView;
    higher = row = highValue = lower = 1;
    countImage = 0;
    
    for (int i = 0; i<self.arrayImage.count; i++) {
        if ((i/CELL_COUNT>0) && (i%CELL_COUNT==0)) {
            row++;
        }
        ImageInfo *data = (ImageInfo*)[self.arrayImage objectAtIndexCheck:i];
        countImage ++;
        //添加视图
        [self addViews:data with:countImage intoFlag:intoFlag];
        //重新设置最高和最低view
        [self setHigherAndLower];
    }
    
    [self setContentSize:CGSizeMake(WIDTH, highValue)];
    [self addSubview:firstView];
    [self addSubview:secondView];
}

-(void)addViews:(ImageInfo *)image with:(int)a intoFlag:(int)intoFlag
{
    //要添加到列上的图片对象
    SelfImageVIew *imageView = nil;
    //图片的高度
    float imageHeight = 0;
    //创建每列的视图填充的内容
    /*
     1、创建自定义的图片对象
     2、记住该图片的高度
     3、重新定义每列的大小，就是高度
     4、把该图片加到每列上。
     */
    //在最低的那一列添加图片
    switch (lower) {
        case 1:
            imageView = [[SelfImageVIew alloc] initWithImageInfo:image y:firstView.frame.size.height+SPACE/2 withA:a intoFlag:intoFlag];
            imageHeight = imageView.frame.size.height;
            firstView.frame = CGRectMake(firstView.frame.origin.x, firstView.frame.origin.y, WIDTH, firstView.frame.size.height + imageHeight + SPACE/2);
            [firstView addSubview:imageView];
            break;
        case 2:
            imageView = [[SelfImageVIew alloc] initWithImageInfo:image y:secondView.frame.size.height+SPACE/2 withA:a intoFlag:intoFlag];
            imageHeight = imageView.frame.size.height;
            secondView.frame = CGRectMake(secondView.frame.origin.x, secondView.frame.origin.y, WIDTH, secondView.frame.size.height + imageHeight + SPACE/2);
            [secondView addSubview:imageView];
            break;
        default:
            break;
    }
    imageView.delegate = self;
}

-(void)setHigherAndLower
{
    float firstHeight = firstView.frame.size.height;
    float secondHeight = secondView.frame.size.height;
    //比较哪一列是最高的那列，并记录最高的值highValue和最高的列higher
    if (firstHeight > highValue) {
        highValue = firstHeight;
        higher = 1;
    }else if (secondHeight > highValue){
        highValue = secondHeight;
        higher = 2;
    }
    //找到最低列
    if (firstHeight <= secondHeight) {
        lower = 1;
    }else{
        lower = 2;
    }
}

-(void)clickImage:(ImageInfo *)data
{
    [_imageViewClickDelegate imageViewClick:data];
}

- (void)doubleClickImage:(ImageInfo *)data
{
    if ([_imageViewClickDelegate respondsToSelector:@selector(imageViewDoubleClick:)]) {
        [_imageViewClickDelegate imageViewDoubleClick:data];
    }
}


//刷新瀑布流
-(void)refreshView:(NSArray*)array intoFlag:(int)intoFlag
{
    [firstView removeFromSuperview];
    [secondView removeFromSuperview];
    firstView = nil;
    secondView = nil;
    self.arrayImage = array;
    [self initParameter:intoFlag];
}

//加载下一页瀑布流
-(void)loadNextPage:(NSArray*)array intoFlag:(int)intoFlag
{
    for (int i=0; i<array.count; i++) {
        //0%3=0,0-2除3也不可能大于0
        if ((i/CELL_COUNT>0) && (i%CELL_COUNT==0)) {
            row++;
        }
        ImageInfo *data = (ImageInfo*)[array objectAtIndexCheck:i];
        countImage++;
        //添加视图
        [self addViews:data with:countImage intoFlag:intoFlag];
        //重新设置最高和最低view
        [self setHigherAndLower];
    }
    [self setContentSize:CGSizeMake(WIDTH, highValue)];
}
@end