//
//  ViewController.m
//  RateStarView
//
//  Created by zz on 2019/6/13.
//  Copyright © 2019 zz. All rights reserved.
//

#import "ViewController.h"
#import "RateStarView.h"
#import "Masonry.h"

@interface ViewController ()<RateStarViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RateStarView *v = [[RateStarView alloc] initWithNum:33 space:5 width:20 height:20];
    [self.view addSubview:v];
    
    v.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:.2];
    v.delegate = self;
    
    
    /** ;; */
    UIView *vpp = [UIView new];
    [self.view addSubview:vpp];
    
    UIView *vqq = [UIView new];
    [self.view addSubview:vqq];
    
    vpp.backgroundColor = [UIColor purpleColor];
    vqq.backgroundColor = [UIColor blueColor];
    
    
    /** mas */
    [vpp mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(220);
        make.left.mas_equalTo(10);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(30);
    }];
    
    [v mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(vpp);
        make.left.equalTo(vpp.mas_right).offset(20);
        make.width.mas_equalTo(v.rateWidth);
        make.height.mas_equalTo(v.rateHeight);
    }];
    
    [vqq mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(v);
        make.left.equalTo(v.mas_right).offset(20);
        make.width.height.mas_equalTo(vpp);
    }];
}

#pragma mark - RateStarViewDelegate

- (void)rateStarViewScore:(NSInteger)score {
    NSLog(@"score:%zd", score);
}

@end
