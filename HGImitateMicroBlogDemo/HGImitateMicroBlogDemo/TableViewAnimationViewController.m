//
//  CollectionViewAnimationViewController.m
//  HGImitateMicroBlogDemo
//
//  Created by  易述宏 on 16/6/25.
//  Copyright © 2016年 湖南同禾. All rights reserved.
//

#import "TableViewAnimationViewController.h"
#import "AnimationTableViewCell.h"

@interface TableViewAnimationViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(strong,nonatomic)UITableView * tableView;

@end

@implementation TableViewAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([AnimationTableViewCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([AnimationTableViewCell class])];
}

#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AnimationTableViewCell * animationCell =[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([AnimationTableViewCell class])];
    return animationCell;
}

#pragma mark -UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 80;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AnimationTableViewCell * animationCell =(AnimationTableViewCell *)cell;
    CABasicAnimation * basicAnimation =[CABasicAnimation animationWithKeyPath:@"transform"];
    basicAnimation.fromValue =[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 0)];
    basicAnimation.toValue =[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 0)];
    basicAnimation.timingFunction =[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [animationCell.layer addAnimation:basicAnimation forKey:@"animation"];
}

#pragma mark -setter or getter
-(UITableView *)tableView{

    if (!_tableView) {
        _tableView =[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate =self;
        _tableView.dataSource =self;
        _tableView.backgroundColor =[UIColor whiteColor];
        _tableView.tableFooterView =[UIView new];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}


@end
