//
//  ViewController.m
//  ConstraitLayoutTest
//
//  Created by net263 on 2020/4/17.
//  Copyright © 2020 net263. All rights reserved.
//

#import "ViewController.h"
#import "AutoLayoutTestViewController.h"
#import "AutoResizeTestViewController.h"
#import "MasonaryViewController.h"

@interface ViewController ()
@property(nonatomic, strong)UIButton *btn1;
@property(nonatomic, strong)UIButton *btn2;
@property(nonatomic, strong)UIButton *btn3;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    float x = [[UIScreen mainScreen] bounds].size.width / 2 - 150;
    float y = 70;
    
    
    self.btn1 = [[UIButton alloc] initWithFrame:CGRectMake(x, y, 300, 100)];
    [self.btn1 setTitle:@"autoResize" forState:UIControlStateNormal];
    [self.btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.btn2 = [[UIButton alloc] initWithFrame:CGRectMake(x, y + 100 + 50, 300, 100)];
    [self.btn2 setTitle:@"autoLayout" forState:UIControlStateNormal];
    [self.btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    self.btn3 = [[UIButton alloc] initWithFrame:CGRectMake(x, y + 100 + 50 + 100 + 50, 300, 100)];
    [self.btn3 setTitle:@"masonaryLayout" forState:UIControlStateNormal];
    [self.btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    
    [self.view addSubview:self.btn1];
    [self.view addSubview:self.btn2];
    [self.view addSubview:self.btn3];
    
    
    [self.btn1 addTarget:self action:@selector(toAutoResize:) forControlEvents:UIControlEventTouchUpInside];
    [self.btn2 addTarget:self action:@selector(toAutoLayout:) forControlEvents:UIControlEventTouchUpInside];
    [self.btn3 addTarget:self action:@selector(toMasonaryLayout:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)toAutoResize:(UIButton *)btn
{
    AutoResizeTestViewController *autoResize = [[AutoResizeTestViewController alloc] init];
    [self presentViewController:autoResize animated:YES completion:nil];
}

-(void)toAutoLayout:(UIButton *)btn
{
    AutoLayoutTestViewController *autoLayout = [[AutoLayoutTestViewController alloc] init];
    [self presentViewController:autoLayout animated:YES completion:nil];
}

-(void)toMasonaryLayout:(UIButton *)btn
{
    MasonaryViewController *masonary = [[MasonaryViewController alloc] init];
    [self presentViewController:masonary animated:YES completion:nil];
}


@end
