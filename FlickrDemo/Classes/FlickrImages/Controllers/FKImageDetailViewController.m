//
//  FKImageDetailViewController.m
//  FlickrDemo
//
//  Created by Hao Zheng on 1/23/16.
//  Copyright © 2016 Planhola.com. All rights reserved.
//

#import "FKImageDetailViewController.h"
#import "AlarmAlertView.h"

@interface FKImageDetailViewController ()

@property (nonatomic, strong) UIBarButtonItem *rightButton;

@end

@implementation FKImageDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = self.rightButton;
    self.imageView.image = self.currentImage;
    [self.imageView addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.imageView attribute:NSLayoutAttributeHeight multiplier:self.imageViewRatio constant:0]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Actions

- (void)didClickSave:(id)sender
{
    UIImageWriteToSavedPhotosAlbum(self.currentImage, self, @selector(image:savedInPhotoAlbumWithError:usingContextInfo:), nil);
}

#pragma mark - Helpers

- (void)image:(UIImage *)image
savedInPhotoAlbumWithError:(NSError *)error
usingContextInfo:(void*)ctxInfo
{
    NSString *title;
    if (error) {
        title = NSLocalizedString(@"Image can't be saved.", @"Image can't be saved.");
    } else {
        title = NSLocalizedString(@"Image saved.", @"Image saved.");
    }
    AlarmAlertView *alertView = [[AlarmAlertView alloc] initWithTitle:title message:nil];
    [alertView addActionWithTitle:NSLocalizedString(@"OK", @"OK")];
    [alertView show];
}

#pragma mark - Getters

- (UIBarButtonItem *)rightButton
{
    if (!_rightButton) {
        _rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(didClickSave:)];
    }
    return _rightButton;
}

@end
