//
//  AutoResizeTestViewController.m
//  ConstraitLayoutTest
//
//  Created by net263 on 2020/4/17.
//  Copyright © 2020 net263. All rights reserved.
//

#import "AutoResizeTestViewController.h"

@interface AutoResizeTestViewController ()
@property(nonatomic, strong)UIView *view1;
@property(nonatomic, strong)UIButton *btn1;
@property(nonatomic, strong)UIView *view2;
@end

@implementation AutoResizeTestViewController

//autoresizingMask: 只针对父子关系的控件设置约束,子控件相对父控件的相对关系
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    float viewWidth = 200;
    float viewHeight = 200;
    float viewX = self.view.frame.size.width - viewWidth;
    float viewY = self.view.frame.size.height - viewHeight;
    self.view1 = [[UIView alloc] initWithFrame:CGRectMake(viewX, viewY, viewWidth, viewHeight)];
    [self.view addSubview:self.view1];
    self.view1.backgroundColor = [UIColor redColor];
    
    //设置约束，距离左边弹性，距离上部弹性以及宽度弹性
    self.view1.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin| UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
    
    
    self.btn1 = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 100, self.view.frame.size.height / 2 - 50, 200, 100)];
    [self.view addSubview:self.btn1];
    [self.btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.btn1 addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [self.btn1 setTitle:@"返回" forState:UIControlStateNormal];
    
    self.view2 = [[UIView alloc] initWithFrame:CGRectMake(200 - 100, 0, 100, 100)];
    self.view2.backgroundColor = [UIColor blueColor];
    [self.view1 addSubview:self.view2];
    
    //横屏旋转后，view2宽度缩放
//    self.view2.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
    
    //横屏旋转后，view2宽高同时缩放
    self.view2.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}

-(void)back:(UIButton *)btn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
