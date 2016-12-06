//
//  TabBar.m
//  GengMei
//
//  Created by 冰凉的枷锁 on 2016/12/6.
//  Copyright © 2016年 liuaoxiang. All rights reserved.
//

#import "RootTabBarController.h"
#import "MainViewController.h"
#import "FaxianViewController.h"
#import "MeigouViewController.h"
#import "MineViewController.h"

@interface RootTabBarController ()

@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
}

- (void)createUI{
    
    MainViewController *mainVc = [[MainViewController alloc]init];
    FaxianViewController *faxianVc = [[FaxianViewController alloc]init];
    MeigouViewController *meigouVc = [[MeigouViewController alloc]init];
    MineViewController *mineVc = [[MineViewController alloc]init];
    
    
    NSArray *vcArray = @[mainVc,faxianVc,meigouVc,mineVc];
    NSArray *titleArray = @[@"首页",@"发现",@"美购",@"我的"];
    NSArray *norPic = @[@"menu_home",@"menu_community",@"menu_meigou",@"menu_me"];
    NSArray *prePic = @[@"menu_home_pr",@"menu_community_pr",@"menu_meigou_pr",@"menu_me_pr"];
    NSMutableArray *viewControllers = [[NSMutableArray alloc]init];
    NSInteger i = 0;//控制循环
    for(BaseViewController *vc in vcArray){
        //创建导航控制器
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
        //取出对应的标题
        NSString *title = titleArray[i];
        
        //非选中效果的图片 并且设置总是显示原色
        UIImage *image = [[UIImage imageNamed:[NSString stringWithFormat:norPic[i],title]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        //选中效果的图片 并且设置总是显示原色
        UIImage *imageS = [[UIImage imageNamed:[NSString stringWithFormat:prePic[i],title]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        //创建tabBarItem
        UITabBarItem *tabItem = [[UITabBarItem alloc]initWithTitle:title image:image selectedImage:imageS];
        //设置图片的位置，注意上和下 应该设置为一对相反数
        tabItem.imageInsets = UIEdgeInsetsMake(2, 0, -2, 0);
        //设置选中状态的文字颜色
        [tabItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateSelected];
        //设置普通状体的标题颜色
        [tabItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1]} forState:UIControlStateNormal];
        
        //给导航控制器设置tabBarItem
        nav.tabBarItem = tabItem;
        [viewControllers addObject:nav];
        i++;
    }
    
    self.viewControllers = viewControllers;



}

@end















