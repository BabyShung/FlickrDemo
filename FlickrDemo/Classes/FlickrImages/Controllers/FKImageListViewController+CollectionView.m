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

#define CELL_SPACING 10.f

@implementation FKImageListViewController (CollectionView)

- (void)setupFlowLayout
{
    FKImageListFlowLayout *layout = self.collectionView.collectionViewLayout;
    
}

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

#pragma mark - FlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FKImage *image = self.photos[indexPath.row];
    return image.size;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsZero;
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
    return 2;
}

@end
