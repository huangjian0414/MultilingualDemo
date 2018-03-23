//
//  MineViewController.m
//  多语言切换demo
//
//  Created by 黄坚 on 2018/3/19.
//  Copyright © 2018年 黄坚. All rights reserved.
//

#import "MineViewController.h"
#import "LanguageViewController.h"
@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title=languageStr(@"title_mine");
    [self setTabbleView];
}
-(void)changeLanguage
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        LanguageViewController *vc=[[LanguageViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    });
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"haha"];
    cell.textLabel.text=languageStr(@"language_mine");
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    LanguageViewController *vc=[[LanguageViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)setTabbleView
{
    UITableView *tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, Width, Height) style:UITableViewStyleGrouped];
    tableView.delegate=self;
    tableView.dataSource=self;
    tableView.scrollEnabled=NO;
    tableView.backgroundColor=[UIColor whiteColor];
    tableView.sectionFooterHeight=0;
    tableView.tableHeaderView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, Width, CGFLOAT_MIN)];
    [self.view addSubview:tableView];
    tableView.sectionFooterHeight=0;
}

@end
