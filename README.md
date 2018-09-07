# XHGCDTimer

## GCDTimer  
iOS中的定时器如NSTimer,CADisplayLink在使用中存在以下缺陷：  
1，循环引用，内存泄漏的风险；  
2，必须在同一线程创建和释放；  
3，NSTimer不准确  
  
XHGCDTimer可以有效规避以上缺陷，并且有以下特性：  
1，定时任务支持SEL和Block两种类型；  
2，支持定时器开启前摇；  
3，支持异步或者同步执行任务；  
4，支持随时取消任务。


## XHProxy
使用中间代理（NSProxy）和消息转发机制（Forward），完美规避使用定时器NSTimer,CADisplayLink的循环引用问题。
