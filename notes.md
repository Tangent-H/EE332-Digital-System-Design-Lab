# notes

## 加速编译and仿真

在windows的vivado上基本上没有显著的解决方案，一个是可以尝试调整最大线程数`set_param general.maxThreads 32`，一个就是可能可以尝试只用tcl console（但是这样实在麻烦）

在Ubuntu的vivado上，编译的速度据说有所提高（不过也不太显著），仿真的提升非常显著（可能有2-3倍），windows中增加线程的办法也可以使用，但是效果似乎不显著

如果需要极致的速度，可能需要自己配置工具链（e.g. f4pga做综合和实现，modlesim做仿真，还有烧录工具等等）

## set as top

一般习惯上，top module是直接和芯片引脚（开发板外设）挂钩的entity，在这个entity里面可以实例化其他的components（相当于自己设计的芯片，对应于vivado source design中的其他vhd文件）。

synthesis和implementation，只会去实现在top module中实例化的component，也就是说，如果有在source design中有两个互不相关的entity，那么在synthesis和implementation中，没有set as top的entity不会被实现，所以仿真的时候（testbench）里面那些没有实现的entity即便是在post-implementation中也会显示出behavioral的波形。

## synthesis & implementation自动优化

有的时候，逻辑写得越简单越好（能用behavioral的就别用structure了），这样很有可能synthesis和implementation中得到的结果会比自己想的优化方法效果还要好

（e.g. lab2ex3中，链状结果的优先编码器被优化到了和自己手动优化几乎相同的水平）

## 其他

如果真的遇到了无法解释的问题，也有可能是vivado的bug。