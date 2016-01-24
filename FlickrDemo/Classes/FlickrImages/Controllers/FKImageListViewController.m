//
//  FKImageListViewController.m
//  FlickrDemo
//
//  Created by Hao Zheng on 1/23/16.
//  Copyright © 2016 Planhola.com. All rights reserved.
//

#import "FKImageListViewController.h"
#import "FKImageListViewController+FlickrApis.h"

@interface FKImageListViewController ()


@end

@implementation FKImageListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadURLsFromFlickr];
    
    [self setupDefaults];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - private

- (void)setupDefaults
{
    self.title = NSLocalizedString(@"FlickrDemo", @"FlickrDemo");
//    [self.collectionView addSubview:self.refreshControll];
}

- (void)refresh
{
    [self loadURLsFromFlickr];
}

#pragma mark - Getters

- (NSArray *)photoURLs
{
    if (!_photos) {
        _photos = @[];
    }
    return _photos;
}

//- (UIRefreshControl *)refreshControll
//{
//    if (!_refreshControll) {
//        _refreshControll = [[UIRefreshControl alloc] init];
//        [_refreshControll addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
//    }
//    return _refreshControll;
//}

@end
