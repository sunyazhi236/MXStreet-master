//
//  NoticeVCViewController.h
//  mxj
//
//  Created by HANNY on 16/8/16.
//  Copyright © 2016年 bluemobi. All rights reserved.
//

#import "BaseViewController.h"

@interface NoticeVCViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;//主页面的tableview
@property (strong, nonatomic) IBOutlet UITableViewCell *sixinCell; //私信cell
@property (strong, nonatomic) IBOutlet UITableViewCell *guanzhuCell; //我关注的人发布街拍cell
@property (strong, nonatomic) IBOutlet UITableViewCell *xinfensiCell;//新粉丝cell
@property (strong, nonatomic) IBOutlet UITableViewCell *pinglunCell;//评论cell
@property (strong, nonatomic) IBOutlet UITableViewCell *zanCell;// 赞cell
@property (strong, nonatomic) IBOutlet UITableViewCell *dashangCell;//打赏cell
@property (strong, nonatomic) IBOutlet UITableViewCell *xitongXiiaoxiCell;//系统消息cell

@property (weak, nonatomic) IBOutlet UIButton *sixinBtn;
@property (weak, nonatomic) IBOutlet UIButton *guanzhuBtn;
@property (weak, nonatomic) IBOutlet UIButton *xinfensiBtn;
@property (weak, nonatomic) IBOutlet UIButton *pinglunBtn;
@property (weak, nonatomic) IBOutlet UIButton *zanBtn;
@property (weak, nonatomic) IBOutlet UIButton *dashangBtn;
@property (weak, nonatomic) IBOutlet UIButton *xitongxiaoxiBtn;

@end
