//
//  FKImageListFlowLayout.h
//  FlickrDemo
//
//  Created by Hao Zheng on 1/23/16.
//  Copyright © 2016 Planhola.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FKImageListFlowLayoutDelegate <UICollectionViewDelegateFlowLayout>

@optional

- (NSInteger)collectionView:(UICollectionView *)collectionView
                     layout:(UICollectionViewLayout *)collectionViewLayout
      columnCountForSection:(NSInteger)section;
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
 heightForHeaderInSection:(NSInteger)section;
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
 heightForFooterInSection:(NSInteger)section;

@end

@interface FKImageListFlowLayout : UICollectionViewFlowLayout

@property (nonatomic, assign) NSInteger columnCount; // default 2
@property (nonatomic, assign) CGFloat headerHeight; // default 0
@property (nonatomic, assign) CGFloat footerHeight; // default 0

@end