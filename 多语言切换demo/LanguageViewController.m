//
//  LanguageViewController.m
//  多语言切换demo
//
//  Created by 黄坚 on 2018/3/19.
//  Copyright © 2018年 黄坚. All rights reserved.
//

#import "LanguageViewController.h"

@interface LanguageViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,weak)UITableView *tableView;
@property (nonatomic,strong)NSArray *languageArray;
@property (nonatomic,strong)NSIndexPath *indexPath;
@end

@implementation LanguageViewController
-(NSArray *)languageArray
{
    if (!_languageArray) {
        _languageArray=@[@"简体中文",@"English"];
    }
    return _languageArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(confirm)];
    [self setDefaultLanguage];
    [self setTableView];
}
-(void)setDefaultLanguage
{
    // 假装只有两种语言·=-= ·
    if([[LocalizationManager userLanguage] isEqualToString:@"en"])
    {
        self.indexPath=[NSIndexPath indexPathForRow:1 inSection:0];
    }
    else
    {
        self.indexPath=[NSIndexPath indexPathForRow:0 inSection:0];
    }
}
-(void)confirm
{
    if (self.indexPath.row==0) {
        [LocalizationManager setUserlanguage:@"zh-Hans"];
    }else if (self.indexPath.row==1)
    {
        [LocalizationManager setUserlanguage:@"en"];
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.languageArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"languageCell"];
    cell.textLabel.text=self.languageArray[indexPath.row];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    if (indexPath.row==self.indexPath.row) {
        cell.accessoryView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"选中"]];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.indexPath=indexPath;
    [self.tableView reloadData];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}
-(void)setTableView
{
    UITableView *tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, Width, Height) style:UITableViewStyleGrouped];
    tableView.delegate=self;
    tableView.dataSource=self;
    tableView.scrollEnabled=NO;
    tableView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:tableView];
    tableView.sectionFooterHeight=0;
    tableView.tableHeaderView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, Width, CGFLOAT_MIN)];
    self.tableView=tableView;
}
@end
