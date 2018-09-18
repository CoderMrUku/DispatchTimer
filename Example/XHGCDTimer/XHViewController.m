//
//  ViewController.m
//  AboutTimer
//
//  Created by John on 2018/8/15.
//  Copyright © 2018年 UKU. All rights reserved.
//

#import "XHViewController.h"
#import "XHProxy.h"
#import "XHTimer.h"

@interface XHViewController ()
@property(nonatomic, strong) CADisplayLink *link;
@property(nonatomic, strong) NSString *timer;
@end

@implementation XHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _GCDTimer];
//    [self _test];
    
}

#pragma mark - GCD定时器
- (void)_GCDTimer {

    _timer = [XHTimer doTask:^{
                  NSLog(@"111");
    }
                       start:2.0
                    interval:1.0
                     repeats:YES
                       async:YES];
    NSLog(@"timer_begin");
}
- (void)dealloc {
    NSLog(@"%s", __func__);
    [XHTimer cancelTimer:_timer];
}
#pragma mark - CADisplayLink定时器的循环引用问题解决方案

//- (void)_test {
//
//    _link = [CADisplayLink displayLinkWithTarget:[XHProxy proxyWithTarget:self]
//                                        selector:@selector(task)];
//
//    [_link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
//}
//
//- (void)task {
//    NSLog(@"111");
//}
//
//- (void)dealloc {
//    NSLog(@"%s", __func__);
//    [_link invalidate];
//}




@end
