//
//  NoticeVCViewController.m
//  mxj
//
//  Created by HANNY on 16/8/16.
//  Copyright © 2016年 bluemobi. All rights reserved.
//

#import "NoticeVCViewController.h"

@interface NoticeVCViewController ()
{
    NSString *sixinFlag; //消息推送开关标记
}
@end

@implementation NoticeVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationController setNavigationBarHidden:NO];
    [self.navigationItem setTitle:@"通知"];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    
    [self.sixinBtn addTarget:self action:@selector(sixinBtnClick) forControlEvents:UIControlEventTouchUpInside];
    sixinFlag = [LoginModel shareInstance].pushMessage;
    //调整推送按钮的状态
    if ([sixinFlag isEqualToString:@"1"]) {
        [self.sixinBtn setBackgroundImage:[UIImage imageNamed:@"on_12"] forState:UIControlStateNormal];
    } else if([sixinFlag isEqualToString:@"0"]) {
        [self.sixinBtn setBackgroundImage:[UIImage imageNamed:@"off_12"] forState:UIControlStateNormal];
    }
}

#pragma mark -按钮点击事件处理
//消息推送按钮点击事件
-(void)sixinBtnClick{
    if ([sixinFlag isEqualToString:@"1"]) {
        sixinFlag = @"0";
        [self.sixinBtn setBackgroundImage:[UIImage imageNamed:@"off_12"] forState:UIControlStateNormal];
    } else if([sixinFlag isEqualToString:@"0"]) {
        sixinFlag = @"1";
        [self.sixinBtn setBackgroundImage:[UIImage imageNamed:@"on_12"] forState:UIControlStateNormal];
    }
    
    //调用接口更新数据
    [ModifyUserDataInput shareInstance].userId = [LoginModel shareInstance].userId;
    [ModifyUserDataInput shareInstance].pushMessage = sixinFlag;
    [ModifyUserDataInput shareInstance].userSignFlag = @"0";
    [ModifyUserDataInput shareInstance].storeFlag = @"0";
    NSMutableDictionary *dict = [CustomUtil modelToDictionary:[ModifyUserDataInput shareInstance]];
    [[NetInterface shareInstance] modifyUserData:@"modifyUserData" param:dict successBlock:^(NSDictionary *responseDict) {
        ModifyUserData *returnData = [ModifyUserData modelWithDict:responseDict];
        if (RETURN_SUCCESS(returnData.status)) {
            [LoginModel shareInstance].pushMessage = sixinFlag;
        } else {
            [CustomUtil showToastWithText:returnData.msg view:kWindow];
        }
    } failedBlock:^(NSError *err) {
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -TableView代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7; //10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 54;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            return self.sixinCell;
        }
            break;
        case 1:{
            return self.guanzhuCell;
        }
            break;
        case 2:{
            return self.xinfensiCell;
        }
            break;
        case 3:{
            return self.pinglunCell;
        }
            break;
        case 4:{
            return self.zanCell;
        }
            break;
        case 5:{
            return self.dashangCell;
        }
            break;
        case 6:{
            return self.xitongXiiaoxiCell;
        }
            break;

        default:
            break;
    }
    return [[UITableViewCell alloc] init];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel * headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    headerLabel.backgroundColor = [UIColor colorWithRed:240/255.0f green:240/255.0f blue:240/255.0f alpha:1.0f];
    headerLabel.opaque = NO;
    headerLabel.textColor = [UIColor lightGrayColor];
    headerLabel.text=@"  开启以下消息的通知";
    return headerLabel;
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
