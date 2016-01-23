//
//  FKImage.h
//  FlickrDemo
//
//  Created by Hao Zheng on 1/23/16.
//  Copyright © 2016 Planhola.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKImage : NSObject

@property (nonatomic, assign) CGSize size;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSURL *url;

- (instancetype)initWithSize:(CGSize)size
                       title:(NSString *)title
                         url:(NSURL *)url;

@end
