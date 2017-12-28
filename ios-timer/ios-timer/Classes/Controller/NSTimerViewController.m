//
//  NSTimerViewController.m
//  ios-timer
//
//  Created by WangDongya on 2017/12/28.
//  Copyright © 2017年 example. All rights reserved.
//

#import "NSTimerViewController.h"
#import <Masonry/Masonry.h>

@interface NSTimerViewController ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton *startOrPauseBtn;

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSUInteger count;

@end

@implementation NSTimerViewController

-(UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc] init];
    }
    return _label;
}

-(UIButton *)startOrPauseBtn
{
    if (!_startOrPauseBtn) {
        _startOrPauseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _startOrPauseBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    // 设置导航
    [self setupNav];
    
    // 添加Label(显示时间)
    [self setupLabel];
    // 添加按钮
    [self setupButton];
}

- (void)setupLabel
{
    [self.view addSubview:self.label];
    
    self.label.font = [UIFont boldSystemFontOfSize:17.0];
    self.label.textColor = [UIColor blueColor];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.text = @"00:00:00";
    // 添加边框
    self.label.layer.cornerRadius = 5.0;
    self.label.layer.borderColor = [UIColor redColor].CGColor;
    self.label.layer.borderWidth = 0.5;
    self.label.layer.masksToBounds = YES;
    
    // 添加约束
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(80);
        make.left.equalTo(self.view.mas_left).offset(40);
        make.right.equalTo(self.view.mas_right).offset(-40);
        make.height.mas_equalTo(50);
    }];
}

- (void)setupButton
{
    [self.view addSubview:self.startOrPauseBtn];
    
    [self.startOrPauseBtn addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.startOrPauseBtn.selected = false;
    [self.startOrPauseBtn setTitle:@"开始" forState:UIControlStateNormal];
    [self.startOrPauseBtn setTitle:@"停止" forState:UIControlStateSelected];
    [self.startOrPauseBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [self.startOrPauseBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    
    // 添加边框
    self.startOrPauseBtn.layer.cornerRadius = 5.0;
    self.startOrPauseBtn.layer.borderColor = [UIColor redColor].CGColor;
    self.startOrPauseBtn.layer.borderWidth = 0.5;
    self.startOrPauseBtn.layer.masksToBounds = YES;
    
    // 添加约束
    [self.startOrPauseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
        make.width.mas_equalTo(self.view.bounds.size.width/2);
        make.height.mas_equalTo(44);
    }];
}

- (void)buttonClick
{
    if (self.startOrPauseBtn.isSelected) {
        // 停止计时器
        [self removeTimer];
        self.count = 0;
        self.startOrPauseBtn.selected = NO;
    } else {
        // 开启计时器
        [self startTimer];
        self.startOrPauseBtn.selected = YES;
    }
}




- (void)dealloc
{
    // 视图控制器销毁时，需要删除计时器
    [self removeTimer];
}

- (void)setupNav
{
    self.navigationItem.title = @"NSTimer";
}


#pragma mark - NSTimer实现方法
// 开启计时器
- (void)startTimer
{
    self.label.text = [NSString stringWithFormat:@"00:00:%02zd", self.count];
    
    self.timer = [NSTimer timerWithTimeInterval:0.1 target:self selector:@selector(updateTimerInfo) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}
// 删除计时器
- (void)removeTimer
{
    [self.timer invalidate];
    self.timer = nil;
}
// 计时器触发事件，更新界面
- (void)updateTimerInfo
{
    self.count++;
    
    // 基数
    NSUInteger base = self.count % 10;
    // 秒
    NSUInteger second = (self.count / 10) % 60;
    // 分钟
    NSUInteger minute = (self.count / 600) % 60;
    
    self.label.text = [NSString stringWithFormat:@"%02zd:%02zd:%02zd", minute, second, base];
}


@end
