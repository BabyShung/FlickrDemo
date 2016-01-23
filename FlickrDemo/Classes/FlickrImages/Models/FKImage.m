//
//  FKImage.m
//  FlickrDemo
//
//  Created by Hao Zheng on 1/23/16.
//  Copyright © 2016 Planhola.com. All rights reserved.
//

#import "FKImage.h"

@implementation FKImage

- (instancetype)initWithSize:(CGSize)size
                       title:(NSString *)title
                         url:(NSURL *)url
{
    if (self = [super init]) {
        self.size = size;
        self.title = title;
        self.url = url;
    }
    return self;
}

@end
