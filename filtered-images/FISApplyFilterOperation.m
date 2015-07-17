//
//  FISApplyFilterOperation.m
//  filtered-images
//
//  Created by Yoseob Lee on 7/17/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import "FISApplyFilterOperation.h"

@implementation FISApplyFilterOperation

- (instancetype)initWithImage:(UIImage *)image filter:(UIImageFilterType)filter
{
    self = [super init];
    
    if (self)
    {
        _nonFilteredImage = image;
        _filter = filter;
    }
    return self;
}

- (void)main
{
    UIImage *filtered = [self.nonFilteredImage imageWithFilter:self.filter];
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        if (self.block)
        {
            self.block(filtered);
        }
    }];
}

@end
