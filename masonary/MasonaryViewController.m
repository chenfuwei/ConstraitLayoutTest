//
//  MasonaryViewController.m
//  ConstraitLayoutTest
//
//  Created by net263 on 2020/4/20.
//  Copyright © 2020 net263. All rights reserved.
//

#import "MasonaryViewController.h"

@interface MasonaryViewController ()
@property(nonatomic, strong)UIButton *btn1;
@property(nonatomic, strong)UIButton *btn2;
@property(nonatomic, strong)UIButton *btn3;
@end

@implementation MasonaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.btn1 = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.btn1 setTitle:@"返回" forState:UIControlStateNormal];
    [self.btn1 addTarget:self action:@selector(toBack:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn1];
    
    [self.btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(200, 100));
    }];
    
    self.btn2 = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.btn2 setTitle:@"更新" forState:UIControlStateNormal];
    [self.btn2 addTarget:self action:@selector(toUpdate:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn2];
    [self.btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.btn1).offset(50);
        make.left.equalTo(self.btn1);
        make.size.mas_equalTo(CGSizeMake(200, 100));
    }];
    
    self.btn3 = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.btn3 setTitle:@"替换" forState:UIControlStateNormal];
    [self.btn3 addTarget:self action:@selector(toReplace:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn3];
    [self.btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.btn2).offset(50);
        make.left.equalTo(self.btn2);
        make.size.mas_equalTo(CGSizeMake(200, 100));
    }];
}

-(void)toBack:(UIButton *)button
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)toUpdate:(UIButton *)button
{
    [self.btn2 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(400, 200));
    }];
}

-(void)toReplace:(UIButton *)button
{
    [self.btn3 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.btn2).offset(50);
        make.left.equalTo(self.btn2);
        make.size.mas_equalTo(CGSizeMake(100, 50));
    }];
}



@end
