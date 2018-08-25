//
//  ViewController.m
//  JLLogEncoding
//
//  Created by kfz on 16/12/12.
//  Copyright © 2016年 kongfz. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSObject *obj = [NSObject new];
    NSDictionary *dic = @{
                          @"key1_0": @"可以显示中文了",
                          @"key1_1" : @"value1_1",
                          @"obj" : obj,
                          @"key1_2" : @[
                                  @{
                                      @"list1" : @"我是list1 \0 list1"
                                   },
                                  @{
                                      @"list2" : @"我是list2"
                                   }
                                  ],
                          @"key_3" : @"~^\\1\0name\0loriange/^~  end"
                          };
    NSLog(@"%@", dic);
    
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:@"http://apptest.kongfz.com/getContactList" parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error.userInfo);
    }];
}


@end


























