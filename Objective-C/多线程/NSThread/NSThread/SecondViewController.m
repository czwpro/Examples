//
//  SecondViewController.m
//  NSThread
//
//  Created by czw on 2018/7/11.
//  Copyright © 2018年 czw. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (atomic, assign) int tickets; // 票数

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  
    _tickets = 20;
    
    NSThread *thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTickets) object:nil];
    thread1.name = @"ticket seller A";
    [thread1 start];
    
    NSThread *thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTickets) object:nil];
    thread2.name = @"ticket seller B";
    [thread2 start];
    
}

- (void)saleTickets {
    
    while (YES) {
        sleep(1);
        if (_tickets > 0) {
            _tickets--;
            NSThread *t = [NSThread currentThread];
            NSLog(@"%@售出一张票剩下%d张票", t.name, _tickets);
        } else {
            NSLog(@"票已卖完！");
            break;
        }
    }
}

@end
