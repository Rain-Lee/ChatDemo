//
//  ChatListViewController.m
//  ChatDemo
//
//  Created by Rain on 16/12/6.
//  Copyright © 2016年 rain. All rights reserved.
//

#import "ChatListViewController.h"
#import "ChatRoomViewController.h"

#define SCREEN_WIDTH self.view.frame.size.width
#define SCREEN_HEIGHT self.view.frame.size.height

@interface ChatListViewController ()

@end

@implementation ChatListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE)]];
    
    self.conversationListTableView.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64);
    
    [self initView];
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
    // rightBtn
    UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 75 - 14, 20, 75, 44)];
    rightBtn.titleLabel.textColor = [UIColor whiteColor];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [rightBtn setTitle:@"单聊" forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(clickRightBtnEvent) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:rightBtn];
}
    
- (void)clickRightBtnEvent{
    ChatRoomViewController *chatRoomVC = [[ChatRoomViewController alloc] init];
    chatRoomVC.conversationType = ConversationType_PRIVATE;
    chatRoomVC.targetId = @"1";
    chatRoomVC.title = @"name1";
    [self.navigationController pushViewController:chatRoomVC animated:true];
}
    
//重写RCConversationListViewController的onSelectedTableRow事件
- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType
         conversationModel:(RCConversationModel *)model
               atIndexPath:(NSIndexPath *)indexPath {
    ChatRoomViewController *conversationVC = [[ChatRoomViewController alloc]init];
    conversationVC.conversationType = model.conversationType;
    conversationVC.targetId = model.targetId;
    conversationVC.title = model.conversationTitle;
    [self.navigationController pushViewController:conversationVC animated:YES];
}

@end
