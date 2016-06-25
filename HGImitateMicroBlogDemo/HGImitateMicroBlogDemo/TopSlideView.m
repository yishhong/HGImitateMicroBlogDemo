//
//  TopSlideView.m
//  HGImitateMicroBlogDemo
//
//  Created by  易述宏 on 16/6/22.
//  Copyright © 2016年 湖南同禾. All rights reserved.
//

#import "TopSlideView.h"
#import "UIView+Frame.h"
#import "UIView+Animation.h"
#import <objc/runtime.h>

#define UIScreeWidth [[UIScreen mainScreen]bounds].size.width
#define UIScreeHeight [[UIScreen mainScreen]bounds].size.height


@interface TopSlideView ()

@property(strong,nonatomic)UIButton * closeButton;

@property(strong,nonatomic)UIView *groundView;

@property(strong,nonatomic)UIView * bottomView;

@property(strong,nonatomic)UIButton * animationButton;

@property(strong,nonatomic)UICollectionView * collectionView;

@end

@implementation TopSlideView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self Setup];
    }
    return self;
}

-(void)Setup{
    
    [self addSubview:self.groundView];
    [self.groundView addSubview:self.bottomView];
    [self.bottomView addSubview:self.closeButton];
}

-(void)didCloseTapped{

    if ([self.delegate respondsToSelector:@selector(closeViewAnimation)]) {
        [self.delegate closeViewAnimation];
    }
}

#pragma mark -method
-(void)showOrHidenAnimation:(BOOL)Animation{

    if (Animation==YES) {
        
        [UIView animateWithDuration:0.3 animations:^{
            
            self.groundView.top=UIScreeHeight-300;
            self.groundView.backgroundColor =[UIColor colorWithRed:241.0/255.0 green:238.0f/255.0f blue:237.0f/255.0f alpha:0.8];
            self.backgroundColor =[UIColor colorWithRed:241.0/255.0 green:238.0f/255.0f blue:237.0f/255.0f alpha:0.8];

        } completion:^(BOOL finished) {
            [self annimationGroup];
            self.groundView.top=UIScreeHeight-300;
        }];
    
    }else{
    
        [UIView animateWithDuration:0.3 animations:^{
            
            self.groundView.top=UIScreeHeight;
            self.groundView.backgroundColor =[UIColor colorWithRed:241.0/255.0 green:238.0f/255.0f blue:237.0f/255.0f alpha:0.8];
            self.backgroundColor =[UIColor colorWithRed:241.0/255.0 green:238.0f/255.0f blue:237.0f/255.0f alpha:0.8];
            
        } completion:^(BOOL finished) {
            
            self.groundView.top=UIScreeHeight;
            [self removeFromSuperview];
        }];

        
    }
}

-(void)annimationGroup{

    UIButton * animationButton =[UIButton buttonWithType:UIButtonTypeCustom];
    animationButton.frame =CGRectMake((self.groundView.width-60)/2, (self.groundView.height-60)/2, 60, 60);
    [animationButton setTitle:@"文字" forState:UIControlStateNormal];
    animationButton.layer.masksToBounds =YES;
    animationButton.layer.cornerRadius =CGRectGetHeight(animationButton.frame)/2;
    [animationButton setBackgroundColor:[UIColor redColor]];
    [self.groundView addSubview:animationButton];
    self.animationButton=animationButton;
    
    CABasicAnimation * basicAnimation =[CABasicAnimation animationWithKeyPath:@"position"];
    basicAnimation.fromValue =[NSValue valueWithCGPoint:CGPointMake(CGRectGetWidth(self.groundView.frame)/2.0, CGRectGetHeight(self.groundView.frame))];
    basicAnimation.toValue =[NSValue valueWithCGPoint:CGPointMake(CGRectGetWidth(self.groundView.frame)/2.0,  CGRectGetHeight(self.groundView.frame)/2.0)];
    basicAnimation.duration =1.0;
    basicAnimation.timingFunction =[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    basicAnimation.removedOnCompletion =NO;
    basicAnimation.fillMode =kCAFillModeForwards;
//    [self.animationButton.layer addAnimation:basicAnimation forKey:@"basicAnimation"];
    
    CABasicAnimation * animation =[CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue=[NSValue valueWithCATransform3D:CATransform3DMakeScale(0, 0, 0)];
    animation.toValue =[NSValue valueWithCATransform3D:CATransform3DMakeScale(0, 0, 1)];
    animation.duration =1.0f;
    CAAnimationGroup * animationGroup =[CAAnimationGroup animation];
    animationGroup.animations =@[basicAnimation,animation];
    animationGroup.duration =3.0f;
    animationGroup.removedOnCompletion =NO;
    animationGroup.fillMode =kCAFillModeForwards;
    [self.animationButton.layer addAnimation:animationGroup forKey:@"animationGroup"];

}

#pragma mark -setter or getter
-(UIView *)groundView{
    
    if (!_groundView) {
        _groundView =[[UIView alloc]initWithFrame:CGRectMake(0, UIScreeHeight, self.width, 300)];
        _groundView.backgroundColor =[UIColor colorWithRed:241.0/255.0 green:238.0f/255.0f blue:237.0f/255.0f alpha:0.8];
    }
    return _groundView;
}

-(UIView *)bottomView{
    
    if (!_bottomView) {
        _bottomView =[[UIView alloc]initWithFrame:CGRectMake(0, self.groundView.height-44, UIScreeWidth, 44)];
        _bottomView.backgroundColor =[UIColor redColor];
    }
    return _bottomView;
}

-(UIButton *)closeButton{
    
    if (!_closeButton) {
        _closeButton =[UIButton buttonWithType:UIButtonTypeCustom];
        _closeButton.frame =CGRectMake((UIScreeWidth-44)/2, 0, 44, 44);
        [_closeButton setTitle:@"关闭" forState:UIControlStateNormal];
        [_closeButton addTarget:self action:@selector(didCloseTapped) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeButton;
}


@end
