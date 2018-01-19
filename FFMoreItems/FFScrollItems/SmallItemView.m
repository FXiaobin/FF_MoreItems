//
//  SmallItemView.m
//  GuXuanTangAPP
//
//  Created by IOS开发 on 2018/1/19.
//  Copyright © 2018年 YuanHui. All rights reserved.
//

#import "SmallItemView.h"
#import <Masonry.h>

@implementation SmallItemView

-(UIImageView *)icon{
    if (_icon == nil) {
        _icon = [[UIImageView alloc] init];
        _icon.image = [UIImage imageNamed:@"jiFen09"];
    }
    return _icon;
}

-(UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"title text";
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.icon];
        [self addSubview:self.titleLabel];
        
        [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self).offset(10);
            make.width.and.height.mas_equalTo(60);
        }];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self.icon.mas_bottom).offset(10);
            make.width.mas_equalTo(80);
        }];
        
    }
    return self;
}

@end
