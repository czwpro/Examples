//
//  ViewController.m
//  GCD
//
//  Created by czw on 2018/7/11.
//  Copyright © 2018年 czw. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self demo];
}

- (void)demo {
    
    /*:
        dispatch_queue_create方法用来创建一个队列
        它的第一个参数为队列的名称，第二个参数指定队列的类型（串行队列|并发队列）。
     */
    // 这里我们指定其为串行队列
    dispatch_queue_t serialQueue = dispatch_queue_create("a serial queue", DISPATCH_QUEUE_SERIAL);
    
    // 这里我们指定其为并发队列
    dispatch_queue_t concurrentQueue = dispatch_queue_create("a concurrent queue", DISPATCH_QUEUE_CONCURRENT);
    
    
    
    /*:
        队列中任务的执行有两种方式， （同步执行 | 异步执行）
     */
    // 这是同步执行的方法, 所以执行环境是在主线程
    dispatch_sync(serialQueue, ^{
        NSLog(@"%@", [NSThread currentThread]);
        NSLog(@"这里是同步执行 serialQueue 队列中的任务");
    });
    
    // 这是异步执行的方法，所以会开辟一个新的线程
    dispatch_async(concurrentQueue, ^{
        NSLog(@"%@", [NSThread currentThread]);
        NSLog(@"这里是异步执行 concurrentQueue 队列中的任务");
    });
}

@end
