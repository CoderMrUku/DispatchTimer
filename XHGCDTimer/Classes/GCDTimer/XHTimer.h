//
//  XHGCDTimer.h
//  AboutTimer
//
//  Created by John on 2018/8/15.
//  Copyright © 2018年 UKU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XHTimer : NSObject

/**
 执行定时任务（使用block）

 @param blockTask 任务
 @param startTime 定时器开启前的等待时间
 @param timeInterval 间隔（只有当repeats为YES时有效）
 @param repeats 是否重复
 @param async 是否异步执行任务
 @return 定时器名称
 */
+ (NSString *)doTask:(void(^)(void))blockTask
               start:(NSTimeInterval)startTime
            interval:(NSTimeInterval)timeInterval
             repeats:(BOOL)repeats
               async:(BOOL)async;

/**
 执行定时任务

 @param selTask 任务
 @param target 对象
 @param startTime 定时器开启前的等待时间
 @param timeInterval 间隔（只有当repeats为YES时有效）
 @param repeats 是否重复
 @param async 是否异步执行任务
 @return 定时器名称
 */
+ (NSString *)doTask:(SEL)selTask
              target:(id)target
               start:(NSTimeInterval)startTime
            interval:(NSTimeInterval)timeInterval
             repeats:(BOOL)repeats
               async:(BOOL)async;

/**
 停止定时器

 @param name 名称
 */
+ (void)cancelTimer:(NSString *)name;

@end
