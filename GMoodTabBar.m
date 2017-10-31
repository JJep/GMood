//
//  GMoodTabBar.m
//  GMood
//
//  Created by Jep Xia on 2017/9/21.
//  Copyright © 2017年 Jep Xia. All rights reserved.
//

#import "GMoodTabBar.h"

#import "DWPublishButton.h"

#define ButtonNumber 5


@interface GMoodTabBar ()

@property (nonatomic, strong) DWPublishButton *publishButton;/**< 发布按钮 */

@end

@implementation GMoodTabBar

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        DWPublishButton *button = [DWPublishButton publishButton];
        [self addSubview:button];
        self.publishButton = button;
        
    }
    
    return self;
}



-(void)layoutSubviews{
    
    
    NSLog(@"%s",__func__);
    
    [super layoutSubviews];
    
    CGFloat barWidth = self.frame.size.width;
    CGFloat barHeight = self.frame.size.height;
    
    CGFloat buttonW = barWidth / ButtonNumber;
    CGFloat buttonH = barHeight - 2;
    CGFloat buttonY = 1;
    
    NSInteger buttonIndex = 0;
    
    self.publishButton.center = CGPointMake(barWidth * 0.5, barHeight * 0.3);
    
    for (UIView *view in self.subviews) {
        
        NSString *viewClass = NSStringFromClass([view class]);
        if (![viewClass isEqualToString:@"UITabBarButton"]) continue;
        
        CGFloat buttonX = buttonIndex * buttonW;
        if (buttonIndex >= 2) { // 右边2个按钮
            buttonX += buttonW;
        }
        
        view.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        
        buttonIndex ++;
        
        
    }
}


@end
