//
//  InformationViewController.h
//  RUNwithu
//
//  Created by mty on 15/8/20.
//  Copyright (c) 2015年 mty. All rights reserved.
//

#import "BaseViewController.h"

@interface InformationViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

{
    UICollectionView *_collectionView;
}


@end
