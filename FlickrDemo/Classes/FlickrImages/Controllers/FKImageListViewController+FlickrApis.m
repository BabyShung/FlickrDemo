//
//  FKImageListViewController+FlickrApis.m
//  FlickrDemo
//
//  Created by Hao Zheng on 1/23/16.
//  Copyright © 2016 Planhola.com. All rights reserved.
//

#import "FKImageListViewController+FlickrApis.h"
#import "FlickrKit.h"
#import "FKImage.h"
#import "AlarmAlertView.h"

@implementation FKImageListViewController (FlickrApis)

- (void)loadURLsFromFlickr
{
    FlickrKit *singleton = [FlickrKit sharedFlickrKit];
    [singleton call:@"flickr.interestingness.getList"
                                 args:@{
                                        @"format": @"rest",
                                        @"extras": @"url_m",
                                        @"api_key": singleton.apiKey
                                        }
                          maxCacheAge:FKDUMaxAgeOneHour
                           completion:^(NSDictionary *response, NSError *error)
     {
         __weak FKImageListViewController *weakSelf = self;
         
         dispatch_async(dispatch_get_main_queue(), ^{
             if (response) {
                 NSMutableArray *photos = [NSMutableArray array];
                 for (NSDictionary *photoData in [response valueForKeyPath:@"photos.photo"]) {
                     NSString *title = [photoData valueForKey:@"title"];
                     CGFloat width = [[photoData valueForKey:@"width_m"] floatValue];
                     CGFloat height = [[photoData valueForKey:@"height_m"] floatValue];
                     NSURL *url = [NSURL URLWithString:[photoData valueForKey:@"url_m"]];
                     FKImage *image = [[FKImage alloc] initWithSize:CGSizeMake(width, height)
                                                              title:title url:url];
                     [photos addObject:image];
                 }
                 weakSelf.photos = photos;
             }
             
             //Update UI on main thread
             dispatch_async(dispatch_get_main_queue(), ^{
                 
//                 //Refresh
//                 if ([weakSelf.refreshControll isRefreshing]) {
//                     [weakSelf.refreshControll endRefreshing];
//                 }
                 
                 if (response) {
                     [weakSelf.collectionView reloadData];
                 } else {
                     AlarmAlertView *alertView = [[AlarmAlertView alloc] initWithTitle:NSLocalizedString(@"Sorry", @"Sorry") message:error.description];
                     [alertView addActionWithTitle:NSLocalizedString(@"OK", @"OK")];
                     [alertView show];
                 }
             });
         });
     }];
}

@end
