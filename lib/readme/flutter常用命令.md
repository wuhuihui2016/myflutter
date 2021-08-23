搭建flutter环境[https://www.jianshu.com/p/cda416e2fc0d]

Flutter 常用命令
[https://www.cnblogs.com/teemwu/p/12105672.html]
[https://blog.csdn.net/vitaviva/article/details/105125524]

新建项目
flutter create project_name   

安装所需包
如果使用 vscode 开发，安装了相关插件的话，改动 pubspec.yaml 文件就会自动增删包。
flutter packages get  或者  flutter pub get
flutter packages get ：获取pubspec.yaml文件中列出的所有依赖包
flutter packages upgrade ：获取pubspec.yaml文件中列出的所有依赖包的最新版本
flutter pub deps：显示lib的依赖关系树

打包app
Android：flutter build apk
ios：flutter build ios

发布版本调试
flutter run  --release
发布版本测试需要连接真机方能调试。

更新 Flutter 版本
flutter upgrade
国内需要设置镜像，否则更新下载失败
mac下终端输入：
open ~/.bash_profile 
添加镜像设置：
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

可运行app的设备列表
flutter devices

修改~/.flutter_settings路径下config文件的配置
flutter config

删除build生成的文件，dart_tool目录被删除
flutter clean

flutter run
面向flutter devices中的设备，进行pub get 、build、install等一连串操作

flutter run --release
以release版本运行

flutter run --debug
以debug版本运行

flutter run -d xxx
指定目标devices ， -d 用来指定设备ID
flutter run -d macOS

flutter run --verbose
run运行过程中的详细log

安装
flutter install
将build后的产物安装到设备

测试
flutter test
执行根目录下test文件夹中的单元测试

其他
flutter screenshot
对当前链接的设备进行截屏。可以通过 --out 参数指定截屏输出路径

flutter --help
命令帮助

