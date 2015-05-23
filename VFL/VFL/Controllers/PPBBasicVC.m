//
//  PPBBasicVC.m
//  VFL
//
//  Created by showtekwh on 15/5/23.
//  Copyright (c) 2015年 showtekwh. All rights reserved.
//

#import "PPBBasicVC.h"

@implementation PPBBasicVC
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    ///
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    
    UIView *purpleView = UIView.new;
    purpleView.backgroundColor = UIColor.purpleColor;
    purpleView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:purpleView];
    
    
    UIView *greenView = UIView.new;
    greenView.backgroundColor = UIColor.greenColor;
    greenView.translatesAutoresizingMaskIntoConstraints = NO;
    [purpleView addSubview:greenView];
    
    UIView *redView = UIView.new;
    redView.backgroundColor = UIColor.redColor;
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    [purpleView addSubview:redView];
    
    
    UIView *blueView = UIView.new;
    blueView.backgroundColor = UIColor.blueColor;
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:blueView];
    
    
    ///想了解NSDictionaryOfVariableBindings实现原理 可以参考
    ///http://blog.csdn.net/woohyuknrg/article/details/17263811
    NSDictionary *views = NSDictionaryOfVariableBindings(greenView,redView,blueView,purpleView);
    
    NSDictionary *metrics = @{@"hPadding":@15,@"vPadding":@15};
    
    //  greenView redView
    {
        //横向排列 superview-间距-greenView-间距-间距-redView-间距-superview
        NSString *format = @"H:|-hPadding-[greenView]-hPadding-[redView(greenView)]-hPadding-|";
        
        //限制 宽度和x坐标位置，
        NSArray *constrains1 = [NSLayoutConstraint
                                constraintsWithVisualFormat:format // 宽度和x坐标位置，
                                options:NSLayoutFormatAlignAllTop|NSLayoutFormatAlignAllBottom // origin.y size.height
                                metrics:metrics
                                views:views];
        [self.view addConstraints:constrains1];
        
        //纵向  superview-间距-greenView-间距-superview
        NSString* format2 = @"V:|-vPadding-[greenView]-vPadding-|";
        
        NSArray *constrains2 = [NSLayoutConstraint
                                constraintsWithVisualFormat:format2 // 限制y 坐标
                                options:0
                                metrics:metrics
                                views:views];
        
        /*constrains1 限制 宽度和x坐标位置
         constrains2 限制y 坐标
         constrains1 constrains2 共同限制 高度
         */
        [self.view addConstraints:constrains2];
    }
    // blueView purpleView 约束条件
    {
        [self.view addConstraints:
         [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hPadding-[blueView]-hPadding-|" options:0 metrics:metrics views:views]];
        
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-vPadding-[purpleView]-vPadding-[blueView(purpleView)]-vPadding-|" options:NSLayoutFormatAlignAllLeft |NSLayoutFormatAlignAllRight metrics:metrics views:views]];
    }

}
@end
