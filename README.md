# RateStarView
订单评价星星🌟🌟

### gif
![Image text](https://github.com/dkdsj/RateStarView/blob/master/rate.gif)


#### 定义

~~~
/**
 @param num 星星数量
 @param space 星星间距
 @param width 1个星星宽度
 @param height 1个星星高度
 @canTouchMove 是否可以触摸修改星星数量
 */
- (instancetype)initWithNum:(NSInteger)num
                      space:(CGFloat)space
                      width:(CGFloat)width
                     height:(CGFloat)height
               canTouchMove:(BOOL)canTouchMove;
~~~        

#### 使用
~~~ 
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _vRate1 = [[RateStarView alloc] initWithNum:12 space:5 width:20 height:20 canTouchMove:YES];
    [self.view addSubview:_vRate1];
    _vRate1.delegate = self;
    _vRate1.tag = 111;
    _vRate1.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:.2];
    
    _vRate2 = [[RateStarView alloc] initWithNum:10 space:5 width:20 height:20 canTouchMove:NO];
    [self.view addSubview:_vRate2];
    _vRate2.delegate = self;
    _vRate2.tag = 222;
    _vRate2.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:.2];
    
    
    
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
    
    [_vRate1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(vpp);
        make.left.equalTo(vpp.mas_right).offset(20);
        make.width.mas_equalTo(self.vRate1.rateWidth);
        make.height.mas_equalTo(self.vRate1.rateHeight);
    }];
    
    [vqq mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.vRate1);
        make.left.equalTo(self.vRate1.mas_right).offset(20);
        make.width.height.mas_equalTo(vpp);
    }];
    
    [_vRate2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.vRate1);
        make.top.equalTo(self.vRate1.mas_bottom).offset(20);
        make.width.mas_equalTo(self.vRate2.rateWidth);
        make.height.mas_equalTo(self.vRate2.rateHeight);
    }];
~~~

