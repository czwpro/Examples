//
//  SecondViewController.m
//  GCD
//
//  Created by czw on 2018/7/11.
//  Copyright © 2018年 czw. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self syncExecuteSerailQueue];
//    [self syncExecuteConcurrentQueue];
//    [self asyncExecuteSerialQueue];
    [self asyncExecuteConcurrentQueue];
}

/*:
 多线程
 - 任务：所执行的一系列操作，网络请求、数据存储、UI更新等
 - 队列
     - 串行队列: 任务只能一个接一个的进行
     - 并发队列: 多个任务可以同时进行
 - 执行方式
     - 同步执行: 不会开辟新的线程来执行任务
     - 异步执行: 会开辟新的线程来执行任务
 
 - 组合方式
     - 同步执行 + 串行队列   | 不会开辟新线程，任务会按顺序执行
     - 同步执行 + 并发队列   | 不会开辟新线程，任务会顺序执行
     - 异步执行 + 串行队列   | 会开辟新线程，任务会顺序执行
     - 异步执行 + 并发队列   | 会开辟新线程，任务不会顺序执行
 
 **`同步执行`还是`异步执行`，决定了是否开辟新`线程`, 只要是`串行队列`或者是`同步执行`的方式，任务总会按顺序执行，只有`异步执行`且为`并发队列`，任务才不会按顺序执行**
 
 - 是否开辟新线程取决于是否异步执行，开辟线程的个数取决于是 串行队列还是并发队列
    - 只有异步执行会开辟新线程
    - 在异步执行的基础上，串行队列只会开辟一个线程，并发队列会开辟多个线程
 
 */


/**
 同步执行 + 串行队列
 */
- (void)syncExecuteSerailQueue {

    // 串行队列
    dispatch_queue_t serialQueue = dispatch_queue_create("a serial queue", DISPATCH_QUEUE_SERIAL);
    for (int i = 0; i < 10; i++) {
        // 同步执行
        dispatch_sync(serialQueue, ^{
            NSLog(@"%@", [NSThread currentThread]);
            NSLog(@"serial task %d", i);
        });
    }
    
}


/**
 同步执行 + 并发队列
 */
- (void)syncExecuteConcurrentQueue {
    
    // 并发队列
    dispatch_queue_t concurrentQueue = dispatch_queue_create("a concurrent queue", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i < 10; i++) {
        // 同步执行
        dispatch_sync(concurrentQueue, ^{
            NSLog(@"%@", [NSThread currentThread]);
            NSLog(@"concurrent task %d", i);
        });
    }
}

/**
 异步执行 + 串行队列
 */
- (void)asyncExecuteSerialQueue {
    // 串行队列
    dispatch_queue_t serialQueue = dispatch_queue_create("a serial queue", DISPATCH_QUEUE_SERIAL);
    for (int i = 0; i < 10; i++) {
        // 异步执行
        dispatch_async(serialQueue, ^{
            NSLog(@"%@", [NSThread currentThread]);
            NSLog(@"serial task %d", i);
        });
    }
}

/**
 异步执行 + 并发队列
 */
- (void)asyncExecuteConcurrentQueue {
    
    // 并发队列
    dispatch_queue_t concurrentQueue = dispatch_queue_create("a concurrent queue", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i < 10; i++) {
        // 同步执行
        dispatch_async(concurrentQueue, ^{
            NSLog(@"%@", [NSThread currentThread]);
            NSLog(@"concurrent task %d", i);
        });
    }
}



@end
