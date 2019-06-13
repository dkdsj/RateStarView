//
//  RateStarView.h
//  RateStarView
//
//  Created by zz on 2019/6/13.
//  Copyright © 2019 zz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class RateStarView;
@protocol RateStarViewDelegate <NSObject>

@optional
- (void)rateStarView:(RateStarView *)rateView score:(NSInteger)score;

@end

@interface RateStarView : UIView

/** 返回view的高宽 由内部计算 */
@property (nonatomic, assign, readonly) CGFloat rateWidth;
@property (nonatomic, assign, readonly) CGFloat rateHeight;

/**
 @param num 星星数量
 @param space 星星间距
 @param width 1个星星宽度
 @param height 1个星星高度
 @return ;
 */
- (instancetype)initWithNum:(NSInteger)num
                      space:(CGFloat)space
                      width:(CGFloat)width
                     height:(CGFloat)height;


@property (nonatomic, weak) id <RateStarViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
