# didiAdAlertView
仿滴滴广告弹出框



实现的思路：自定义ADAlertView（继承自UIView），然后添加scrollView，scrollView上布局五个自定义的小view（ADItemView）来支持滑动，然后再添加pageControl和关闭按钮。


下面主要就代码中的一些细节做一些描述。 

广告弹窗视图ADAlertView初始化方法

+(ADAlertView *)showInView:(UIView *)view theDelegate:(id)delegate theADInfo: (NSArray *)dataList placeHolderImage: (NSString *)placeHolderStr;

需要注意一点，广告框是加载到keyWindow上的

[[[UIApplication sharedApplication].windows objectAtIndex:0] addSubview:self];

广告点击事件是通过添加点击手势来实现如下方法

-(void)tapContentImgView:(UITapGestureRecognizer *)gesture


然后通过代理方法实现跳转url广告链接。

-(void)clickAlertViewAtIndex:(NSInteger)index;

ADItemView为广告图片控件，对其layer层操作实现圆角效果

ADModel为数据源模型，通过点击不同的index来调用数据源对象，实现跳转。

滑动scrollView的时候更改index，调用pageControl的代理方法。

#pragma mark - UIScrollViewDelegate  滑动scrollView 切换pageContrl

- (void)scrollViewDidScroll:(UIScrollView *)scrollView；

在pageControl代理方法中实现scrollView分页滑动效果。

/// 当pageControl改变的时候，判断scrollView偏移

-(void)pageValueChange:(UIPageControl*)page；


点击移除广告弹框是通过手势调用如下方法

-(void)removeFromCurrentView:(UIGestureRecognizer *)gesture；


移除弹窗方法如下
/// 移除广告
- (void)removeSelfFromSuperview；


为了更好的用户体验，在弹处广告框的时候添加一个透明度过渡动画

/// 透明度动画
- (void)showAlertAnimation；

