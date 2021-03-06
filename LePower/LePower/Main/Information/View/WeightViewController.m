//
//  WeightViewController.m
//  RUNwithu
//
//  Created by mty on 15/9/7.
//  Copyright (c) 2015年 mty. All rights reserved.
//

#import "WeightViewController.h"
#import "EditBtnViewController.h"
#import "Commen.h"
#import "UIColor+Wonderful.h"

@interface WeightViewController ()
{
    EditBtnViewController *editBtnVC;
}

@end

@implementation WeightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lotusRoot];
    [self _createnavigationBar];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeData:) name:@"DataChange" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)changeData:(NSNotification *)notification {
        NSLog(@"%s",__func__);
//    NSLog(@"%@",notification.userInfo);
}

#pragma mark - 创建子视图
- (void)_createnavigationBar {
    
    // 设置返回按钮
    UIButton *itemBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    [itemBtn setTitle:@"体重趋势" forState:UIControlStateNormal];
    
    // 设置字体颜色
    [itemBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [itemBtn addTarget:self action:@selector(itemBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:itemBtn];
    
    // 设置编辑按钮
    UIButton *editBtn = [[UIButton alloc] initWithFrame:CGRectMake(250, 0, 64, 40)];
    [editBtn setImage:[UIImage imageNamed:@"tabbar_compose_background_icon_add@2x"] forState:UIControlStateNormal];
    [editBtn addTarget:self action:@selector(editBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    // 设置删除按钮
    UIButton *deletionBtn = [[UIButton alloc] initWithFrame:CGRectMake(300, 0, 64, 40)];
    [deletionBtn setImage:[UIImage imageNamed:@"tabbar_discover_highlighted@2x"] forState:UIControlStateNormal];
    [deletionBtn addTarget:self action:@selector(deletionBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.navigationBar addSubview:editBtn];
    [self.navigationController.navigationBar addSubview:deletionBtn];

    
    // 体重Label
    _weightLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, kScreenWidth/2-20, 100)];
    _weightLabel.backgroundColor = [UIColor skyBlue];
    _weightLabel.text = @"70.0kg";
    _weightLabel.font = [UIFont systemFontOfSize:30];
    _weightLabel.textAlignment = NSTextAlignmentCenter;
    _weightLabel.textColor = [UIColor silverColor];
    [self.view addSubview:_weightLabel];
   
    //BMI
    _BMILabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/2, 80, kScreenWidth/2-10, 100)];
    _BMILabel.backgroundColor = [UIColor skyBlue];
    _BMILabel.text = @"24.6";
    _BMILabel.font = [UIFont systemFontOfSize:30];
    _BMILabel.textAlignment = NSTextAlignmentCenter;
    _BMILabel.textColor = [UIColor silverColor];
    [self.view addSubview:_BMILabel];
    
}

// 返回按钮 响应方法
- (void)itemBtnAction:(UIButton *)button {

    [self dismissViewControllerAnimated:YES completion:nil];
}

// 编辑按钮 响应方法
- (void)editBtnAction:(UIButton *)button {
    
    editBtnVC = [[EditBtnViewController alloc] init];
    [self.navigationController pushViewController:editBtnVC animated:NO];
    
}

// 删除按钮 响应方法
- (void)deletionBtnAction:(UIButton *)button {

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"确定要删除这条体重" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"确定");
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"取消");
    }];
    [alertController addAction:action];
    [alertController addAction:cancelAction];
    
    [self.navigationController presentViewController:alertController animated:YES completion:nil];
}






















/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
