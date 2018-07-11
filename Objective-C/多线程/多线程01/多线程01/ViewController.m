//
//  ViewController.m
//  多线程01
//
//  Created by czw on 2018/7/3.
//  Copyright © 2018年 czw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, assign) BOOL finished;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSThread *thread = [[NSThread alloc] initWithTarget: self selector: @selector(methodOne) object: nil];
    [thread start];
    
    [self performSelector:@selector(methodTwo) onThread:thread withObject:nil waitUntilDone:NO];
    
}

- (void)methodOne {
    NSLog(@"thread %@ come in", [NSThread currentThread]);
    
    while (!_finished) {
        [[NSRunLoop currentRunLoop] runMode: NSDefaultRunLoopMode beforeDate: [NSDate dateWithTimeIntervalSinceNow:0.1]];
    }
    
    NSLog(@"thread %@ come out", [NSThread currentThread]);
}

- (void)methodTwo {
    
    NSLog(@"method Two");
    
    _finished = YES;
    
}

@end
