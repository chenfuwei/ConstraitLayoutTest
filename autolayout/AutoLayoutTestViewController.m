//
//  AutoLayoutTestViewController.m
//  ConstraitLayoutTest
//
//  Created by net263 on 2020/4/17.
//  Copyright © 2020 net263. All rights reserved.
//

#import "AutoLayoutTestViewController.h"

@interface AutoLayoutTestViewController ()
@property(nonatomic, strong)UIView *view1;
@property(nonatomic, strong)UIButton *btn1;
@property(nonatomic, strong)UIView *view2;
@end

@implementation AutoLayoutTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    float viewWidth = 200;
    float viewHeight = 200;
    float viewX = self.view.frame.size.width - viewWidth;
    float viewY = self.view.frame.size.height - viewHeight;
    self.view1 = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.view1];
    self.view1.backgroundColor = [UIColor redColor];
    [self addView1ConstraitLayout];
    
    self.btn1 = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 100, self.view.frame.size.height / 2 - 50, 200, 100)];
    [self.view addSubview:self.btn1];
    [self.btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.btn1 addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [self.btn1 setTitle:@"返回" forState:UIControlStateNormal];
    
    self.view2 = [[UIView alloc] initWithFrame:CGRectMake(200 - 100, 0, 100, 100)];
    self.view2.backgroundColor = [UIColor blueColor];
    [self.view1 addSubview:self.view2];
}

-(void)addView1ConstraitLayout
{
    self.view1.translatesAutoresizingMaskIntoConstraints = NO;
    //设置View的宽度
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:self.view1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:200];
    //设置View的高度
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self.view1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:200];
    
    //s设置View的顶部边距
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.view1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view1.superview attribute:NSLayoutAttributeTop multiplier:1.0 constant:100];
    
        NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.view1 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view1.superview attribute:NSLayoutAttributeLeft multiplier:1.0 constant:100];
    
//    //s设置View的右边距
//    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self.view1 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];

    
    [self.view1 addConstraint:topConstraint];
    [self.view addConstraint:leftConstraint];
    [self.view1 addConstraint:widthConstraint];
    [self.view1 addConstraint:heightConstraint];

}

-(void)back:(UIButton *)btn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
