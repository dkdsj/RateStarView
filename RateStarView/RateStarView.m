//
//  RateStarView.m
//  RateStarView
//
//  Created by zz on 2019/6/13.
//  Copyright © 2019 zz. All rights reserved.
//

#import "RateStarView.h"

#define kSelectImageName   @"rate-star-select"
#define kUnSelectImageName @"rate-star-unselect"

@interface RateStarView ()

@property (nonatomic, assign) NSInteger rateNum;

@property (nonatomic, assign, readwrite) CGFloat rateWidth;
@property (nonatomic, assign, readwrite) CGFloat rateHeight;

@end

@implementation RateStarView

- (instancetype)initWithNum:(NSInteger)num
                        space:(CGFloat)space
                        width:(CGFloat)width
                       height:(CGFloat)height {
    
    self = [super init];
    if (self) {
        [self initViewWithNum:num space:space width:width height:height];
    }
    return self;
}

- (void)initViewWithNum:(NSInteger)num
                  space:(CGFloat)space
                  width:(CGFloat)width
                 height:(CGFloat)height {
    
    for (int i = 0; i < num; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i*space+i*width, 0, width, height);
        btn.userInteractionEnabled = NO;
        btn.tag = 10+i;
        
        [btn setBackgroundImage:[UIImage imageNamed:kUnSelectImageName] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:kSelectImageName] forState:UIControlStateHighlighted];
        [btn setBackgroundImage:[UIImage imageNamed:kSelectImageName] forState:UIControlStateSelected];
        [btn setBackgroundImage:[UIImage imageNamed:kSelectImageName] forState:UIControlStateSelected|UIControlStateHighlighted];
        
        [btn addTarget:self action:@selector(handleButtonEvent:) forControlEvents:UIControlEventTouchDown];
        
        [self addSubview:btn];
    }
    
    _rateWidth = num*width+(num-1)*space;
    _rateHeight = height;
    _rateNum = num;
}


- (CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize {
    return CGSizeMake(100, 40);
}

#pragma mark - Action

/** 暂时用触摸  btn点击关闭先 */
- (void)handleButtonEvent:(UIButton *)sender {

    for (UIButton *btn in self.subviews) {
        if (btn.tag<=sender.tag) {
            [btn setBackgroundImage:[UIImage imageNamed:kSelectImageName] forState:UIControlStateNormal];
        } else {
            [btn setBackgroundImage:[UIImage imageNamed:kUnSelectImageName] forState:UIControlStateNormal];
        }
    }
    
    
    /** 分数 */
    NSInteger score = sender.tag-10+1;
    
    if ([self.delegate respondsToSelector:@selector(rateStarView:score:)]) {
        [self.delegate rateStarView:self score:score];
    }
}

#pragma mark - Touche Event

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    CGRect rect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    if(CGRectContainsPoint(rect,point)) {
        [self changeStarWithPoint:point];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    [UIView animateWithDuration:0.2 animations:^{
        [self changeStarWithPoint:point];
    }];
}

- (void)changeStarWithPoint:(CGPoint)point{
    CGPoint p = point;
    
    if (p.x < 0) {
        p.x = 0;
    }
    if (p.x > self.frame.size.width) {
        p.x = self.frame.size.width;
    }
    
    NSString *str = [NSString stringWithFormat:@"%0.2f",p.x / self.frame.size.width];
    float scoreF = [str floatValue];
    p.x = scoreF * self.frame.size.width;
    
    NSInteger score = (int)((scoreF*10.0)/(10.0/_rateNum))+1;
//    NSLog(@"score %zd %f p.x:%f", score, scoreF, p.x);
    
    
    /** btn */
    for (UIButton *btn in self.subviews) {
        if (btn.tag-10+1<=score) {
            [btn setBackgroundImage:[UIImage imageNamed:kSelectImageName] forState:UIControlStateNormal];
        } else {
            [btn setBackgroundImage:[UIImage imageNamed:kUnSelectImageName] forState:UIControlStateNormal];
        }
    }
    
    
    /** 分数 */
    if ([self.delegate respondsToSelector:@selector(rateStarView:score:)]) {
        [self.delegate rateStarView:self score:score];
    }
}

@end
