//
//  SetViewController.m
//  RUNwithu
//
//  Created by 揽揽揽 on 15/9/8.
//  Copyright (c) 2015年 mty. All rights reserved.
//

#import "SetViewController.h"
#import "MoreTableViewCell.h"

static NSString *moreCellId = @"moreCellId";

@interface SetViewController ()

@end

@implementation SetViewController{
    UITableView *_tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _createTableView];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    [self.navigationItem.leftBarButtonItem setTintColor:[UIColor orangeColor]];
}
- (void)backAction{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)_createTableView{
    _tableView = [[ UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:0.5];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview: _tableView];
    [_tableView registerClass:[MoreTableViewCell class] forCellReuseIdentifier:moreCellId];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 8;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0 || section == 7) {
        return 1;
    }else if (section == 6){
        return 3;
    }
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:moreCellId forIndexPath:indexPath];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    
    if (indexPath.section == 0) {
        cell.textLabel.text = @"乐动力ID:32573759";
    }
    
    if (indexPath.section == 1){
        if (indexPath.row == 0) {
            cell.textLabel.text = @"修改资料";
        }else if (indexPath.row == 1){
            cell.textLabel.text = @"修改目标";
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"立即备份";
        }else if(indexPath.row == 1){
            cell.textLabel.text = @"提交成绩";
        }
    }
    
    if (indexPath.section == 3) {
        if (indexPath.row == 0) {
        cell.textLabel.text = @"打开乐动力";
            UISwitch *switch1 = [[UISwitch alloc]initWithFrame:CGRectZero];
            cell.accessoryView = switch1;
        }else if(indexPath.row == 1){
            cell.textLabel.text = @"省电模式";
            UISwitch *switch1 = [[UISwitch alloc]initWithFrame:CGRectZero];
            cell.accessoryView = switch1;
        }
    }
    
    if (indexPath.section == 4) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"锻炼成绩通知";
            UISwitch *switch1 = [[UISwitch alloc]initWithFrame:CGRectZero];
            cell.accessoryView = switch1;
        }else if(indexPath.row == 1){
            cell.textLabel.text = @"每日通知时间: 21:00";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    
    if (indexPath.section == 5) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"关联QQ健康";
            UISwitch *switch1 = [[UISwitch alloc]initWithFrame:CGRectZero];
            cell.accessoryView = switch1;
        }else if(indexPath.row == 1){
            cell.textLabel.text = @"微信排行榜";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    
    if (indexPath.section == 6) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"意见反馈";
        }else if(indexPath.row == 1){
            cell.textLabel.text = @"去评分";
        }else if(indexPath.row == 2){
            cell.textLabel.text = @"常见问题";
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    if (indexPath.section == 7) {
        cell.textLabel.text = @"退出登录";
//        cell.backgroundColor = [UIColor orangeColor];
//        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
    
}


@end
