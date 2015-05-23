//
//  PPBUpdateVC.m
//  VFL
//
//  Created by showtekwh on 15/5/23.
//  Copyright (c) 2015年 showtekwh. All rights reserved.
//

#import "PPBUpdateVC.h"
@interface PPBUpdateVC()

@property (nonatomic, strong) UIButton *growingButton;

@property (nonatomic,strong) NSLayoutConstraint *layoutWith;
@property (nonatomic,strong) NSLayoutConstraint *layoutHeight;

@end
@implementation PPBUpdateVC
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;

    
    self.growingButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.growingButton setTitle:@"Grow Me!" forState:UIControlStateNormal];
    self.growingButton.layer.borderColor = UIColor.greenColor.CGColor;
    self.growingButton.layer.borderWidth = 3;
    self.growingButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.growingButton addTarget:self action:@selector(didTapGrowButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.growingButton];
    
    self.layoutWith = [NSLayoutConstraint
                       constraintWithItem:self.growingButton
                       attribute:NSLayoutAttributeWidth
                       relatedBy:NSLayoutRelationEqual
                       toItem:nil
                       attribute:NSLayoutAttributeNotAnAttribute
                       multiplier:1.0
                       constant:100];
    self.layoutWith.priority = UILayoutPriorityDefaultHigh;

    [self.growingButton addConstraint:self.layoutWith];
    
    self.layoutHeight = [NSLayoutConstraint
                       constraintWithItem:self.growingButton
                       attribute:NSLayoutAttributeHeight
                       relatedBy:NSLayoutRelationEqual
                       toItem:nil
                       attribute:NSLayoutAttributeNotAnAttribute
                       multiplier:1.0
                       constant:100];
    self.layoutHeight.priority = UILayoutPriorityDefaultHigh;

    [self.growingButton addConstraint:self.layoutHeight];
    
    NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:self.growingButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:self.growingButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    [self.view addConstraint:centerX];
    [self.view addConstraint:centerY];
    
   NSLayoutConstraint *maxWidth = [NSLayoutConstraint constraintWithItem:self.growingButton
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationLessThanOrEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeWidth
                                multiplier:1.0
                                  constant:0];
    [self.view addConstraint:maxWidth];
    
    [self.view addConstraint:
     [NSLayoutConstraint constraintWithItem:self.growingButton
                                  attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationLessThanOrEqual
                                     toItem:self.view
                                  attribute:NSLayoutAttributeHeight
                                 multiplier:1.0 constant:0]];

}
- (void)didTapGrowButton:(UIButton *)button {
    self.layoutHeight.constant = self.layoutHeight.constant * 1.3;
    self.layoutWith.constant   = self.layoutWith.constant * 1.3;
    [UIView animateWithDuration:0.4 animations:^{
        [self.growingButton layoutIfNeeded];
    }];
}

- (void)updateViewConstraints {

    //according to apple super should be called at end of method
    [super updateViewConstraints];
}
@end
