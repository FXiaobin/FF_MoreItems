//
//  ItemScrollView.m
//  GuXuanTangAPP
//
//  Created by IOS开发 on 2018/1/19.
//  Copyright © 2018年 YuanHui. All rights reserved.
//

#import "ItemScrollView.h"
#import "SmallItemView.h"

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kPageControlHeight 25
#define kCloumn 4

@implementation ItemScrollView

-(UIScrollView *)scrollView{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate = self;
    }
    return _scrollView;
}

-(UIPageControl *)pageControl{
    if (_pageControl == nil) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame)-kPageControlHeight, kWidth, kPageControlHeight)];
        _pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
        _pageControl.pageIndicatorTintColor = [UIColor darkGrayColor];
        [_pageControl addTarget:self action:@selector(pageControlValueChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _pageControl;
}

- (void)pageControlValueChanged:(UIPageControl *)pg{
    [UIView animateWithDuration:0.2 animations:^{
        [self.scrollView setContentOffset:CGPointMake(pg.currentPage * kWidth, 0)];
    }];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    _pageControl.currentPage = scrollView.contentOffset.x / kWidth;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
    
        
    }
    return self;
}

-(void)setItemsArr:(NSArray *)itemsArr{
    _itemsArr = itemsArr;
    
    [self setupUI];
}

- (void)setupUI{
   
    if (self.itemsArr.count > 1) {
        [self addSubview:self.pageControl];
        self.pageControl.currentPage = 0;
        self.pageControl.numberOfPages = self.itemsArr.count;
        self.scrollView.frame = CGRectMake(0, 0, kWidth, CGRectGetHeight(self.frame)-kPageControlHeight);
    }
    self.scrollView.contentSize = CGSizeMake(kWidth * self.itemsArr.count, 0);
    [self addSubview:self.scrollView];
    
    NSInteger maxCount = [self.itemsArr.firstObject count];
    NSInteger maxRow = maxCount % kCloumn == 0 ? maxCount/kCloumn : maxCount/kCloumn+1;
    
    
    for (int i = 0 ; i < self.itemsArr.count; i++) {
        NSInteger count = [self.itemsArr[i] count];
        //会根据子数组个数重新计算每一页item的高度
        //NSInteger maxRow = count % 4 == 0 ? count/4 : count/4+1;
        
        for (int j = 0; j < count; j++) {
            NSInteger row = j / kCloumn, cloumn = j % kCloumn;
            CGFloat itemW = kWidth/kCloumn, itemH = CGRectGetHeight(self.scrollView.frame) / maxRow ;
            SmallItemView *itemView = [[SmallItemView alloc] initWithFrame:CGRectMake(kWidth * i + itemW * cloumn, row * itemH, itemW, itemH)];
            
            CGFloat r = arc4random() % 255 / 255.0;
            CGFloat g = arc4random() % 255 / 255.0;
            CGFloat b = arc4random() % 255 / 255.0;
            UIColor *randomColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
            itemView.backgroundColor = randomColor;
            
            itemView.tag = 4000 + i * 8 + j;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(itemViewTap:)];
            [itemView addGestureRecognizer:tap];
            
            [self.scrollView addSubview:itemView];
        }
    }
 
}

- (void)itemViewTap:(UITapGestureRecognizer *)sender{
    NSInteger index = sender.view.tag - 4000;
    if (self.itemViewTapBlock) {
        self.itemViewTapBlock(index);
    }
    
}



@end
