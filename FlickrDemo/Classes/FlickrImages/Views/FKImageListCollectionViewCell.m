//
//  FKImageListCollectionViewCell.m
//  FlickrDemo
//
//  Created by Hao Zheng on 1/23/16.
//  Copyright © 2016 Planhola.com. All rights reserved.
//

#import "FKImageListCollectionViewCell.h"

@implementation FKImageListCollectionViewCell

- (void)prepareForReuse
{
    self.imageView.image = nil;
}

@end
