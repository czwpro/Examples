//
//  ViewController.m
//  NSThread
//
//  Created by czw on 2018/7/11.
//  Copyright © 2018年 czw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 使用 currentThread 可以获取到当前的线程
    NSLog(@"%@", [NSThread currentThread]);
//    [self demo01];
//    [self demo02];
}

- (void)demo01 {
    
    // 创建一个线程
//    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(taskAction) object:nil];
//    thread.name = @"new Thread";
//    // 启用线程并执行任务
//    [thread start];
    
    
//    [NSThread detachNewThreadSelector:@selector(taskAction) toTarget:self withObject:nil];
    
    [NSThread detachNewThreadWithBlock:^{
        NSLog(@"%@", [NSThread currentThread]);
        NSLog(@"doing something");
        [self performSelectorOnMainThread:@selector(updateUI) withObject:nil waitUntilDone:NO];
    }];
}

- (void)demo02 {
    [NSThread detachNewThreadWithBlock:^{
        NSLog(@"do something");
        // 回到主线程
        [self performSelectorOnMainThread:@selector(updateUI) withObject:nil waitUntilDone:NO];
        
        NSLog(@"other things");
    }];
}

#pragma mark - Task Actions
// 耗时任务
- (void)taskAction {
    NSLog(@"%@", [NSThread currentThread]);
    NSLog(@"do something");
    
    // 回到主线程
    [self performSelectorOnMainThread:@selector(updateUI) withObject:nil waitUntilDone:NO];
}

- (void)updateUI {
    // 进行UI的更新
    NSLog(@"update UI");
}

@end
