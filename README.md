# IOS-timer

### 1. 添加NSTimer计时器
self.timer = [NSTimer timerWithTimeInterval:0.1 target:self selector:@selector(updateTimerInfo) userInfo:nil repeats:YES]; <br>
[[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];<br>
### 2. 添加CADisplayLink计时器
self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateTimerInfo)];<br>
// self.displayLink.duration;<br>
self.displayLink.preferredFramesPerSecond = 10; // 每秒调用10次<br>
[self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];<br>
<br>
### 3. NSRunLoop中Mode区别
model 主要是用来指定事件在运行循环中的优先级的，分为：<br>

NSDefaultRunLoopMode（kCFRunLoopDefaultMode）：默认，空闲状态<br>
UITrackingRunLoopMode：ScrollView滑动时<br>
UIInitializationRunLoopMode：启动时<br>
NSRunLoopCommonModes（kCFRunLoopCommonModes）：Mode集合<br>

#### 苹果公开提供的 Mode 有两个：
NSDefaultRunLoopMode（kCFRunLoopDefaultMode）<br>
NSRunLoopCommonModes（kCFRunLoopCommonModes）<br>
