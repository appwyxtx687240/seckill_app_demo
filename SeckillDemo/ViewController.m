//
//  ViewController.m
//  SeckillDemo
//
//  Created by Summer on 16/8/11.
//  Copyright © 2016年 Summer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 200, 200, 200);
    [btn addTarget:self action:@selector(downloadJson) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"下载json数据" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor greenColor];

    [self.view addSubview:btn];

   }

-(void)downloadJson
{
    NSString *localhost = @"http://192.168.1.229:8080/seckill/list";

    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:localhost]completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSString *json = [NSJSONSerialization JSONObjectWithData:data options:nil error:nil];
        NSLog(@"json:%@", json);
    }];
    [dataTask resume];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
