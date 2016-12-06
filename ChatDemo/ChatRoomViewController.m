//
//  ChatRoomViewController.m
//  ChatDemo
//
//  Created by Rain on 16/12/6.
//  Copyright © 2016年 rain. All rights reserved.
//

#import "ChatRoomViewController.h"

#define SCREEN_WIDTH self.view.frame.size.width
#define SCREEN_HEIGHT self.view.frame.size.height

@interface ChatRoomViewController ()

@end

@implementation ChatRoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    
    self.conversationMessageCollectionView.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView{
    // topView
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    topView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:topView];
    // titleLbl
    UILabel *titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 44)];
    titleLbl.textAlignment = NSTextAlignmentCenter;
    titleLbl.textColor = [UIColor whiteColor];
    titleLbl.text = @"会话列表";
    [topView addSubview:titleLbl];
    // leftBtn
    UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(14, 20, 75, 44)];
    leftBtn.titleLabel.textColor = [UIColor whiteColor];
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [leftBtn setTitle:@"返回" forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(clickLeftBtnEvent) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:leftBtn];
}
    
-(void)clickLeftBtnEvent{
    [self.navigationController popViewControllerAnimated:true];
}

@end
