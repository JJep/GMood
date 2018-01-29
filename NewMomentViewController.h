//
//  NewMomentViewController.h
//  GMood
//
//  Created by Jep Xia on 2017/10/31.
//  Copyright © 2017年 Jep Xia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewMomentViewController : UIViewController
{
    UITableView* _tableView;
}
@property (nonatomic,retain)UITextView* txText;
@property (nonatomic,retain)UIButton* chooseImageBtn;
@property (nonatomic,retain)UIImageView* image;
@property (nonatomic,retain)NSArray* imageArr;
@property (nonatomic,strong)NSString* type;
@property (nonatomic,retain)NSString* sessionUrl;
@property (nonatomic,retain)NSDictionary* parameters;
@property (nonatomic,retain)NSMutableArray* classes;
@property (nonatomic,retain)NSMutableArray* imageArray;
@property (nonatomic,retain)UIButton* typeBtn;
@end
