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

@property(strong,nonatomic)CAEmitterLayer * emitterLayer;

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
    [self scatteredLoad];
}

-(void)scatteredLoad{

    self.emitterLayer =[CAEmitterLayer layer];
    self.emitterLayer.emitterPosition =CGPointMake(self.imageView.frame.size.width/2, 64);
    self.emitterLayer.emitterSize =CGSizeMake(self.imageView.frame.size.width/2, 100);
    self.emitterLayer.emitterMode =kCAEmitterLayerOutline;
    
    CAEmitterCell * scatteredCell =[CAEmitterCell emitterCell];
    scatteredCell.name =@"scattered";
    scatteredCell.birthRate =1000;
    scatteredCell.lifetime =5.0f;
    scatteredCell.lifetimeRange =1.5f;
    scatteredCell.emissionLongitude =M_PI_4/2;
    scatteredCell.emissionRange =M_PI_4*1.5;
    scatteredCell.xAcceleration =-5;
    scatteredCell.velocity =50;
    scatteredCell.velocityRange =40;
    scatteredCell.scale =0.05;
    scatteredCell.contents =(id)[UIImage imageNamed:@"DazFire"].CGImage;
    scatteredCell.color=[[UIColor colorWithRed:0.5 green:1 blue:0 alpha:1]CGColor];
    
    CAEmitterCell * addScatteredCell =[CAEmitterCell emitterCell];
    addScatteredCell.name =@"addScattered";
    addScatteredCell.birthRate =100;
    addScatteredCell.lifetime =8.0f;
    addScatteredCell.lifetimeRange =1.5f;
    addScatteredCell.emissionLongitude =0;
    addScatteredCell.emissionRange =M_PI_2;
    addScatteredCell.beginTime =4.5f;
    addScatteredCell.velocity =80;
    addScatteredCell.velocityRange =40;
    addScatteredCell.contents =(id)[UIImage imageNamed:@"DazFire"].CGImage;
    addScatteredCell.color=[[UIColor colorWithRed:0.5 green:1 blue:0 alpha:1]CGColor];
    addScatteredCell.scale =0.5;

    scatteredCell.emitterCells =@[addScatteredCell];
    self.emitterLayer.emitterCells=@[scatteredCell];
    [self.imageView.layer addSublayer:self.emitterLayer];
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
