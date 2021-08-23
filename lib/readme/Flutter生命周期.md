#Flutter 生命周期 [https://www.jianshu.com/p/7e8dff26f81a]
Flutter中一切都是Widget，渲染方式有点像H5的DOM树

Flutter生命周期可以分为3个阶段：
  1、实例化组件并添加到树， 即Navigator.push；
  2、状态变化，即打开新的widget或者依赖的上级widget发生变化；
  3、从树中移除, 即Navigator.pop。

在Flutter中Widget都是不可变的，但实际上需要根据对应的状态刷新Widget。 从而产生了StatelessWidget和StatefulWdiget, StatefulWidget是由2个对象Widget和State组成的。

为什么将State和Widget分开呢？
答案是性能， State管理状态（可以理解为Controller），Widget是UI（即View)。 根据状态变化每次生成Widget(即View）可以节省内存，即不必每次创建状态对象State。

构造函数：
同其它高级语言， 只执行一次；

initState：
插入到渲染树时调用，只执行一次。（类似Android Fragment的onCreateView函数）

build：
绘制界面，当setState触发的时候会再次被调用

didChangeDependencies：
1、在初始化initState后执行； 2、显示/关闭其它widget。 3、可执行多次；

didUpdateWidget：
上级节点rebuild widget时， 即上级组件状态发生变化时会触发子widget执行didUpdateWidget;

deactivate:
有点像Android的onStop函数， 在打开新的Widget或回到这个widget时会执行； 可执行多次；

dispose：
类似于Android的onDestroy， 在执行Navigator.pop后会调用该办法， 表示组件已销毁；

reassemble：
点击闪电会执行，只用于调试时的hot reload。 release版本不会执行该函数。

常见业务场景：
  Widget A打开Widget B： Navigator.push(B)
  B构造函数--->B initState--->B didChangeDependencies--->B build--->A deactive--->A didChangeDependencies.
  Widget B退出： Navigator.pop
  A deactive--->A didChangeDependencies--->A build--->B deactive--->B dispose
  可以看出，Flutter打开、关闭Widget时跟安卓、iOS的时序一样， 都是先处理即将显示的界面。

activity生命周期和Flutter对应关系：
Flutter提供了WidgetsBindingObserver来监听AppLifecycleState， 而AppLifecycleState有4种状态：
   1、resumed 界面可见， 同安卓的onResume。
   2、inactive界面退到后台或弹出对话框情况下， 即失去了焦点但仍可以执行drawframe回调；同安卓的onPause；
   3、paused应用挂起，比如退到后台，失去了焦点且不会收到drawframe回调；同安卓的onStop；
   4、suspending， iOS中没用，安卓里就是挂起，不会再执行drawframe回调；

1、初次打开widget时，不执行AppLifecycleState的回调；
2、按home键或Power键， AppLifecycleState inactive---->AppLifecycleState pause
3、从后台到前台：AppLifecycleState inactive--->ApplifecycleState resumed
4、back键退出应用： AppLifecycleState inactive--->AppLifecycleState paused