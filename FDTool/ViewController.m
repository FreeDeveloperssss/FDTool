//
//  ViewController.m
//  FDTool
//
//  Created by ddSoul on 2017/9/14.
//  Copyright © 2017年 dxl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *lab = [[UILabel alloc] initWithFrame:self.view.bounds];
    lab.numberOfLines = 0;
    lab.font = [UIFont systemFontOfSize:40];
    lab.text = @"西亮大傻吊!!!!!";
    lab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lab];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
