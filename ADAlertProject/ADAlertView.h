//
//  adAlertView.h
//  ADAlertProject
//
//  Created by xie on 2017/8/14.
//  Copyright © 2017年 xie. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ADAlertDelegate <NSObject>

-(void)clickAlertViewAtIndex:(NSInteger)index;

@end

@interface ADAlertView : UIView

@property(nonatomic,assign)id<ADAlertDelegate> delegate;

+(ADAlertView *)showInView:(UIView *)view theDelegate:(id)delegate theADInfo: (NSArray *)dataList placeHolderImage: (NSString *)placeHolderStr;

@end


/// 中间图片view
@interface ADItemView : UIView

@property(nonatomic,assign)NSInteger index;//记录当前第几个item
@property(nonatomic,strong)UIImageView*imageView;//自定义视图

@end
