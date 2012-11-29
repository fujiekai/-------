//
//  ViewController.h
//  万网（符捷凯）
//
//  Created by Jiek on 12-11-29.
//  Copyright (c) 2012年 Jiek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property (retain, nonatomic) IBOutlet UILabel *englishLabel;//英文提示
@property (retain, nonatomic) IBOutlet UILabel *chineseLabel;//中文提示
@property (retain, nonatomic) IBOutlet UIButton *englishButton;//英文按钮
@property (retain, nonatomic) IBOutlet UIButton *chineseButton;//中文按钮
@property (retain, nonatomic) IBOutlet UITextField *searchView;//搜索输入框
@property (retain, nonatomic) IBOutlet UILabel *multiORsingle;//多个或者单个域名选择按钮提示Label
@property (retain, nonatomic) IBOutlet UITableView *pointTableView;//显示所有匹配的后缀
@property (nonatomic, retain) NSArray *array;//所有后缀


- (IBAction)chineseButtonEvent:(id)sender;
- (IBAction)BackButtonEvent:(id)sender;
- (IBAction)searchButtonEvent:(id)sender;
- (IBAction)englishButtonEvent:(id)sender;
- (IBAction)realmNameButtonEvent:(id)sender;

@end
