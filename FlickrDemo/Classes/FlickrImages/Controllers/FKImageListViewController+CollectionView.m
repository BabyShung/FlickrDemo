//
//  FKImageListViewController+CollectionView.m
//  FlickrDemo
//
//  Created by Hao Zheng on 1/23/16.
//  Copyright © 2016 Planhola.com. All rights reserved.
//

#import "FKImageListViewController+CollectionView.h"
#import "FKImageListCollectionViewCell.h"
#import "FKImageListFlowLayout.h"
#import "UIKit+AFNetworking.h"
#import "FKImage.h"
#import "FKImageDetailViewController.h"

#define CELL_SPACING 10.f

@implementation FKImageListViewController (CollectionView)

#pragma mark - Delegates

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"FKImageListCollectionViewCell";
    FKImageListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    FKImage *image = self.photos[indexPath.row];
    [cell.imageView setImageWithURL:image.url];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.photos.count;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    FKImageListCollectionViewCell *cell = (FKImageListCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    FKImage *image = self.photos[indexPath.row];
    NSLog(@"image.size.width:  %f",image.size.width);
    NSLog(@"image.size.height:  %f",image.size.height);
    CGFloat ratio = image.size.width / image.size.height;
    NSLog(@"ratio:  %f",ratio);
    FKImageDetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"FKImageDetailViewController"];
    detailVC.imageViewRatio = ratio;
    detailVC.currentImage = cell.imageView.image;
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark - FlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FKImage *image = self.photos[indexPath.row];
    return image.size;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(CELL_SPACING, CELL_SPACING, CELL_SPACING, CELL_SPACING);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return CELL_SPACING;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return CELL_SPACING;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout columnCountForSection:(NSInteger)section
{
    return UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation) ? 2 : 1;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
 heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
 heightForFooterInSection:(NSInteger)section
{
    return 0;
}

@end
