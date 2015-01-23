//
//  ViewController.m
//  ZJToolDemo
//
//  Created by Nick on 15-1-22.
//  Copyright (c) 2015年 onebyte. All rights reserved.
//

#import "ViewController.h"
#import "ZJTool.h"
#import "ZJToastM.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    [tap addTarget:self action:@selector(tap)];
    [self.view addGestureRecognizer:tap];
}

-(void)tap
{
    static int i = 0;
    ZJToastM *toastM = [[ZJToastM alloc] init];
    toastM.duration = 1;
    toastM.msg = [NSString stringWithFormat:@"---%d---",i];
    [ZJToast showToastWithToastM:toastM];
    i++;
}


@end
