//
//  DWTabBarController.m
//  GMood
//
//  Created by Jep Xia on 2017/9/23.
//  Copyright © 2017年 Jep Xia. All rights reserved.
//

#import "DWTabBarController.h"
#import "HomeViewController.h"
#import "GMoodTabBar.h"
#import "MomentsViewController.h"
#import "MeViewController.h"

@implementation DWTabBarController

#pragma mark -
#pragma mark - Life Cycle

-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    // 设置 TabBarItemTestAttributes 的颜色。
    [self setUpTabBarItemTextAttributes];
    
    // 设置子控制器
    [self setUpChildViewController];
    
    // 处理tabBar，使用自定义 tabBar 添加 发布按钮
    [self setUpTabBar];
    
    [[UITabBar appearance] setBackgroundImage:[self imageWithColor:[UIColor whiteColor]]];
    
    //去除 TabBar 自带的顶部阴影
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    //设置导航控制器颜色为白色
    [[UINavigationBar appearance] setBackgroundImage:[self imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    
    //设置导航控制器字体颜色为灰色
    NSDictionary *attributes=[NSDictionary dictionaryWithObjectsAndKeys:GMoodGrayColor,NSForegroundColorAttributeName,nil];
    [[UINavigationBar appearance] setTitleTextAttributes:attributes];
    [[UINavigationBar appearance] setTintColor:GMoodGrayColor];
}

#pragma mark -
#pragma mark - Private Methods

/**
 *  利用 KVC 把 系统的 tabBar 类型改为自定义类型。
 */
- (void)setUpTabBar{
    
    [self setValue:[[GMoodTabBar alloc] init] forKey:@"tabBar"];
}


/**
 *  tabBarItem 的选中和不选中文字属性
 */
- (void)setUpTabBarItemTextAttributes{
    
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = DWColor(145, 140, 140);
    
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = DWColor(115, 202, 108);
    
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateHighlighted];
    
}


/**
 *  添加子控制器，我这里值添加了4个，没有占位自控制器
 */
- (void)setUpChildViewController{
    
    [self addOneChildViewController:[[UINavigationController alloc]initWithRootViewController:[[HomeViewController alloc]init]]
                          WithTitle:@"G-mood"
                          imageName:@"G-mood未点击"
                  selectedImageName:@"G-mood点击"];
    
    [self addOneChildViewController:[[UINavigationController alloc]initWithRootViewController:[[UIViewController alloc] init]]
                          WithTitle:@"情绪记录"
                          imageName:@"情绪记录未点击"
                  selectedImageName:@"情绪记录点击"];
    
    
    [self addOneChildViewController:[[UINavigationController alloc]initWithRootViewController:[[MomentsViewController alloc]init]]
                          WithTitle:@"情绪说"
                          imageName:@"情绪说未点击"
                  selectedImageName:@"情绪说点击"];
    
    
    [self addOneChildViewController:[[UINavigationController alloc]initWithRootViewController:[[MeViewController alloc]init]]
                          WithTitle:@"我的"
                          imageName:@"我的未点击"
                  selectedImageName:@"我的点击"];
    
}

/**
 *  添加一个子控制器
 *
 *  @param viewController    控制器
 *  @param title             标题
 *  @param imageName         图片
 *  @param selectedImageName 选中图片
 */

- (void)addOneChildViewController:(UIViewController *)viewController WithTitle:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName{
    
    viewController.view.backgroundColor     = DWRandomColor;
    viewController.tabBarItem.title         = title;
    viewController.tabBarItem.image         = [UIImage imageNamed:imageName];
    UIImage *image = [UIImage imageNamed:selectedImageName];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.selectedImage = image;
    [self addChildViewController:viewController];
    
}


//这个方法可以抽取到 UIImage 的分类中
- (UIImage *)imageWithColor:(UIColor *)color
{
    NSParameterAssert(color != nil);
    
    CGRect rect = CGRectMake(0, 0, 1, 1);
    // Create a 1 by 1 pixel context
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);   // Fill it with your color
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


@end
