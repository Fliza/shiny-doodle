//
//  MoreViewController.m
//  RUNwithu
//
//  Created by mty on 15/8/20.
//  Copyright (c) 2015年 mty. All rights reserved.
//

#import "MoreViewController.h"
#import "UIColor+Wonderful.h"
#import "Commen.h"
#import "UIViewExt.h"
#import "UserCell.h"
#import "SetViewController.h"


@interface MoreViewController ()

@end

@implementation MoreViewController{

    
    UIImageView *_headerImageView;
    UIImageView *_iconImageView;
    UILabel *_userNameLabel;
    UILabel *_heightLabel;
    UILabel *_weightLabel;
    UILabel *_BMILabel;
    UILabel *_targetLabel;
    UILabel *_heightDataLabel;
    UILabel *_weightDataLabel;
    UILabel *_BMIDataLabel;
    UILabel *_targetDataLabel;
    UIButton *_setButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _createHeaderView];
    [self _createLabel];
    [self _createDataLabel];
    [self _createCollectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}




#pragma mark - 创建子视图
- (void)_createHeaderView{
    _headerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, -320, kScreenWidth, kScreenHeight)];
    //自适应宽高比
    _headerImageView.contentMode = UIViewContentModeScaleAspectFit;
    [_headerImageView setImage:[UIImage imageNamed:@"headImage.jpg"]];
    [self.view addSubview:_headerImageView];
    
    _setButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 30, 30, 30)];
    [_setButton addTarget:self action:@selector(setBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [_setButton setImage:[UIImage imageNamed:@"set.png"] forState:UIControlStateNormal];
    [self.view addSubview:_setButton];
    
    _userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/2-30, 30, 60, 30)];
    _userNameLabel.text = @"用户id";
    _userNameLabel.highlighted = YES;
    _userNameLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:_userNameLabel];
    
    _iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth/2-40, 70, 80, 80)];
    _iconImageView.image = [UIImage imageNamed:@"iconImage.jpg"];
    _iconImageView.layer.cornerRadius = 40;
    _iconImageView.layer.borderWidth = 1;
    _iconImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    _iconImageView.layer.masksToBounds = YES;
    
    //_headerImageView.bottom = _collectionView.top;
    [self.view addSubview:_iconImageView];
}

- (void)_createLabel{
    _heightLabel = [[UILabel alloc]initWithFrame:CGRectMake(15,160,80,20)];
    _heightLabel.text = @"身高";
    _heightLabel.textAlignment = NSTextAlignmentCenter;
    _heightLabel.font = [UIFont systemFontOfSize:15];
    _heightLabel.textColor = [UIColor blackColor];
    [self.view addSubview:_heightLabel];
    _heightLabel = [[UILabel alloc]initWithFrame:CGRectMake(110,160,80,20)];
    _heightLabel.text = @"体重";
    _heightLabel.textAlignment = NSTextAlignmentCenter;
    _heightLabel.font = [UIFont systemFontOfSize:15];
    _heightLabel.textColor = [UIColor blackColor];
    [self.view addSubview:_heightLabel];
    
    _heightLabel = [[UILabel alloc]initWithFrame:CGRectMake(200,160,80,20)];
    _heightLabel.text = @"BMI";
    _heightLabel.textAlignment = NSTextAlignmentCenter;
    _heightLabel.font = [UIFont systemFontOfSize:15];
    _heightLabel.textColor = [UIColor blackColor];
    [self.view addSubview:_heightLabel];
    
    _heightLabel = [[UILabel alloc]initWithFrame:CGRectMake(295,160,80,20)];
    _heightLabel.text = @"目标";
    _heightLabel.textAlignment = NSTextAlignmentCenter;
    _heightLabel.font = [UIFont systemFontOfSize:15];
    _heightLabel.textColor = [UIColor blackColor];
    [self.view addSubview:_heightLabel];
    
}
- (void)_createDataLabel{
    _heightDataLabel = [[UILabel alloc]initWithFrame:CGRectMake(15,175,80,20)];
    _heightDataLabel.text = @"175cm";
    _heightDataLabel.textAlignment = NSTextAlignmentCenter;
    _heightDataLabel.font = [UIFont systemFontOfSize:15];
    _heightDataLabel.textColor = [UIColor blackColor];
    [self.view addSubview:_heightDataLabel];
    _heightDataLabel = [[UILabel alloc]initWithFrame:CGRectMake(110,175,80,20)];
    _heightDataLabel.text = @"72kg";
    _heightDataLabel.textAlignment = NSTextAlignmentCenter;
    _heightDataLabel.font = [UIFont systemFontOfSize:15];
    _heightDataLabel.textColor = [UIColor blackColor];
    [self.view addSubview:_heightDataLabel];
    
    _heightDataLabel = [[UILabel alloc]initWithFrame:CGRectMake(200,175,80,20)];
    _heightDataLabel.text = @"23.5";
    _heightDataLabel.textAlignment = NSTextAlignmentCenter;
    _heightDataLabel.font = [UIFont systemFontOfSize:15];
    _heightDataLabel.textColor = [UIColor blackColor];
    [self.view addSubview:_heightDataLabel];
    
    _heightDataLabel = [[UILabel alloc]initWithFrame:CGRectMake(295,175,80,20)];
    _heightDataLabel.text = @"10000步";
    _heightDataLabel.textAlignment = NSTextAlignmentCenter;
    _heightDataLabel.font = [UIFont systemFontOfSize:15];
    _heightDataLabel.textColor = [UIColor blackColor];
    [self.view addSubview:_heightDataLabel];
    
}

- (void)_createCollectionView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(kScreenWidth/2-10, kScreenWidth/2-10);
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 200, kScreenWidth, kScreenHeight) collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor clearColor];
    
    //    [_collectionView registerClass:[UserCell class] forCellWithReuseIdentifier:@"cell"];
    [_collectionView registerNib:[UINib nibWithNibName:@"UserCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
    [self.view addSubview:_collectionView];
}

#pragma mark - CollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UserCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    NSString *imageToLoad = [NSString stringWithFormat:@"%ld",indexPath.row+1];
    //    cell.viewImage.image = [UIImage imageNamed:imageToLoad];
    [cell.viewImage setImage:[UIImage imageNamed:imageToLoad]];
    cell.backgroundColor = [UIColor redColor];
    cell.target.text = [NSString stringWithFormat:@"kkkk"];
    return cell;
}

// 设置按钮响应方法
- (void)setBtnAction:(UIButton *)button {
    SetViewController *vc = [[SetViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:NO completion:nil];
}




@end
