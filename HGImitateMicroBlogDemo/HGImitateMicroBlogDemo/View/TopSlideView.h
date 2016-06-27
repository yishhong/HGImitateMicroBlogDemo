//
//  TopSlideView.h
//  HGImitateMicroBlogDemo
//
//  Created by  易述宏 on 16/6/22.
//  Copyright © 2016年 湖南同禾. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TopSlideViewDelegate <NSObject>

-(void)closeViewAnimation;

@end

@interface TopSlideView : UIView

@property(strong,nonatomic)id<TopSlideViewDelegate>delegate;

-(void)showOrHidenAnimation:(BOOL)Animation;

@end
