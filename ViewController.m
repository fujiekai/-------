//
//  ViewController.m
//  万网（符捷凯）
//
//  Created by Jiek on 12-11-29.
//  Copyright (c) 2012年 Jiek. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize array = _array;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom 
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _array = [[NSArray alloc] initWithObjects:@".com",@".cn",@".mobi",@".co",@".net",@".com.cn",@".net.cn",@".so",@".org",@".gov.cn",@".org.cn",@".tel",@".tv",@".biz",@".cc",@".hk",@".name",@".info",@".asia",@".me", nil];
    self.pointTableView.hidden = YES;
    
    self.englishButton.selected = YES;
    self.chineseLabel.textColor = [UIColor lightGrayColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)chineseButtonEvent:(id)sender {
}

- (IBAction)BackButtonEvent:(id)sender {
}

- (IBAction)searchButtonEvent:(id)sender {
}

- (IBAction)englishButtonEvent:(id)sender {
}

- (IBAction)realmNameButtonEvent:(id)sender {
}

#pragma mark TableView Delegate Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *strCell = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strCell];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strCell]autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    NSRange range = [self.searchView.text rangeOfString:@"."];
    NSLog(@"%d",range.location);
    NSString *textStr = nil;
    if (range.location != NSNotFound) {
        textStr = [self.searchView.text substringToIndex:range.location];
    } else {
        textStr = self.searchView.text;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@%@",textStr,[self.array objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark TextField Delegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"%d,%d",range.location,range.length	);
    if (range.location == 0&&range.length == 1) {
        self.pointTableView.hidden = YES;
        
    } else {
        self.pointTableView.hidden = NO;
        [self.pointTableView reloadData];
    }
    return YES;
}

#pragma mark 内存释放
- (void)dealloc {
    [_multiORsingle release];
    [_searchView release];
    [_englishLabel release];
    [_chineseLabel release];
    [_englishButton release];
    [_chineseButton release];
    [_pointTableView release];
    [_array release];
    [super dealloc];
}
@end
