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

@end

@implementation CAEmitterLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor greenColor];
    self.emitterLayer =[CAEmitterLayer layer];
    self.emitterLayer.frame =self.view.bounds;
    self.emitterLayer.emitterPosition =CGPointMake(self.view.bounds.size.width/2, 0);
    self.emitterLayer.emitterSize =CGSizeMake(self.view.bounds.size.width/2, 0);
    self.emitterLayer.emitterMode =kCAEmitterLayerOutline;
    self.emitterLayer.emitterShape =kCAEmitterLayerLine;
    self.emitterLayer.renderMode =kCAEmitterLayerOldestFirst;
    
    CAEmitterCell* emitterCell = [CAEmitterCell emitterCell];
    emitterCell.name =@"snow";//粒子名字
    emitterCell.birthRate =1.0;//粒子参数的速度乘因子
    emitterCell.lifetime =120.0;
    emitterCell.velocity =50.f;//粒子速度
    emitterCell.velocityRange =50;//粒子的速度范围
    emitterCell.yAcceleration =4;//粒子y方向的分量
    emitterCell.emissionRange =0.5*M_PI;//周围发射角度
    emitterCell.spinRange =0.25 *M_PI;//粒子旋转角度
    emitterCell.contents =(__bridge id _Nullable)([(id)[UIImage imageNamed:@"DazFlake"]CGImage]);
//    emitterCell.color = [[UIColor colorWithRed:0.200 green:0.258 blue:0.543 alpha:1.000] CGColor];//粒子雪花形状的粒子的颜色
    
    //创建星星形状的粒子
    CAEmitterCell *snowflake1 = [CAEmitterCell emitterCell];
    //粒子的名字
    snowflake1.name = @"snow";
    //粒子参数的速度乘数因子
    snowflake1.birthRate = 1.0;
    snowflake1.lifetime = 120.0;
    //粒子速度
    snowflake1.velocity =20.0;
    //粒子的速度范围
    snowflake1.velocityRange = 50;
    //粒子y方向的加速度分量
    snowflake1.yAcceleration = 4;
    //周围发射角度
    snowflake1.emissionRange =2*M_PI;
    //子旋转角度范围
    snowflake1.spinRange = 0.25 * M_PI;
    //粒子的内容和内容的颜色
    snowflake1.contents = (id)[[UIImage imageNamed:@"DazStarIcon"] CGImage];
//    snowflake1.color = [[UIColor colorWithRed:0.600 green:0.658 blue:0.743 alpha:1.000] CGColor];
    
    self.emitterLayer.shadowOpacity = 1.0;
    self.emitterLayer.shadowRadius = 0.0;
    self.emitterLayer.shadowOffset = CGSizeMake(0.0, 1.0);
    //粒子边缘的颜色
    self.emitterLayer.shadowColor = [[UIColor redColor] CGColor];
    
    self.emitterLayer.emitterCells =@[emitterCell,snowflake1];
    [self.view.layer addSublayer:self.emitterLayer];
}

@end
