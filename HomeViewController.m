//
//  FirstPageViewController.m
//  GMood
//
//  Created by Jep Xia on 2017/9/21.
//  Copyright © 2017年 Jep Xia. All rights reserved.
//

#import "HomeViewController.h"
#import "SDCycleScrollView.h"
#import "SceneApplicationTableViewCell.h"
#define sceneApplicationTag 1
#define moodTestTag 2
#define schoolTestTag 3

@interface HomeViewController () <UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic,retain)SDCycleScrollView* cycleView;
@property (nonatomic,retain)UIScrollView* scrollView;
@property (nonatomic,retain)UIView* titleView;
@property (nonatomic,retain)UIButton* sceneApplicationBtn;
@property (nonatomic,retain)UIButton* moodTestBtn;
@property (nonatomic,retain)UIButton* schoolAppBtn;
@property (nonatomic,retain)UITableView* sceneApplicationTableView;
@property (nonatomic,retain)UITableView* moodTestTableView;
@property (nonatomic,retain)UITableView* schoolAppTableView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.cycleView = [SDCycleScrollView new];
    UIImage* image = [UIImage imageNamed:@"背景"];
    [self.cycleView setLocalizationImageNamesGroup:[NSArray arrayWithObjects:
                                          image,
                                          image,
                                          image,
                                          nil]];
    
    [self.view addSubview:self.cycleView];
    [self.cycleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.mas_equalTo(200);
    }];
  
    [self setUpTitleView];
    [self setUpScrollView];

    
}

-(void)setUpScrollView {
    self.scrollView = [UIScrollView new];
    
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    CGFloat height = [[UIScreen mainScreen] bounds].size.height;
//    self.scrollView.contentSize = CGSizeMake(width, 0);
    [self.view addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.view);
        make.top.equalTo(self.titleView.mas_bottom);
    }];
    self.scrollView.delegate = self;


    self.scrollView.backgroundColor = [UIColor orangeColor];
    
    [self setUpTableView];
    
    self.scrollView.showsHorizontalScrollIndicator = YES; //隐藏横向滚动条
    self.scrollView.showsVerticalScrollIndicator = YES; //隐藏竖向滚动条
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = false;
    self.scrollView.scrollEnabled = NO;
    [self.scrollView setScrollEnabled:true];
    self.automaticallyAdjustsScrollViewInsets = NO;

}

- (void)setUpTableView {
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    CGFloat height = [[UIScreen mainScreen] bounds].size.height;

    
    self.sceneApplicationTableView = [UITableView new];
    self.sceneApplicationTableView.dataSource = self;
    self.sceneApplicationTableView.delegate = self;
    [self.sceneApplicationTableView setTag:sceneApplicationTag];
    [self.sceneApplicationTableView registerClass:[SceneApplicationTableViewCell class] forCellReuseIdentifier:@"SCENECELL"];
    self.sceneApplicationTableView.pagingEnabled = false;
    self.moodTestTableView = [UITableView new];
    self.moodTestTableView.dataSource = self;
    self.moodTestTableView.delegate = self;
    [self.moodTestTableView setTag:moodTestTag];
    
    self.schoolAppTableView = [UITableView new];
    self.schoolAppTableView.dataSource = self;
    self.schoolAppTableView.delegate = self;
    [self.schoolAppTableView setTag:schoolTestTag];
    
    [self.scrollView addSubview:self.sceneApplicationTableView];
    [self.scrollView addSubview:self.moodTestTableView];
    [self.scrollView addSubview:self.schoolAppTableView];
    
    [self.sceneApplicationTableView setBackgroundColor:DWRandomColor];
    [self.moodTestTableView setBackgroundColor:DWRandomColor];
    [self.schoolAppTableView setBackgroundColor:DWRandomColor];
    
    [self.sceneApplicationTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self.scrollView);
        make.right.equalTo(self.moodTestTableView.mas_left);
        make.width.mas_equalTo(width);
        make.size.mas_equalTo(CGSizeMake(width, height));
    }];

    
    [self.schoolAppTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.scrollView);
        make.width.mas_equalTo(width);
        make.right.equalTo(self.scrollView);
        make.size.mas_equalTo(CGSizeMake(width, height));
    }];



    [self.moodTestTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.scrollView);
        make.right.equalTo(self.schoolAppTableView.mas_left);
        make.width.mas_equalTo(width);
        make.size.mas_equalTo(CGSizeMake(width, height));

    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    switch (tableView.tag) {
        case sceneApplicationTag:
            return 1;
            break;
        case moodTestTag:
            return 0;
            break;
        case schoolTestTag:
            return 0;
            break;
        default:
            return 0;
            break;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (tableView.tag) {
        case sceneApplicationTag:
            return 1;
            break;
        case moodTestTag:
            return 0;
            break;
        case schoolTestTag:
            return 0;
            break;
        default:
            return 0;
            break;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SceneApplicationTableViewCell* sceneCell = [tableView dequeueReusableCellWithIdentifier:@"SCENECELL" forIndexPath:indexPath];
    sceneCell.sceneImg.image = [UIImage imageNamed:@"学校"];
    sceneCell.sceneName.text = [NSString stringWithFormat:@"学校"];
    sceneCell.sceneName.font = [UIFont systemFontOfSize:36];
    return sceneCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 0;
    if ([tableView isEqual:self.sceneApplicationTableView]) {
        height = 173.f;
    }
    return height;
}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    NSLog(@"scrollViewWillEndDragging");
    CGFloat offsetX = targetContentOffset -> x;
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    if (offsetX == 0) {
        [self.sceneApplicationBtn setSelected:true];
        [self.moodTestBtn setSelected: false];
        [self.schoolAppBtn setSelected: false];
    } else if (offsetX == width) {
        [self.sceneApplicationBtn setSelected: false];
        [self.moodTestBtn setSelected:true];
        [self.schoolAppBtn setSelected: false];
    } else if (offsetX == 2 * width) {
        [self.sceneApplicationBtn setSelected:false];
        [self.moodTestBtn setSelected: false];
        [self.schoolAppBtn setSelected: true];
    }
    
}

