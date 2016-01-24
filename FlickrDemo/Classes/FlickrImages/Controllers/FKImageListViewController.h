//
//  FKImageListViewController.h
//  FlickrDemo
//
//  Created by Hao Zheng on 1/23/16.
//  Copyright © 2016 Planhola.com. All rights reserved.
//

#import "FKBaseViewController.h"

@interface FKImageListViewController : FKBaseViewController

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
//@property (strong, nonatomic) UIRefreshControl *refreshControll;

@property (strong, nonatomic) NSArray *photos;

@end
