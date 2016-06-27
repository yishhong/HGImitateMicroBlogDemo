//
//  HGCostom.h
//  HGImitateMicroBlogDemo
//
//  Created by  易述宏 on 16/6/27.
//  Copyright © 2016年 湖南同禾. All rights reserved.
//

#ifndef HGCostom_h
#define HGCostom_h

/*手机物理宽高*/
#define dtScreenWidth            ([UIScreen mainScreen].bounds.size.width)
#define dtScreenHeight           ([UIScreen mainScreen].bounds.size.height)
#define dtScreenHeightScale      (dtScreenHeight / 480.0)

/*应用程序宽高*/
#define dtAppWidth               ([[UIScreen mainScreen] applicationFrame].size.width)
#define dtAppHeight              ([[UIScreen mainScreen] applicationFrame].size.height)
#define dtAppHeightScale         (dtAppHeight / 480.0)

//系统版本
#define dtSystemVersion          [UIDevice currentDevice].systemVersion//String类型
#define dtIOSVersion             [UIDevice currentDevice].systemVersion.doubleValue
#define dtIOS7UP                 (dtIOSVersion >= 7.0)
#define dtIOS8UP                 (dtIOSVersion >= 8.0)

/*navbar默认高度和tabbar默认高度*/
#define dtNavBarDefaultHeight    64
#define dtTabBarDefaultHeight    49

/*设备相关信息*/
#define dtIsScreenSize(aSize)    ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(aSize, [[UIScreen mainScreen] currentMode].size) : NO)
#define dtIsPhone35              dtIsScreenSize(CGSizeMake(320, 480))// 3.5英寸非视网膜屏
#define dtIsPhoneRetina35        dtIsScreenSize(CGSizeMake(640, 960))  //4S
#define dtIsPhoneRetina4         dtIsScreenSize(CGSizeMake(640, 1136)) //5,5C,5S
#define dtIsPhoneRetina47        dtIsScreenSize(CGSizeMake(750, 1334)) //6
#define dtIsPhoneRetina55        dtIsScreenSize(CGSizeMake(1242, 2208))//6Plus @3x
#define dtIsPad                  dtIsScreenSize(CGSizeMake(768, 1024))
#define dtIsPadRetina            dtIsScreenSize(CGSizeMake(1536, 2048))

#define dtIsDevicePhone          (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define dtIsDevicePad            (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#ifdef DEBUG
#define DLog(...) NSLog(@"%s(%p) %@", __PRETTY_FUNCTION__, self, [NSString stringWithFormat:__VA_ARGS__])
#else
#define DLog(...) do { } while (0)
#endif

#define dtEqualRateHeight(f)  (dtScreenWidth*f/320)  //按照320的宽度来适配等比例值
#define dt6EqualRateHeight(f) (dtScreenWidth*f/375)  //按照375的宽度来适配等比例值

#endif /* HGCostom_h */
