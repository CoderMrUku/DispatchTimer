//
//  XHProxy.h
//  AboutTimer
//
//  Created by John on 2018/8/15.
//  Copyright © 2018年 UKU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XHProxy : NSProxy
@property(nonatomic, weak) id target;
+ (instancetype)proxyWithTarget:(id)target;
@end
