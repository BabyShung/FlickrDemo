//
//  FKImageDetailViewController.h
//  FlickrDemo
//
//  Created by Hao Zheng on 1/23/16.
//  Copyright © 2016 Planhola.com. All rights reserved.
//

#import "FKBaseViewController.h"

@interface FKImageDetailViewController : FKBaseViewController

@property (assign, nonatomic) CGFloat imageViewRatio;
@property (strong, nonatomic) UIImage *currentImage;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
