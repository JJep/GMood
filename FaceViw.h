//
//  FaceViw.h
//  GMood
//
//  Created by Jep Xia on 2017/9/16.
//  Copyright © 2017年 Jep Xia. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FaceView;

@protocol FaceViewDataSource
- (float) smileForFaceView:(FaceView *)sender;
@end


@interface FaceView : UIView
@property (nonatomic) CGFloat scale;

-(void)pinch:(UIPinchGestureRecognizer*)gesture;

@property (nonatomic, weak) IBOutlet id <FaceViewDataSource> dataSource;
@end