- (void)didTouchBtn:(UIButton* )button {

    CGFloat width = [[UIScreen mainScreen] bounds].size.width;

    
    switch (button.tag) {
        case sceneApplicationTag:
            [self.sceneApplicationBtn setSelected: true];
            [self.moodTestBtn setSelected: false];
            [self.schoolAppBtn setSelected: false];
            [self.scrollView setContentOffset:CGPointMake(0.f, 0.f) animated:YES];
            break;
        case moodTestTag:
            [self.sceneApplicationBtn setSelected: false];
            [self.moodTestBtn setSelected: true];
            [self.schoolAppBtn setSelected: false];
            [self.scrollView setContentOffset:CGPointMake(width, 0.f) animated:YES];
            break;
        case schoolTestTag:
            [self.sceneApplicationBtn setSelected: false];
            [self.moodTestBtn setSelected: false];
            [self.schoolAppBtn setSelected: true];
            [self.scrollView setContentOffset:CGPointMake(2 * width, 0.f) animated:YES];
            break;
        default:
            break;
    }
}

- (void)setUpTitleView {
    self.titleView = [UIView new];
    [self.view addSubview:self.titleView];
    [self.titleView setBackgroundColor:GMoodWhiteBackgroundColor];
    
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cycleView.mas_bottom);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(44);
    }];
    
    self.sceneApplicationBtn = [UIButton new];
    [self.titleView addSubview:self.sceneApplicationBtn];
    self.moodTestBtn = [UIButton new];
    [self.titleView addSubview:self.moodTestBtn];
    self.schoolAppBtn = [UIButton new];
    [self.titleView addSubview:self.schoolAppBtn];
    
    [self.sceneApplicationBtn setTitle:[NSString stringWithFormat:@"场景应用"] forState:UIControlStateNormal];
    [self.moodTestBtn setTitle:[NSString stringWithFormat:@"情绪测试"] forState:UIControlStateNormal];
    [self.schoolAppBtn setTitle:[NSString stringWithFormat:@"校园应用"] forState:UIControlStateNormal];
    
    [self.sceneApplicationBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [self.moodTestBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [self.schoolAppBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    
    [self.sceneApplicationBtn setTitleColor:DWColor(145, 140, 140) forState:UIControlStateNormal];
    [self.moodTestBtn setTitleColor:DWColor(145, 140, 140) forState:UIControlStateNormal];
    [self.schoolAppBtn setTitleColor:DWColor(145, 140, 140) forState:UIControlStateNormal];
    
    [self.sceneApplicationBtn setTitleColor:DWColor(113, 199, 107) forState:UIControlStateSelected];
    [self.moodTestBtn setTitleColor:DWColor(113, 199, 107) forState:UIControlStateSelected];
    [self.schoolAppBtn setTitleColor:DWColor(113, 199, 107) forState:UIControlStateSelected];
    
    [self.sceneApplicationBtn addTarget:self action:@selector(didTouchBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.moodTestBtn addTarget:self action:@selector(didTouchBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.schoolAppBtn addTarget:self action:@selector(didTouchBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.sceneApplicationBtn setTag:sceneApplicationTag];
    [self.moodTestBtn setTag:moodTestTag];
    [self.schoolAppBtn setTag:schoolTestTag];
    
    [self.sceneApplicationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.moodTestBtn);
        make.left.equalTo(self.titleView).offset(36);
        make.right.equalTo(self.moodTestBtn.mas_left).offset(-60);
        make.top.equalTo(self.titleView).offset(15);
        make.bottom.equalTo(self.titleView).offset(-15);
    }];
    
    [self.moodTestBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.sceneApplicationBtn);
        make.centerX.equalTo(self.titleView);
        make.top.equalTo(self.titleView).offset(15);
        make.bottom.equalTo(self.titleView).offset(-15);
    }];
    
    [self.schoolAppBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.sceneApplicationBtn);
        make.right.equalTo(self.titleView).offset(-36);
        make.left.equalTo(self.moodTestBtn.mas_right).offset(60);
        make.top.equalTo(self.titleView).offset(15);
        make.bottom.equalTo(self.titleView).offset(-15);
    }];
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
