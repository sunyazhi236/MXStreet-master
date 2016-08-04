//
//  CustomLabelViewController.h
//  mxj
//  P7-2-3自定义标签
//  Created by 齐乐乐 on 15/11/18.
//  Copyright © 2015年 bluemobi. All rights reserved.
//

#import "BaseViewController.h"

@interface CustomLabelViewController : BaseViewController<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITableView *customLabelTableView;  //标签检索结果TableView
@property (strong, nonatomic) IBOutlet UITextField *customLabelTextFiled;  //检索输入TextField
@property (strong, nonatomic) UIViewController *preViewCtrl;               //先前的ViewCtrl

@end
