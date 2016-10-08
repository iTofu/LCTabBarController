# LCTabBarController

[![Travis](https://img.shields.io/travis/iTofu/LCTabBarController.svg?style=flat)](https://travis-ci.org/iTofu/LCTabBarController)
[![CocoaPods](https://img.shields.io/cocoapods/v/LCTabBarController.svg)](http://cocoadocs.org/docsets/LCTabBarController)
[![CocoaPods](https://img.shields.io/cocoapods/l/LCTabBarController.svg)](https://raw.githubusercontent.com/iTofu/LCTabBarController/master/LICENSE)
[![CocoaPods](https://img.shields.io/cocoapods/p/LCTabBarController.svg)](http://cocoadocs.org/docsets/LCTabBarController)
[![LeoDev](https://img.shields.io/badge/blog-LeoDev.me-brightgreen.svg)](http://leodev.me)
[![Join the chat at https://gitter.im/iTofu/LCTabBarController](https://badges.gitter.im/iTofu/LCTabBarController.svg)](https://gitter.im/iTofu/LCTabBarController?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

一个感天动地的高度自定义的 tabBarController！

你几乎可以自定义 100% 的属性！😍 ✨

![by http://LeoDev.me](https://raw.githubusercontent.com/iTofu/LCTabBarController/master/demo01.png)

````
In me the tiger sniffs the rose.

心有猛虎，细嗅蔷薇。
````

欢迎访问 **我的博客**：http://LeoDev.me



## 特性

* 高度解耦！
> 所有控件全部作为一个单独的类拆开，项目耦合性超低！`-->` 表示属于：
>
> LCTabBarBadge --> LCTabBarItem --> LCTabBar --> LCTabBarController

* 集成简单！
> 一步集成：把你 `AppDelegate.m` 中的 `UITabBarController` 单词替换成 `LCTabBarController` 即可完成集成！
>
> 所以，就算你项目已经完成了，你依然可以随时集成！当然你也可以随时更换回 `UITabBarController`！（但我有 200% 的把握你不会这么做！）

* 零污染！
> 拥有 `UITabBarController` 的全部功能，而没有任何入侵行为！你要做的永远只有一步！
>
> `LCTabBarController` 利用 KVO 监听系统 tabBarItem，你任何对 tabBarItem 的设置都可以继续生效！
>
> 如：viewController.tabBarItem.image = [UIImage imageNamed:@"tabbar_home"]; // 生效！
>
>    someVC.hidesBottomBarWhenPushed = YES;     // 生效！

* 高度自定义！
> 你可以自由设置下列属性，也可以选择去代码中直接改！
>
> 1. tabBar 标题字体颜色（普通、高亮等）
>
> 2. tabBar 标题字体
>
> 3. tabBar 图片所占比例
>
> 4. tabBar 小红点 frame
>
> 5. tabBar 小红点 字体
>
> 6. ...

* 如果觉得还不错，请点击右上角 star！⭐️ 谢谢！
> 我会根据 Issue 持续更新，如果你想随时了解我的进度，请点击右上角的 watch！



## CocoaPods 安装

把下面的代码添加到你的 Podfile 中：

````ruby
pod 'LCTabBarController', :git => 'https://github.com/iTofu/LCTabBarController.git' # Podfile
````



## 无 CocoaPods 安装

直接把 `LCTabBarController` 文件夹拽入你的项目中，这个文件夹可以在 Demo 中找到。



## 使用

* 在你的 `AppDelegate.m` 里面：

  ````objc
  // 0. 导入头文件
  #import "LCTabBarController.h"

  // 1. 如果你项目已经开工，哪怕已经写完了
  // 只需在 application:didFinishLaunchingWithOptions: 方法里面替换一句代码
  UITabBarController *tabBarC = [[UITabBarController alloc] init];
  ->
  LCTabBarController *tabBarC = [[LCTabBarController alloc] init];

  // 2. 如果你刚刚开始写一个新项目
  - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

      self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

      [self.window makeKeyAndVisible];

      // 示例代码
      HomeVC *vc1 = [[HomeVC alloc] init];
      vc1.view.backgroundColor = [UIColor whiteColor];
      vc1.tabBarItem.badgeValue = @"23";
      vc1.title = @"Home";
      vc1.tabBarItem.image = [UIImage imageNamed:@"tabbar_home"];
      vc1.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_home_selected"];

      // vc2 vc3 ...

      UIViewController *vc4 = [[UIViewController alloc] init];
      vc4.view.backgroundColor = [UIColor yellowColor];
      vc4.tabBarItem.badgeValue = @"99+";
      vc4.title = @"Profile";
      vc4.tabBarItem.image = [UIImage imageNamed:@"tabbar_profile"];
      vc4.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_profile_selected"];


      UINavigationController *navC1 = [[UINavigationController alloc] initWithRootViewController:vc1];
      UINavigationController *navC2 = [[UINavigationController alloc] initWithRootViewController:vc2];
      UINavigationController *navC3 = [[UINavigationController alloc] initWithRootViewController:vc3];
      UINavigationController *navC4 = [[UINavigationController alloc] initWithRootViewController:vc4];



      /**************************************** Key Code ****************************************/

      LCTabBarController *tabBarC = [[LCTabBarController alloc] init];

      tabBarC.viewControllers = @[navC1, navC2, navC3, navC4];

      self.window.rootViewController = tabBarC;

      /******************************************************************************************/



      return YES;
  }
  ````

* **搞定！**

* 你可以在通过更改 `LCTabBarController` 对象随意更改下列属性，其他更多属性可直接阅读代码更改！

  ````objc
  /**************************************** Key Code ****************************************/

  LCTabBarController *tabBarC    = [[LCTabBarController alloc] init];

  // look here, you should set this properties before `- setViewControllers:`
  tabBarC.itemTitleFont          = [UIFont boldSystemFontOfSize:11.0f];
  tabBarC.itemTitleColor         = [UIColor greenColor];
  tabBarC.selectedItemTitleColor = [UIColor redColor];
  tabBarC.itemImageRatio         = 0.5f;
  tabBarC.badgeTitleFont         = [UIFont boldSystemFontOfSize:12.0f];

  tabBarC.viewControllers        = @[navC1, navC2, navC3, navC4];

  self.window.rootViewController = tabBarC;

  /******************************************************************************************/
  ````

  Than you could see like this:

  ![by http://LeoDev.me](https://raw.githubusercontent.com/iTofu/LCTabBarController/master/CustomProperties.png)



## 示例

![by http://LeoDev.me](https://raw.githubusercontent.com/iTofu/LCTabBarController/master/demo01.png)
---
![by http://LeoDev.me](https://raw.githubusercontent.com/iTofu/LCTabBarController/master/demo02.png)
---
![by http://LeoDev.me](https://raw.githubusercontent.com/iTofu/LCTabBarController/master/demo03.png)
---
![by http://LeoDev.me](https://raw.githubusercontent.com/iTofu/LCTabBarController/master/demo04.png)



## 版本

### V 1.3.5

* 修复 #13，Merged [sunnysuhappy](https://github.com/sunnysuhappy)'s pull #14。

### V 1.3.3

* 更新 CocoaPods 来源。

### V 1.3.0

* 修复使用 Swift + CocoaPods 时 bundle 找不到的问题。

* 支持 [building](https://travis-ci.org/)。


### V 1.2.7

* 修复 Bug: [Issues 3](https://github.com/iTofu/LCTabBarController/issues/3), 感谢 [Sesadev](https://github.com/Sesadev) 的提交!


### V 1.2.6

* 修复 Bug：

  当调用 `- popToRootViewController` 方法后，系统的 tabbar 原有控件又重新显示出来了。
  你可以在调用 `- popToRootViewController` 方法后，调用 `- removeOriginControls` 方法，像这样：

  ````objc
  [self.navigationController popToRootViewControllerAnimated:YES];

  [(LCTabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController removeOriginControls];
  ````


### V 1.2.5

* 改善自定义属性的方法，体验更佳！



### V 1.2.2

* `tabBarItem` 中的 `imageView` 的 `contentModel` 修改为 `UIViewContentModeCenter`。


### V 1.2.1

* 修正 `tabBarBadge` 的 `x`。


### V 1.2.0

* 公众版本。


### V 1.1.0

* 适配 [揽梦云签](http://itunes.apple.com/cn/app/id1006513728)。

* V 1.1.x 将为揽梦科技专用。


### V 1.0.6

* 适配 [揽梦云签](http://itunes.apple.com/cn/app/id1006513728)。


### V 1.0.5

* `tabBarItem` 中的 `imageView` 的 `contentModel` 修改为 `UIViewContentModeScaleAspectFit`。


### V 1.0.3

* 删除一些日志打印。

* 更新 demo 图片。


### V 1.0.2

* UI 调整。


### V 1.0.1

* Bug 修复。


### V 1.0.0

* 初始化提交。

* 添加 [CocoaPods](https://cocoapods.org/) 支持。



## 联系

* 有问题请直接提交 [Issue](https://github.com/iTofu/LCTabBarController/issues/new) :)

* Mail: devtip@163.com

* Blog: http://LeoDev.me



### 授权

本项目采用 [MIT license](http://opensource.org/licenses/MIT) 开源，你可以利用采用该协议的代码做任何事情，只需要继续继承 MIT 协议即可。
