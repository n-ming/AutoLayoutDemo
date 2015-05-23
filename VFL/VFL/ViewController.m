//
//  ViewController.m
//  VFL
//
//  Created by showtekwh on 15/5/21.
//  Copyright (c) 2015年 showtekwh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSArray *arrOfClass;
@property (nonatomic,strong) NSArray *arrOfTitle;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;

    self.title = @"VFL";
    
    UITableView *tab = [[UITableView alloc] init];
    tab.translatesAutoresizingMaskIntoConstraints = NO;
    tab.dataSource = self;
    tab.delegate   = self;
    [self.view addSubview:tab];
    
    [self.view addConstraint:
     [NSLayoutConstraint constraintWithItem:tab
                                  attribute:NSLayoutAttributeCenterX
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                  attribute:NSLayoutAttributeCenterX
                                 multiplier:1.0 constant:0]];
    
    [self.view addConstraint:
     [NSLayoutConstraint constraintWithItem:tab
                                  attribute:NSLayoutAttributeCenterY
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                  attribute:NSLayoutAttributeCenterY
                                 multiplier:1.0 constant:0]];
    
    [self.view addConstraint:
     [NSLayoutConstraint constraintWithItem:tab
                                  attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                  attribute:NSLayoutAttributeHeight
                                 multiplier:1.0 constant:0]];
    
    [self.view addConstraint:
     [NSLayoutConstraint constraintWithItem:tab
                                  attribute:NSLayoutAttributeWidth
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                  attribute:NSLayoutAttributeWidth
                                 multiplier:1.0 constant:0]];
    self.arrOfClass = @[@"PPBBasicVC",
                        @"PPBUpdateVC"];
    self.arrOfTitle = @[@"VFL布局",
                        @"VFL动画"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - tableview datasource && delegate
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50.0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.arrOfClass count];
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * showUserInfoCellIdentifier = @"UITableViewCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:showUserInfoCellIdentifier];
    if (cell == nil)    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:showUserInfoCellIdentifier]
        ;
        
        cell.backgroundColor = [UIColor whiteColor];
        cell.accessoryType   = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        //        cell.textLabel.textAlignment = NSTextAlignmentRight;
        cell.textLabel.backgroundColor = [UIColor whiteColor];
    }
    cell.textLabel.text = self.arrOfTitle[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *className = self.arrOfClass[indexPath.row];
    Class tmpClass = NSClassFromString(className);
    if (tmpClass != NULL) {
        UIViewController *vc = [[tmpClass alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}


@end
