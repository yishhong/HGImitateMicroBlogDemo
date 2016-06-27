//
//  ViewController.m
//  HGImitateMicroBlogDemo
//
//  Created by  易述宏 on 16/6/22.
//  Copyright © 2016年 湖南同禾. All rights reserved.
//

#import "ViewController.h"
#import "TopSlideView.h"
#import "HGCostom.h"
#import "HGCollectionViewAnimationController.h"

@interface ViewController ()<TopSlideViewDelegate>

@property(strong,nonatomic)TopSlideView * groundView;

@property(strong,nonatomic)UIImageView * imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.imageView];
    UITapGestureRecognizer * tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTappedTap)];
    self.imageView.userInteractionEnabled =YES;
    [self.imageView addGestureRecognizer:tap];
//
//    if (self.tabBarController.selectedIndex==0) {
//        UIWindow * window =[UIApplication sharedApplication].keyWindow;
//        [window addSubview:self.groundView];
//        [self.groundView showOrHidenAnimation:YES];
//    }
}

-(void)didTappedTap{

    HGCollectionViewAnimationController * collectionViewAnimationController =[[HGCollectionViewAnimationController alloc]init];
    collectionViewAnimationController.title =@"collection";
    [self.navigationController pushViewController:collectionViewAnimationController animated:YES];
}

#pragma mark -
-(void)closeViewAnimation{

    [self.groundView showOrHidenAnimation:NO];
}

#pragma mark -setter or getter
-(TopSlideView *)groundView{

    if (!_groundView) {
        _groundView =[[TopSlideView alloc]initWithFrame:self.view.bounds];
        _groundView.delegate =self;
    }
    return _groundView;
}

-(UIImageView *)imageView{

    if (!_imageView) {
        _imageView =[[UIImageView alloc]initWithFrame:self.view.bounds];
        
        _imageView.image =[UIImage imageNamed:@"12"];
    }
    return _imageView;
}

@end
