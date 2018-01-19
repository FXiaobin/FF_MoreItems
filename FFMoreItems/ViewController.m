//
//  ViewController.m
//  FFMoreItems
//
//  Created by IOS开发 on 2018/1/19.
//  Copyright © 2018年 YuanHui. All rights reserved.
//

#import "ViewController.h"
#import "ItemScrollView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    
    ItemScrollView *itemsView = [[ItemScrollView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 240)];
    /// dataArr的个数控制是否显示pageControl，大于1显示，dataArr的第一个元素数组的个数控制排列的行数，大于4则2行显示
    NSArray *dataArr = @[
                         @[@"",@"",@"",@"",@"",@"",@""],
                         @[@"",@"",@""]
                         ];

    itemsView.itemsArr = dataArr;
    
    
    itemsView.itemViewTapBlock = ^(NSInteger index) {
        NSLog(@"---- index = %ld",index);
    };
    [self.view addSubview:itemsView];
    
    
    
    ItemScrollView *itemsView1 = [[ItemScrollView alloc] initWithFrame:CGRectMake(0, 350, self.view.bounds.size.width, 120)];
    /// dataArr的个数控制是否显示pageControl，大于1显示，dataArr的第一个元素数组的个数控制排列的行数，大于4则2行显示
    NSArray *dataArr1 = @[
                         @[@"",@"",@""],
                         ];
    
    itemsView1.itemsArr = dataArr1;
    
    
    itemsView1.itemViewTapBlock = ^(NSInteger index) {
        NSLog(@"---- 1 index = %ld",index);
    };
    [self.view addSubview:itemsView1];
    
    ItemScrollView *itemsView2 = [[ItemScrollView alloc] initWithFrame:CGRectMake(0, 550, self.view.bounds.size.width, 140)];
    /// dataArr的个数控制是否显示pageControl，大于1显示，dataArr的第一个元素数组的个数控制排列的行数，大于4则2行显示
    NSArray *dataArr2 = @[
                          @[@"",@"",@""],
                          @[@"",@""]
                          ];
    
    itemsView2.itemsArr = dataArr2;
    
    
    itemsView2.itemViewTapBlock = ^(NSInteger index) {
        NSLog(@"---- 1 index = %ld",index);
    };
    [self.view addSubview:itemsView2];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
