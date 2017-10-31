//
//  FaceViewController.m
//  GMood
//
//  Created by Jep Xia on 2017/9/14.
//  Copyright © 2017年 Jep Xia. All rights reserved.
//

#import "FaceViewController.h"

@interface FaceViewController () <FaceViewDataSource>
@property (nonatomic, retain) FaceView *faceView;
@property (nonatomic, retain) UIImageView* face;
@property (nonatomic, retain) UIImageView* teachView;

@end

@implementation FaceViewController
@synthesize happiness = _happiness;
@synthesize faceView = _faceView;


- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self createUI];
    
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    BOOL firstLauch = [defaults boolForKey:@"firstLaunch"];//根据键值取出name
    if (firstLauch) {
        self.teachView = [UIImageView new];
        [self.view addSubview:self.teachView];
        [self.teachView setImage:[UIImage imageNamed:@"气泡"]];
        [self.teachView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view.mas_left).offset(20);
            make.right.equalTo(self.view.mas_right).offset(-216);
            make.width.mas_equalTo([UIImage imageNamed:@"气泡"].size.width);
            make.height.mas_equalTo([UIImage imageNamed:@"气泡"].size.width);
            make.bottom.equalTo(self.view.mas_bottom).offset(-74);
        }];
    }

}

- (void)createUI {
    
    self.face = [UIImageView new];
    [self.view addSubview:self.face];
    [self.face setImage:[UIImage imageNamed:@"l脸"]];
    [self.face mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo([UIImage imageNamed:@"l脸"].size.width);
        make.height.mas_equalTo([UIImage imageNamed:@"l脸"].size.height);
        make.center.equalTo(self.view);
    }];
    
    self.faceView = [FaceView new];
    [self.view addSubview:self.faceView];
    [self.faceView setBackgroundColor:[UIColor whiteColor]];
    [self.faceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.view);
    }];
    self.faceView.backgroundColor = [UIColor colorWithWhite:0.f alpha:0];
    
    UIButton* btnConfirm = [UIButton new];
    [btnConfirm setImage:[UIImage imageNamed:@"确认"] forState:UIControlStateNormal];
    [self.view addSubview:btnConfirm];
    [btnConfirm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(-22);
        make.width.mas_equalTo([UIImage imageNamed:@"确认"].size.width);
        make.bottom.equalTo(self.view.mas_bottom).offset(-18);
    }];
    
    UIButton* btnSkip = [UIButton new];
    [self.view addSubview:btnSkip];
//    [btnSkip setImage:[UIImage imageNamed:@"跳过"] forState:UIControlStateNormal];
    [btnSkip setTitle:@"跳过" forState:UIControlStateNormal];
    [btnSkip setTitleColor:[UIColor colorWithRed:141.0/255.0 green:139.0/255.0 blue:135.0/255.0 alpha:1] forState:UIControlStateNormal];
    [btnSkip.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [btnSkip addTarget:nil action:@selector(skip) forControlEvents:UIControlEventTouchUpInside];
    [btnSkip mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(btnConfirm.mas_left).offset(-15);
        make.bottom.equalTo(self.view.mas_bottom).offset(-18);
        make.width.mas_equalTo([UIImage imageNamed:@"跳过"].size.width);
        make.height.mas_equalTo([UIImage imageNamed:@"跳过"].size.height);
    }];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:253.0/255.0 green:253.0/255.0 blue:253.0/255.0 alpha:1.0]];
}

- (void)skip {
    NSLog(@"跳过");
}

-(float)smileForFaceView:(FaceView *)sender {
    NSLog(@"%f",(self.happiness - 50) / 50.0);
    CGFloat res = (self.happiness - 50) / 50.0;
    if (res < -1) res = -1;
    if (res > 1) res = 1;
    return res;
}

- (void) setHappiness:(int)happiness {
    if (_happiness != happiness) {
        _happiness = happiness;
        if (_happiness < 0) _happiness = 0;
        if (_happiness > 100) _happiness = 100;
        [self.faceView setNeedsDisplay];
    }
}

- (void)setFaceView:(FaceView *)faceView {
    _faceView = faceView;
    [self.faceView addGestureRecognizer:[[UIPinchGestureRecognizer alloc] initWithTarget:self.faceView action:@selector(pinch:)]];
    
    [self.faceView addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleHappinessGesture:)]];
    
    self.faceView.dataSource = self;
}

-(void)handleHappinessGesture:(UIPanGestureRecognizer *)gesture {
    if(gesture.state == UIGestureRecognizerStateChanged || gesture.state == UIGestureRecognizerStateEnded ) {
        CGPoint translation = [gesture translationInView:self.faceView];
        self.happiness += translation.y;
        [gesture setTranslation:CGPointZero inView:self.faceView];
        if (!self.teachView.isHidden) {
            [self.teachView setHidden:true];
        }
    }
}

-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
