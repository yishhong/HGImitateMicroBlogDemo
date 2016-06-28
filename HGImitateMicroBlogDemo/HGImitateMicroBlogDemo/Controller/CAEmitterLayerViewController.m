//
//  CAEmitterLayerViewController.m
//  HGImitateMicroBlogDemo
//
//  Created by  易述宏 on 16/6/25.
//  Copyright © 2016年 湖南同禾. All rights reserved.
//

#import "CAEmitterLayerViewController.h"

@interface CAEmitterLayerViewController ()

@property(strong,nonatomic)CAEmitterLayer * emitterLayer;

@property(strong,nonatomic)CAEmitterLayer * fireEmitterLayer;

@end

@implementation CAEmitterLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor blackColor];
    [self snowLoad];
    [self fireLoad];
}

-(void)snowLoad{

    self.emitterLayer =[CAEmitterLayer layer];
    self.emitterLayer.frame =self.view.bounds;
    self.emitterLayer.emitterPosition =CGPointMake(self.view.bounds.size.width/2, 100);
    self.emitterLayer.emitterSize =CGSizeMake(self.view.bounds.size.width/2, 100);
    self.emitterLayer.emitterMode =kCAEmitterLayerPoint;
    self.emitterLayer.emitterShape =kCAEmitterLayerPoints;
    self.emitterLayer.renderMode =kCAEmitterLayerOldestFirst;
    
    CAEmitterCell* emitterCell = [CAEmitterCell emitterCell];
    emitterCell.name =@"snow";//粒子名字
    emitterCell.birthRate =100;//表示粒子每秒产生的数量
    emitterCell.lifetime =3.0;//生命周期(周期越大速度越慢)
    emitterCell.velocity =50.f;//粒子速度
    emitterCell.velocityRange =25;//粒子的速度范围
    emitterCell.zAcceleration =4;//粒子y方向的分量
    emitterCell.emissionRange =2*M_PI;//周围发射角度
    emitterCell.spinRange =M_PI;//粒子旋转角度
    emitterCell.contents =(__bridge id _Nullable)([(id)[UIImage imageNamed:@"DazFlake"]CGImage]);
    
    self.emitterLayer.shadowOpacity =20;
    self.emitterLayer.shadowRadius = 0.0;
    self.emitterLayer.shadowOffset = CGSizeMake(0.0, 1.0);
    //粒子边缘的颜色
    self.emitterLayer.shadowColor = [[UIColor redColor] CGColor];
    
    self.emitterLayer.emitterCells =@[emitterCell];
    [self.view.layer addSublayer:self.emitterLayer];
}

-(void)fireLoad{

    self.view.backgroundColor=[UIColor blackColor];
    
    //设置发射器
    
    self.fireEmitterLayer=[[CAEmitterLayer alloc]init];
    
    self.fireEmitterLayer.emitterPosition=CGPointMake(self.view.frame.size.width/2,self.view.frame.size.height-20);
    
    self.fireEmitterLayer.emitterSize=CGSizeMake(self.view.frame.size.width-100, 20);
    
    self.fireEmitterLayer.renderMode = kCAEmitterLayerAdditive;
    
    //发射单元
    
    //火焰
    
    CAEmitterCell * fire = [CAEmitterCell emitterCell];
    
    fire.birthRate=800;
    
    fire.lifetime=2.0;
    
    fire.lifetimeRange=1.5;//粒子参数的速度乘因子
    
    fire.color=[[UIColor colorWithRed:0.8 green:0.4 blue:0.2 alpha:0.1]CGColor];
    
    fire.contents=(id)[[UIImage imageNamed:@"DazFire"]CGImage];
    
    [fire setName:@"fire"];
    
    
    
    fire.velocity=80;//粒子的运动速度
    
    fire.velocityRange=40;//粒子速度容差
    
    fire.emissionLongitude=-M_PI_2;//决定粒子的飞行方向和水平坐标轴x的夹角
    
    fire.emissionRange=M_PI_4;//决定粒子发散范围
    
    
    
    
    fire.scaleSpeed=0.3;//缩放速度
    
    fire.spin=((M_PI/180)*360)/2;//旋转度
    
    
    
    //烟雾
    
    CAEmitterCell * smoke = [CAEmitterCell emitterCell];
    
    smoke.birthRate=400;
    
    smoke.lifetime=3.0;
    
    smoke.lifetimeRange=1.5;//生命周期容差
    
    smoke.color=[[UIColor colorWithRed:1 green:1 blue:1 alpha:0.05]CGColor];
    
    smoke.contents=(id)[[UIImage imageNamed:@"DazFire"]CGImage];
    
    [smoke setName:@"smoke"];
    
    
    
    smoke.velocity=125;
    
    smoke.velocityRange=50;
    
    smoke.emissionLongitude=-M_PI_2;
    
    smoke.emissionRange=M_PI_4;
    
    
    
    self.fireEmitterLayer.emitterCells=[NSArray arrayWithObjects:smoke,fire,nil];
    
    [self.view.layer addSublayer:self.fireEmitterLayer];

    
}

@end
