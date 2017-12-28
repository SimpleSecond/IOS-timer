//
//  ViewController.m
//  ios-timer
//
//  Created by WangDongya on 2017/12/28.
//  Copyright © 2017年 example. All rights reserved.
//

#import "ViewController.h"
#import "NSTimerViewController.h"
#import "CADisplayLinkViewController.h"
#import "GCDTimerViewController.h"
#import <Masonry/Masonry.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    // NSTimer 实现计时器
    [self setupNSTimer];
    // CADisplayLink 实现计时器
    [self setupCADisplayLink];
    // GCD 实现计时器
    [self setupGCD];
}


- (void)setupNSTimer
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"NSTimer实现计时器" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(enterNSTimerVC) forControlEvents:UIControlEventTouchUpInside];
    btn.layer.cornerRadius = 5.0;
    btn.layer.borderWidth = 0.5;
    btn.layer.borderColor = [UIColor redColor].CGColor;
    btn.layer.masksToBounds = YES;
    
    [self.view addSubview:btn];
    
    // 添加约束
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(80);
        make.left.equalTo(self.view.mas_left).offset(40);
        make.right.equalTo(self.view.mas_right).offset(-40);
        make.height.mas_equalTo(44);
    }];
}

- (void)setupCADisplayLink
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"CADisplayLink实现计时器" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(enterCADisplayLinkVC) forControlEvents:UIControlEventTouchUpInside];
    btn.layer.cornerRadius = 5.0;
    btn.layer.borderWidth = 0.5;
    btn.layer.borderColor = [UIColor redColor].CGColor;
    btn.layer.masksToBounds = YES;
    
    [self.view addSubview:btn];
    
    // 添加约束
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(140);
        make.left.equalTo(self.view.mas_left).offset(40);
        make.right.equalTo(self.view.mas_right).offset(-40);
        make.height.mas_equalTo(44);
    }];
}

- (void)setupGCD
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"GCD实现计时器" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(enterGCDVC) forControlEvents:UIControlEventTouchUpInside];
    btn.layer.cornerRadius = 5.0;
    btn.layer.borderWidth = 0.5;
    btn.layer.borderColor = [UIColor redColor].CGColor;
    btn.layer.masksToBounds = YES;
    
    [self.view addSubview:btn];
    
    // 添加约束
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(200);
        make.left.equalTo(self.view.mas_left).offset(40);
        make.right.equalTo(self.view.mas_right).offset(-40);
        make.height.mas_equalTo(44);
    }];
}

- (void)enterNSTimerVC
{
    [self.navigationController pushViewController:[[NSTimerViewController alloc] init] animated:YES];
}

- (void)enterCADisplayLinkVC
{
    [self.navigationController pushViewController:[[CADisplayLinkViewController alloc] init] animated:YES];
}

- (void)enterGCDVC
{
    [self.navigationController pushViewController:[[GCDTimerViewController alloc] init] animated:YES];
}



@end
