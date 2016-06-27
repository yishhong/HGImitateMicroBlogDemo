//
//  HGCollectionViewAnimationController.m
//  HGImitateMicroBlogDemo
//
//  Created by  易述宏 on 16/6/27.
//  Copyright © 2016年 湖南同禾. All rights reserved.
//

#import "HGCollectionViewAnimationController.h"
#import "HGCostom.h"
#import "HGCollectionViewAnimationCell.h"

@interface HGCollectionViewAnimationController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(strong,nonatomic)UICollectionView * collectionView;

@property(strong,nonatomic)UICollectionViewFlowLayout * flowLayout;

@end

@implementation HGCollectionViewAnimationController

-(void)viewDidLoad{

    [super viewDidLoad];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([HGCollectionViewAnimationCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:NSStringFromClass([HGCollectionViewAnimationCell class])];
}

#pragma mark -UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HGCollectionViewAnimationCell * animationCell =[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HGCollectionViewAnimationCell class]) forIndexPath:indexPath];
    return animationCell;
}

#pragma mark -UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{

    HGCollectionViewAnimationCell * animationCell =(HGCollectionViewAnimationCell *)cell;
    CABasicAnimation * basicAnimation =[CABasicAnimation animationWithKeyPath:@"transform"];
    basicAnimation.fromValue =[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 0)];
    basicAnimation.toValue =[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 0)];
    basicAnimation.timingFunction =[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [animationCell.layer addAnimation:basicAnimation forKey:@"animation"];
}


#pragma mark -getter or setter
-(UICollectionView *)collectionView{

    if (!_collectionView) {
        _collectionView =[[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:self.flowLayout];
        _collectionView.backgroundColor =[UIColor whiteColor];
        _collectionView.delegate =self;
        _collectionView.dataSource =self;
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

-(UICollectionViewFlowLayout *)flowLayout{

    if (!_flowLayout) {
        _flowLayout =[[UICollectionViewFlowLayout alloc]init];
        _flowLayout.sectionInset =UIEdgeInsetsMake(10, 10, 10, 10);
        _flowLayout.itemSize =CGSizeMake((dtScreenWidth-30)/2, (dtScreenWidth-30)/2*2);
    }
    return _flowLayout;
}



@end
