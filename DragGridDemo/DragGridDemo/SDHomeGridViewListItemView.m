//
//  SDHomeGridViewListItemView.m
//  GSD_ZHIFUBAO
//
//  Created by aier on 15-6-3.
//  Copyright (c) 2015年 GSD. All rights reserved.
//

/*
 
 *********************************************************************************
 *
 * 在您使用此自动布局库的过程中如果出现bug请及时以以下任意一种方式联系我们，我们会及时修复bug并
 * 帮您解决问题。
 * 新浪微博:GSD_iOS
 * Email : gsdios@126.com
 * GitHub: https://github.com/gsdios
 *
 *********************************************************************************
 
 */

#import "SDHomeGridViewListItemView.h"
#import "SDHomeGridItemModel.h"
//#import "UIButton+WebCache.h"
#import "UIView+SDExtension.h"
#import "SDHomeGridViewListItemViewButton.h"

@implementation SDHomeGridViewListItemView
{
    SDHomeGridViewListItemViewButton *_button;
    UIButton *_iconView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initialization];
    }
    return self;
}

- (void)initialization
{
    self.backgroundColor = [UIColor clearColor];
    
    SDHomeGridViewListItemViewButton *button = [[SDHomeGridViewListItemViewButton alloc] init];
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    _button = button;
    
    UIButton *icon = [[UIButton alloc] init];
    [icon setBackgroundImage:[UIImage imageNamed:@"close_icon_highlight"] forState:UIControlStateNormal];
    [icon setBackgroundImage:[UIImage imageNamed:@"close_icon_highlight"] forState:UIControlStateHighlighted];
    [icon addTarget:self action:@selector(iconViewClicked) forControlEvents:UIControlEventTouchUpInside];
    icon.hidden = YES;
    [self addSubview:icon];
    _iconView = icon;
    
    UILongPressGestureRecognizer *longPressed = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(itemLongPressed:)];
    [self addGestureRecognizer:longPressed];
}

#pragma mark - actions

- (void)itemLongPressed:(UILongPressGestureRecognizer *)longPressed
{
    if (self.itemLongPressedOperationBlock) {
        self.itemLongPressedOperationBlock(longPressed);
    }
}

- (void)buttonClicked
{
    if (self.buttonClickedOperationBlock) {
        self.buttonClickedOperationBlock(self);
    }
}

- (void)iconViewClicked
{
    if (self.iconViewClickedOperationBlock) {
        self.iconViewClickedOperationBlock(self);
    }
}

#pragma mark - properties

- (void)setItemModel:(SDHomeGridItemModel *)itemModel
{
    _itemModel = itemModel;
    
    if (itemModel.title) {
        [_button setTitle:itemModel.title forState:UIControlStateNormal];
    }
    
    if (itemModel.imageResString) {
        if ([itemModel.imageResString hasPrefix:@"http:"]) {
//            [_button setImageWithURL:[NSURL URLWithString:itemModel.imageResString] forState:UIControlStateNormal placeholderImage:nil];
        }
    } else {
        
        [_button setBackgroundImage:[UIImage imageNamed:@"channel_grid_circle"] forState:UIControlStateNormal];
        [_button setBackgroundImage:[UIImage imageNamed:@"channel_grid_circle"] forState:UIControlStateHighlighted];
    }
}

- (void)setHidenIcon:(BOOL)hidenIcon
{
    _hidenIcon = hidenIcon;
    _iconView.hidden = hidenIcon;
}

- (void)setIconImage:(UIImage *)iconImage
{
    _iconImage = iconImage;
    
    [_iconView setImage:iconImage forState:UIControlStateNormal];

}

#pragma mark - life circles

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _button.frame = CGRectMake((self.sd_width-70)/2, (self.sd_height - 35)/2, 70, 35);
    _iconView.frame = CGRectMake(0, 0, 23, 23);
}

@end
