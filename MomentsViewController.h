//
//  MomentsViewController.h
//  GMood
//
//  Created by Jep Xia on 2017/10/9.
//  Copyright © 2017年 Jep Xia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MomentsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    UITableView* mainTableView;
//    UITableView* classTableView;
    NSArray *_persons;
    NSArray* _contentArray;
    
}

@end
