//
//  ViewController.m
//  TEST
//
//  Created by shenzhenshihua on 2017/4/14.
//  Copyright © 2017年 shenzhenshihua. All rights reserved.
//

#import "ViewController.h"
#import "Hello.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSLog(@"hello word!!");
//    Hello * hello = [[Hello alloc] init];
//    hello.name = @"liang";
//    
//    Hello * hello3 = hello;
//    
//    hello.name = @"zhen";
//    
//    NSLog(@"%@,%@",hello.name,hello3.name);

    NSArray * arr = @[@10.6];
    
    NSArray * arr2 = arr;
//    [arr2 addObject:arr];
    arr = @[@10.6];
    //    arr = @[@"hello", @"word"];
    if (arr == arr2) {
        NSLog(@"一样");
    }else{
        NSLog(@"不一样");
    }
    NSLog(@"%p,%p",arr,arr2);
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
