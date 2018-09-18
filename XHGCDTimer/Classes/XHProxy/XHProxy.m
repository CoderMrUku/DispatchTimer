//
//  XHProxy.m
//  AboutTimer
//
//  Created by John on 2018/8/15.
//  Copyright © 2018年 UKU. All rights reserved.
//

#import "XHProxy.h"

@implementation XHProxy

+ (instancetype)proxyWithTarget:(id)target {
    XHProxy *pro = [XHProxy alloc];
    pro.target = target;
    return pro;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    [invocation invokeWithTarget:self.target];
}

@end
