//
//  FaceViw.m
//  GMood
//
//  Created by Jep Xia on 2017/9/16.
//  Copyright © 2017年 Jep Xia. All rights reserved.
//

#import "FaceViw.h"

@implementation FaceView

@synthesize dataSource = _dataSource;

@synthesize scale = _scale;

#define DEFAULT_SCALE 0.90;

-(CGFloat)scale {
    if (!_scale) {
        return DEFAULT_SCALE;
    }
    return _scale;
}

-(void)setScale:(CGFloat)scale {    //创建set方法 当scale的值发生改变时，重新绘制画面
    if (_scale != scale) {
        _scale = scale;
        [self setNeedsDisplay];
    }
}

-(void)pinch:(UIPinchGestureRecognizer*)gesture {   //创建手势方法
    if(gesture.state == UIGestureRecognizerStateChanged || gesture.state == UIGestureRecognizerStateEnded ) {   //为什么在ended的状态也要改变scale？？******************
        self.scale *= gesture.scale;
        gesture.scale = 1;  //在每次改变手势的scale之后，要将手势的初始值变回1，以便于下次的手势更改
    }
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];//构造方法
    if (self) {
        // Initialization code
    }
    return self;
}

-(void) drawCircleAtPoint:(CGPoint) p withRadius:(CGFloat) radius inContext:(CGContextRef) context {
    UIGraphicsPushContext(context);
    CGContextBeginPath(context);
    CGContextAddArc(context, p.x, p.y, radius, 0, 2*M_PI, YES);
    CGContextStrokePath(context);
    UIGraphicsPopContext();
}


- (void)drawRect:(CGRect)rect
{
//    CGContextRef context = UIGraphicsGetCurrentContext();
    CGPoint midPoint;
    midPoint.x = self.bounds.origin.x + self.bounds.size.width / 2;
    midPoint.y = self.bounds.origin.y + self.bounds.size.height / 2;
    UIImage* imgFace = [UIImage imageNamed:@"l脸"];
    
//
//    CGFloat size = self.bounds.size.width/2;
    CGFloat size = [UIImage imageNamed:@"l脸"].size.width/2;
    if ([UIImage imageNamed:@"l脸"].size.height < [UIImage imageNamed:@"l脸"].size.width)
        size = [UIImage imageNamed:@"l脸"].size.height/2;

    size *= self.scale;

#define MOUTH_H 0.12
#define MOUTH_V 0.30
#define MOUTH_SMLE 0.15
    CGPoint faceStart ;
    faceStart.x = midPoint.x - imgFace.size.width / 2;
    faceStart.y = midPoint.y - imgFace.size.height / 2;
    CGPoint mouthStart;
//    mouthStart.x = midPoint.x - MOUTH_H * size;
//    mouthStart.y = midPoint.y + MOUTH_V * size;
    mouthStart.x = faceStart.x + 118;
    mouthStart.y = faceStart.y + 236;
    CGPoint mouthEnd = mouthStart;
//    mouthEnd.x += MOUTH_H * size * 2;
    mouthEnd.x += 90;
    CGPoint mouthCP1 = mouthStart;              //bezier三次曲线的第一个控制点
    mouthCP1.x += MOUTH_H * size * 2/3;
    CGPoint mouthCP2 = mouthEnd;                //bezier三次曲线的第二个控制点
    mouthCP2.x -= MOUTH_H * size * 2/3;
    
    float smile = [self.dataSource smileForFaceView:self];
//    if (smile < -1) smile = -1;
//    if (smile > 1) smile = 1;
    
    CGFloat smileOffset = MOUTH_SMLE * size * smile;
    mouthCP1.y += smileOffset;
    mouthCP2.y += smileOffset;
    mouthEnd.y -= smileOffset;
    mouthStart.y -= smileOffset;
    
    CGContextRef smileContext = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(smileContext, 12.0);
    [[UIColor blackColor] setStroke];
    
    
    CGContextBeginPath(smileContext);
    CGContextMoveToPoint(smileContext, mouthStart.x, mouthStart.y);
    CGContextAddCurveToPoint(smileContext, mouthCP1.x, mouthCP1.y, mouthCP2.x, mouthCP2.y, mouthEnd.x, mouthEnd.y);
    CGContextSetLineCap(smileContext, kCGLineCapRound);
    CGContextStrokePath(smileContext);
    
}


@end
