# RateStarView
订单评价星星🌟🌟

### gif
![Image text](../rate.gif)


#### 定义

~~~
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
~~~        

#### 使用
~~~ 
    RateStarView *v = [[RateStarView alloc] initWithNum:12 space:5 width:20 height:20];
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
~~~
    
#### 布局
~~~
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
~~~

