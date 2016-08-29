//
//  NoticeVCViewController.m
//  mxj
//
//  Created by HANNY on 16/8/16.
//  Copyright © 2016年 bluemobi. All rights reserved.
//

#import "NoticeVCViewController.h"

@interface NoticeVCViewController ()

@end

@implementation NoticeVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationController setNavigationBarHidden:NO];
    [self.navigationItem setTitle:@"新消息通知"];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    
//      NSUserDefaults *userdefaultt = [NSUserDefaults standardUserDefaults];
//    if (![[userdefaultt objectForKey:[NSString stringWithFormat:@"%@%@",@"userid",[LoginModel shareInstance].userId]]isEqualToString:[LoginModel shareInstance].userId]) {
//        [userdefaultt setObject:[LoginModel shareInstance].userId forKey:[NSString stringWithFormat:@"%@%@",@"userid",[LoginModel shareInstance].userId]];
//         [userdefaultt synchronize];
//        NSLog(@"++++%@",[LoginModel shareInstance].userId);
//    }
    
    //私信推送按钮
    [self.sixinBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.sixinBtn.tag=1001;
     NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
    if ([[userdefault objectForKey:@"sixinFlag"]isEqualToString:@"guan"]) {
          [self.sixinBtn setBackgroundImage:[UIImage imageNamed:@"off_12"] forState:UIControlStateNormal];
    }else{
   [self.sixinBtn setBackgroundImage:[UIImage imageNamed:@"on_12"] forState:UIControlStateNormal];
    }
    //关注推送按钮
    [self.guanzhuBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.guanzhuBtn.tag=1002;
    NSUserDefaults *userdefault2 = [NSUserDefaults standardUserDefaults];
    if ([[userdefault2 objectForKey:@"guanzhuFlag"]isEqualToString:@"guan"]) {
        [self.guanzhuBtn setBackgroundImage:[UIImage imageNamed:@"off_12"] forState:UIControlStateNormal];
    }else{
        [self.guanzhuBtn setBackgroundImage:[UIImage imageNamed:@"on_12"] forState:UIControlStateNormal];
    }
    //新粉丝推送按钮
    [self.xinfensiBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.xinfensiBtn.tag=1003;
    NSUserDefaults *userdefault3 = [NSUserDefaults standardUserDefaults];
    if ([[userdefault3 objectForKey:@"xinfensiFlag"]isEqualToString:@"guan"]) {
        [self.xinfensiBtn setBackgroundImage:[UIImage imageNamed:@"off_12"] forState:UIControlStateNormal];
    }else{
        [self.xinfensiBtn setBackgroundImage:[UIImage imageNamed:@"on_12"] forState:UIControlStateNormal];
    }
    //评论推送按钮
    [self.pinglunBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.pinglunBtn.tag=1004;
    NSUserDefaults *userdefault4 = [NSUserDefaults standardUserDefaults];
    if ([[userdefault4 objectForKey:@"pinglunFlag"]isEqualToString:@"guan"]) {
        [self.pinglunBtn setBackgroundImage:[UIImage imageNamed:@"off_12"] forState:UIControlStateNormal];
    }else{
        [self.pinglunBtn setBackgroundImage:[UIImage imageNamed:@"on_12"] forState:UIControlStateNormal];
    }
    //赞推送按钮
    [self.zanBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.zanBtn.tag=1005;
    NSUserDefaults *userdefault5 = [NSUserDefaults standardUserDefaults];
    if ([[userdefault5 objectForKey:@"zanFlag"]isEqualToString:@"guan"]) {
        [self.zanBtn setBackgroundImage:[UIImage imageNamed:@"off_12"] forState:UIControlStateNormal];
    }else{
        [self.zanBtn setBackgroundImage:[UIImage imageNamed:@"on_12"] forState:UIControlStateNormal];
    }
    //打赏推送按钮
    [self.dashangBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.dashangBtn.tag=1006;
    NSUserDefaults *userdefault6 = [NSUserDefaults standardUserDefaults];
    if ([[userdefault6 objectForKey:@"dashangFlag"]isEqualToString:@"guan"]) {
        [self.dashangBtn setBackgroundImage:[UIImage imageNamed:@"off_12"] forState:UIControlStateNormal];
    }else{
        [self.dashangBtn setBackgroundImage:[UIImage imageNamed:@"on_12"] forState:UIControlStateNormal];
    }
    //系统消息推送按钮
    [self.xitongxiaoxiBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.xitongxiaoxiBtn.tag=1007;
    NSUserDefaults *userdefault7 = [NSUserDefaults standardUserDefaults];
    if ([[userdefault7 objectForKey:@"xitongxiaoxiFlag"]isEqualToString:@"guan"]) {
        [self.xitongxiaoxiBtn setBackgroundImage:[UIImage imageNamed:@"off_12"] forState:UIControlStateNormal];
    }else{
        [self.xitongxiaoxiBtn setBackgroundImage:[UIImage imageNamed:@"on_12"] forState:UIControlStateNormal];
    }
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}


#pragma mark -按钮点击事件处理
//消息推送按钮点击事件
-(void)BtnClick:(UIButton *)btn{
    if (btn.tag==1001) {
        if ([_sixinBtn.currentBackgroundImage isEqual:[UIImage imageNamed:@"on_12"]]) {
        [self.sixinBtn setBackgroundImage:[UIImage imageNamed:@"off_12"] forState:UIControlStateNormal];
            NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
            [userdefault setObject:@"guan" forKey:@"sixinFlag"];
            [userdefault synchronize];
        }else{
            [self.sixinBtn setBackgroundImage:[UIImage imageNamed:@"on_12"] forState:UIControlStateNormal];
            NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
            [userdefault setObject:@"kai" forKey:@"sixinFlag"];
             [userdefault synchronize];
        }
    }
    if (btn.tag==1002) {
        if ([_guanzhuBtn.currentBackgroundImage isEqual:[UIImage imageNamed:@"on_12"]]) {
            [self.guanzhuBtn setBackgroundImage:[UIImage imageNamed:@"off_12"] forState:UIControlStateNormal];
            NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
            [userdefault setObject:@"guan" forKey:@"guanzhuFlag"];
            [userdefault synchronize];
        }else{
            [self.guanzhuBtn setBackgroundImage:[UIImage imageNamed:@"on_12"] forState:UIControlStateNormal];
            NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
            [userdefault setObject:@"kai" forKey:@"guanzhuFlag"];
            [userdefault synchronize];
        }
    }
    if (btn.tag==1003) {
        if ([_xinfensiBtn.currentBackgroundImage isEqual:[UIImage imageNamed:@"on_12"]]) {
            [self.xinfensiBtn setBackgroundImage:[UIImage imageNamed:@"off_12"] forState:UIControlStateNormal];
            NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
            [userdefault setObject:@"guan" forKey:@"xinfensiFlag"];
            [userdefault synchronize];
        }else{
            [self.xinfensiBtn setBackgroundImage:[UIImage imageNamed:@"on_12"] forState:UIControlStateNormal];
            NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
            [userdefault setObject:@"kai" forKey:@"xinfensiFlag"];
            [userdefault synchronize];
        }
    }
    if (btn.tag==1004) {
        if ([_pinglunBtn.currentBackgroundImage isEqual:[UIImage imageNamed:@"on_12"]]) {
            [self.pinglunBtn setBackgroundImage:[UIImage imageNamed:@"off_12"] forState:UIControlStateNormal];
            NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
            [userdefault setObject:@"guan" forKey:@"pinglunFlag"];
            [userdefault synchronize];
        }else{
            [self.pinglunBtn setBackgroundImage:[UIImage imageNamed:@"on_12"] forState:UIControlStateNormal];
            NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
            [userdefault setObject:@"kai" forKey:@"pinglunFlag"];
            [userdefault synchronize];
        }
    }
    if (btn.tag==1005) {
        if ([_zanBtn.currentBackgroundImage isEqual:[UIImage imageNamed:@"on_12"]]) {
            [self.zanBtn setBackgroundImage:[UIImage imageNamed:@"off_12"] forState:UIControlStateNormal];
            NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
            [userdefault setObject:@"guan" forKey:@"zanFlag"];
            [userdefault synchronize];
        }else{
            [self.zanBtn setBackgroundImage:[UIImage imageNamed:@"on_12"] forState:UIControlStateNormal];
            NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
            [userdefault setObject:@"kai" forKey:@"zanFlag"];
            [userdefault synchronize];
        }
    }
    if (btn.tag==1006) {
        if ([_dashangBtn.currentBackgroundImage isEqual:[UIImage imageNamed:@"on_12"]]) {
            [self.dashangBtn setBackgroundImage:[UIImage imageNamed:@"off_12"] forState:UIControlStateNormal];
            NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
            [userdefault setObject:@"guan" forKey:@"dashangFlag"];
            [userdefault synchronize];
        }else{
            [self.dashangBtn setBackgroundImage:[UIImage imageNamed:@"on_12"] forState:UIControlStateNormal];
            NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
            [userdefault setObject:@"kai" forKey:@"dashangFlag"];
            [userdefault synchronize];
        }
    }
    if (btn.tag==1007) {
        if ([_xitongxiaoxiBtn.currentBackgroundImage isEqual:[UIImage imageNamed:@"on_12"]]) {
            [self.xitongxiaoxiBtn setBackgroundImage:[UIImage imageNamed:@"off_12"] forState:UIControlStateNormal];
            NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
            [userdefault setObject:@"guan" forKey:@"xitongxiaoxiFlag"];
            [userdefault synchronize];
        }else{
            [self.xitongxiaoxiBtn setBackgroundImage:[UIImage imageNamed:@"on_12"] forState:UIControlStateNormal];
            NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
            [userdefault setObject:@"kai" forKey:@"xitongxiaoxiFlag"];
            [userdefault synchronize];
        }
    }

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
