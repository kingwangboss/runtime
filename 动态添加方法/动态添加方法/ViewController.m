//
//  ViewController.m
//  动态添加方法
//
//  Created by One'J on 2017/3/11.
//  Copyright © 2017年 One'J. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/message.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Person *p = [Person new];
    [p performSelector:@selector(eat)];
    [p performSelector:@selector(eat:) withObject:@"10"];
    
    [objc_getClass("Person") performSelector:@selector(pao)];
    [[Person class] performSelector:@selector(pao:) withObject:@"10"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
