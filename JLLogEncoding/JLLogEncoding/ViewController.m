//
//  ViewController.m
//  JLLogEncoding
//
//  Created by kfz on 16/12/12.
//  Copyright © 2016年 kongfz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *dic = @{
                          @"key1_0": @"可以显示中文了",
                          @"key1_1" : @"value1_1",
                          @"key1_2" : @[
                                  @{
                                      @"list1" : @"我是list1"
                                   },
                                  @{
                                      @"list2" : @"我是list2"
                                   }
                                  ]
                          };
    NSLog(@"%@", dic);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
