//
//  ViewController.m
//  ADAlertProject
//
//  Created by xie on 2017/8/14.
//  Copyright © 2017年 xie. All rights reserved.
//

#import "ViewController.h"
#import "ADWKWebViewController.h"
#import "ADAlertView.h"
#import "ADModel.h"
@interface ViewController ()<ADAlertDelegate>
@property(nonatomic,strong)NSMutableArray *imgArr;
@property(nonatomic,strong)UIButton *showBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ADAlertView";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.showBtn];
_imgArr = [self setImgArr];
    // Do any additional setup after loading the view, typically from a nib.
}

-(NSMutableArray *)setImgArr{
    NSMutableArray *arr = [[NSMutableArray alloc]initWithCapacity:0];
    for (int i = 1; i<=5; i++) {
        ADModel *adModel  = [[ADModel alloc]init];
        adModel.imgStr      = [NSString stringWithFormat:@"%d",i];
        adModel.linkUrl     = @"https://www.baidu.com";
        [arr addObject:adModel];
    }
    return arr;
}
-(UIButton*)showBtn{
    if (!_showBtn) {
        _showBtn        = [UIButton buttonWithType:UIButtonTypeCustom];
        _showBtn.center = self.view.center;
        _showBtn.bounds = CGRectMake(0, 0, 100, 60);
        [_showBtn setTitle:@"弹出广告" forState:UIControlStateNormal];
        [_showBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [_showBtn addTarget:self action:@selector(showAdAlertView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _showBtn;
}
-(void)showAdAlertView{
    [ADAlertView  showInView:self.view theDelegate:self theADInfo:_imgArr placeHolderImage:@"1"];
}
-(void)clickAlertViewAtIndex:(NSInteger)index{
    ADModel *adModel  = [_imgArr objectAtIndex:index];
    ADWKWebViewController *webVC    = [[ADWKWebViewController alloc]init];
    webVC.urlStr        = adModel.linkUrl;
    [self.navigationController pushViewController:webVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
