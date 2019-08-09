## 一、flutter 版微信

![WeChat](https://upload-images.jianshu.io/upload_images/13588982-6c0c3580714ee3f9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![WeChat](https://upload-images.jianshu.io/upload_images/13588982-f6131f086a69cdad.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)



## 二、project 目录

项目设计
- 工具：`Android Studio 3.4.1` 、`ApkTool`
- 流程：微信实在是一个巨大的 project ， 所以我决定先把框架搭起来，再一个模块一个模块的去完成，然后模块间分优先级，先把模块里的重点功能实现了，再修补其余功能。
那么项目实现的流程：整体框架-->重要模块的重点功能-->重要模块的次要功能-->次要模块的重点功能-->次要模块的次要功能。
- 实现：数据来源于 assets/data/ (自造 json 数据放在 assets/data/ 目录下) ，图标来源反编译微信的 apk 文件，先写静态界面，然后获取数据显示。

![2019-8-8](https://upload-images.jianshu.io/upload_images/13588982-0375634b80406e8e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

项目框架
1. BLOC 模式  + Flutter + Test
`STREAMS or REACTIVE approach. In general terms, data will be flowing from the BLOC to the UI or from UI to the BLOC in the form of streams. `
-- BLOC 模式的核心

![The BLOC pattern](https://upload-images.jianshu.io/upload_images/13588982-4e874fa73ec62861.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

2. 项目结构

![WeChat 结构](https://upload-images.jianshu.io/upload_images/13588982-ab845fb1d793b7a2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

3. 模块设计

![模块设计](https://upload-images.jianshu.io/upload_images/13588982-f237219cd41712b2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

4. 测试结构

![测试结构](https://upload-images.jianshu.io/upload_images/13588982-a7e848d5d6b7a37d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


### 三. 总结
路遥知马力，一切未完待续～
