//
//  XHGCDTimer.m
//  AboutTimer
//
//  Created by John on 2018/8/15.
//  Copyright © 2018年 UKU. All rights reserved.
//

#import "XHTimer.h"

@implementation XHTimer

static dispatch_semaphore_t dsema_;
static NSMutableDictionary *timers_;

+ (void)initialize {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        timers_ = [NSMutableDictionary dictionary];
        dsema_ = dispatch_semaphore_create(1);
    });
}

+ (NSString *)doTask:(SEL)selector
              target:(id)target
               start:(NSTimeInterval)startTime
            interval:(NSTimeInterval)timeInterval
             repeats:(BOOL)repeats
               async:(BOOL)async {
    
    if (!target || !selector) return nil;
    
    __weak typeof (target)weakTarget = target;
    return [self doTask:^{
        if ([weakTarget respondsToSelector:selector]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [weakTarget performSelector:selector];
#pragma clang diagnostic pop
        }
    }
                  start:startTime
               interval:timeInterval
                repeats:repeats
                  async:async];
}

+ (NSString *)doTask:(void(^)(void))task
               start:(NSTimeInterval)startTime
            interval:(NSTimeInterval)timeInterval
             repeats:(BOOL)repeats
               async:(BOOL)async {
    
    if (!task || startTime < 0 || (timeInterval <= 0 && repeats)) {
        return nil;
    }
    
    // 队列
    dispatch_queue_t queue = async ? dispatch_get_global_queue(0, 0) : dispatch_get_main_queue();
    
    // 创建定时器
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    // 设置时间
    dispatch_source_set_timer(timer,
                              dispatch_time(DISPATCH_TIME_NOW, startTime * NSEC_PER_SEC),
                              timeInterval * NSEC_PER_SEC,
                              0);
    
    // 存放到字典中
    dispatch_semaphore_wait(dsema_, DISPATCH_TIME_FOREVER);
    NSString *timerKey = [NSString stringWithFormat:@"%lu", timers_.count+1];
    timers_[timerKey] = timer;
    dispatch_semaphore_signal(dsema_);
    
    // 定时器回调
    dispatch_source_set_event_handler(timer, ^{
        
        task();
        
        if (!repeats) {
            [self cancelTimer:timerKey];
        }
    });
    
    // 启动定时器
    dispatch_resume(timer);
    
    return timerKey;
}

+ (void)cancelTimer:(NSString *)name {
    
    if (0 == name.length) return;
    
    dispatch_semaphore_wait(dsema_, DISPATCH_TIME_FOREVER);
    
    dispatch_source_t timer = timers_[name];
    if (timer) {
        dispatch_source_cancel(timer);
        [timers_ removeObjectForKey:timer];
    }
    
    dispatch_semaphore_signal(dsema_);
}

@end
