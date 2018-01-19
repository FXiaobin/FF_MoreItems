//
//  ItemScrollView.h
//  GuXuanTangAPP
//
//  Created by IOS开发 on 2018/1/19.
//  Copyright © 2018年 YuanHui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry.h>

@interface ItemScrollView : UIView<UIScrollViewDelegate>

@property (nonatomic,strong) NSArray *itemsArr;
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIPageControl *pageControl;

@property (nonatomic,copy) void (^itemViewTapBlock)(NSInteger index);

@end
