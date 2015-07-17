//
//  FISApplyFilterOperation.h
//  filtered-images
//
//  Created by Yoseob Lee on 7/17/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIImage+Filters.h"

@interface FISApplyFilterOperation : NSOperation

@property (strong, nonatomic) UIImage *nonFilteredImage;
@property (nonatomic) UIImageFilterType filter;
@property (nonatomic, copy) void (^block)(UIImage *nonFilteredImage);

- (instancetype)initWithImage:(UIImage *)image filter:(UIImageFilterType)filter;

@end
