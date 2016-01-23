//
//  FKImageListViewController.m
//  FlickrDemo
//
//  Created by Hao Zheng on 1/23/16.
//  Copyright © 2016 Planhola.com. All rights reserved.
//

#import "FKImageListViewController.h"
#import "FlickrKit.h"
#import "FKImage.h"

@interface FKImageListViewController ()

@end

@implementation FKImageListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [self loadURLsFromFlickr];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - private

- (void)loadURLsFromFlickr
{
//    FlickrKit *fk = [FlickrKit sharedFlickrKit];
//    FKFlickrInterestingnessGetList *interesting = [[FKFlickrInterestingnessGetList alloc] init];
//    [fk call:interesting completion:^(NSDictionary *response, NSError *error) {
//        // Note this is not the main thread!
//        if (response) {
//            NSMutableArray *photoURLs = [NSMutableArray array];
//            for (NSDictionary *photoData in [response valueForKeyPath:@"photos.photo"]) {
//                NSURL *url = [fk photoURLForSize:FKPhotoSizeSmall240 fromPhotoDictionary:photoData];
//                [photoURLs addObject:url];
//            }
//            dispatch_async(dispatch_get_main_queue(), ^{
//                // Any GUI related operations here
//            });
//        }   
//    }];
    
    
    [[FlickrKit sharedFlickrKit] call:@"flickr.interestingness.getList"
                                 args:@{@"format": @"rest", @"extras": @"url_m", @"api_key": @"4cba999f343e0eb30035b1eaf37c6076"}
                          maxCacheAge:FKDUMaxAgeOneHour
                           completion:^(NSDictionary *response, NSError *error)
     {
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
                self.photos = photos;
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    // Any GUI related operations here
                    [self.collectionView reloadData];
                });
            } else {
                // show the error
                NSLog(@"xx  %@", error.description);
            }
        });
    }];
}

#pragma mark - Getters

- (NSArray *)photoURLs
{
    if (!_photos) {
        _photos = @[];
    }
    return _photos;
}

@end
