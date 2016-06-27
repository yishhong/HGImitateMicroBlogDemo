//
//  HGSearchViewController.m
//  HGImitateMicroBlogDemo
//
//  Created by  易述宏 on 16/6/24.
//  Copyright © 2016年 湖南同禾. All rights reserved.
//

#define dtScreenHeight  [[UIScreen mainScreen]bounds].size.height
#define dtScreenWidth  [[UIScreen mainScreen]bounds].size.width

#import "HGSearchViewController.h"
#import "UIView+Frame.h"
#import "TableViewAnimationViewController.h"

@interface HGSearchViewController ()

@property(strong,nonatomic)UIButton * popUpButton;

@property(strong,nonatomic)UIButton * disappearButton;

@end

@implementation HGSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.disappearButton];
    [self.view addSubview:self.popUpButton];
    [self showAnimation];
}


#pragma mark - methods response
-(void)didDisappearTapped{
   
}

-(void)didPopTapped{

    [UIView animateWithDuration:0.4 animations:^{
        self.popUpButton.transform =CGAffineTransformMakeScale(3.0, 3.0);
    } completion:^(BOOL finished) {
        self.popUpButton.transform =CGAffineTransformMakeScale(1.0, 1.0);
        TableViewAnimationViewController * animationViewController =[[TableViewAnimationViewController alloc]init];
        animationViewController.title =@"collectionVCAnimation";
        [self.navigationController pushViewController:animationViewController animated:YES];
    }];
}

#pragma mark -setter or getter
-(UIButton *)disappearButton{

    if (!_disappearButton) {
        _disappearButton =[[UIButton alloc]initWithFrame:CGRectMake(0, dtScreenHeight-100, dtScreenWidth, 55)];
        [_disappearButton setBackgroundColor:[UIColor greenColor]];
        [_disappearButton setTitle:@"关闭" forState:UIControlStateNormal];
        [_disappearButton addTarget:self action:@selector(didDisappearTapped) forControlEvents:UIControlEventTouchUpInside];
    }
    return _disappearButton;
}

-(UIButton *)popUpButton{
    
    if (!_popUpButton) {
        _popUpButton =[[UIButton alloc]initWithFrame:CGRectMake((dtScreenWidth-60)/2, dtScreenHeight, 60, 60)];
        [_popUpButton setBackgroundColor:[UIColor redColor]];
        [_popUpButton setTitle:@"文字" forState:UIControlStateNormal];
        _popUpButton.layer.cornerRadius =CGRectGetHeight(_popUpButton.frame)/2;
        _popUpButton.layer.masksToBounds =YES;
        [_popUpButton addTarget:self action:@selector(didPopTapped) forControlEvents:UIControlEventTouchUpInside];
    }
    return _popUpButton;
}

-(void)showAnimation{

   [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:15 options:UIViewAnimationOptionCurveEaseInOut animations:^{
       self.popUpButton.top =(dtScreenHeight-100)/2;
   } completion:^(BOOL finished) {
       self.popUpButton.top =(dtScreenHeight-100)/2;
   }];
}

-(void)hiddenAnimation{

    
}

@end
