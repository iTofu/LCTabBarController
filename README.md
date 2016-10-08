# LCTabBarController

[![Travis](https://img.shields.io/travis/iTofu/LCTabBarController.svg?style=flat)](https://travis-ci.org/iTofu/LCTabBarController)
[![CocoaPods](https://img.shields.io/cocoapods/v/LCTabBarController.svg)](http://cocoadocs.org/docsets/LCTabBarController)
[![CocoaPods](https://img.shields.io/cocoapods/l/LCTabBarController.svg)](https://raw.githubusercontent.com/iTofu/LCTabBarController/master/LICENSE)
[![CocoaPods](https://img.shields.io/cocoapods/p/LCTabBarController.svg)](http://cocoadocs.org/docsets/LCTabBarController)
[![LeoDev](https://img.shields.io/badge/blog-LeoDev.me-brightgreen.svg)](http://leodev.me)
[![Join the chat at https://gitter.im/iTofu/LCTabBarController](https://badges.gitter.im/iTofu/LCTabBarController.svg)](https://gitter.im/iTofu/LCTabBarController?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

A amazing and highly customized tabBarController! You could almost customize 100% properties with LCTabBarController! 😍 ✨

![by http://LeoDev.me](https://raw.githubusercontent.com/iTofu/LCTabBarController/master/demo01.png)

````
In me the tiger sniffs the rose.

心有猛虎，细嗅蔷薇。
````

Welcome to my blog: http://LeoDev.me



**[中文介绍](https://github.com/iTofu/LCTabBarController/blob/master/README_zh-CN.md)**



## Feature

* Highly decoupled!
> Each control is a independent class! `-->` means "be possessed":
>
> LCTabBarBadge --> LCTabBarItem --> LCTabBar --> LCTabBarController

* Simple integration!
> Integration takes only one step: Just replace the `UITabBarController` word in your `AppDelegate.m` with `LCTabBarController` to complete the integration!

* Non-Pollution!
> `LCTabBarController` has all the functions of `UITabBarController`, and NO any intrusion behavior!
>
> So, even if your project is complete, you could integrated at any time! You could also change back to `UITabBarController`! (But I 200% believe you won't do it!)

* Highly customized!
> You can freely set the following properties, you can also choose to modify the code directly!
>
> 1. tabBar title color
>
> 2. tabbar title font
>
> 3. tabbar image ratio
>
> 4. tabbar badge frame
>
> 5. tabbar badge font
>
> 6. ...

* If you feel good, please give me a star, thank you very much! ⭐️
> I will keep update with new Issue, if you want to know my progress at any time, please click on the `watch` button in the upper right corner!


**⚠️ NOTE: It doesn't support Storyboard for the time being!**



## Installation

LCTabBarController is available on [CocoaPods](https://cocoapods.org/). Just add the following to your project Podfile:

````ruby
pod "LCTabBarController"    # Podfile
````



## Non-CocoaPods Installation

Just drag the LCTabBarController folder into your project.



## Usage

* Inside your `AppDelegate.m`:

  ````objc
  // 0. Import header file
  #import "LCTabBarController.h"

  // 1. If you have already started the project, even if it's already done.
  UITabBarController *tabBarC = [[UITabBarController alloc] init];
  ->
  LCTabBarController *tabBarC = [[LCTabBarController alloc] init];

  // 2. If you're just starting to write a new project
  - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

      self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

      [self.window makeKeyAndVisible];

      // Other code
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

* **Done!**

* You can change the following properties with `LCTabBarController` object, other more attributes can be directly read code changes!

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



## Example

![by http://LeoDev.me](https://raw.githubusercontent.com/iTofu/LCTabBarController/master/demo01.png)
---
![by http://LeoDev.me](https://raw.githubusercontent.com/iTofu/LCTabBarController/master/demo02.png)
---
![by http://LeoDev.me](https://raw.githubusercontent.com/iTofu/LCTabBarController/master/demo03.png)
---
![by http://LeoDev.me](https://raw.githubusercontent.com/iTofu/LCTabBarController/master/demo04.png)



## CHANGELOG

### V 1.3.5

* Fix #13，Merged [sunnysuhappy](https://github.com/sunnysuhappy)'s pull #14。

### V 1.3.3

* Update CocoaPods source URL.


### V 1.3.0

* Bug fixed: Can't find right bundle when using Swift & CocoaPods.

* [building](https://travis-ci.org/) support.


### V 1.2.7

* Bug fixed: [Issues 3](https://github.com/iTofu/LCTabBarController/issues/3), thanks [Sesadev](https://github.com/Sesadev)'s commit!



### V 1.2.6

* Bug fixed:

  When I call the `- popToRootViewController;` method, the origin controls of the system's tabbar is displayed again.

  Now, You could call `[lcTabBarController removeOriginControls];` method after `- popToRootViewController;`, like this:

  ````objc
  [self.navigationController popToRootViewControllerAnimated:YES];

  [(LCTabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController removeOriginControls];
  ````


### V 1.2.5

* Change custom way, experience better!


### V 1.2.2

* Change imageView's contentModel:

  ````objc
  tabBarItem.imageView.contentModel == UIViewContentModeScaleAspectFit;

  -->

  tabBarItem.imageView.contentModel == UIViewContentModeCenter;
  ````


### V 1.2.1

* Fix frame: `tabBarBadge`'s `x`.


### V 1.2.0

* for you!


### V 1.1.0

* for LanMeng Tec.

* V 1.1.x will for LanMeng Tec. only.


### V 1.0.6

* for LanMeng Tec.


### V 1.0.5

* Change something:

  ````objc
  tabBarItem.imageView.contentModel == UIViewContentModeCenter;

  -->

  tabBarItem.imageView.contentModel == UIViewContentModeScaleAspectFit;
  ````


### V 1.0.3

* Delete some logs.

* Update demo images.


### V 1.0.2

* UI adjustment.


### V 1.0.1

* Bug fixed.


### V 1.0.0

* Init Commit.

* [CocoaPods](https://cocoapods.org/) support.



## Support

* If you have any questions, please [commit a issue](https://github.com/iTofu/LCTabBarController/issues/new)! Thx!

* Mail: <devtip@163.com>

* Blog: http://LeoDev.me



## License

[MIT License](http://opensource.org/licenses/MIT)
