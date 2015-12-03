# LCTabBarController
A amazing and highly customized tabBarController! You could almost customize 100% of the properties with LCTabBarController! 😍 ✨

![LCTabBarController](https://github.com/LeoiOS/LCTabBarController/blob/master/demo01.png)

````
In me the tiger sniffs the rose.

心有猛虎，细嗅蔷薇。
````

**[中文介绍](https://github.com/LeoiOS/LCTabBarController/blob/master/README_zh-CN.md)**



## Introduction

* Highly decoupled!
> Each control is a independent class! `-->` means "own":
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



## Installation

LCTabBarController is available on [CocoaPods](https://cocoapods.org/). Just add the following to your project Podfile:

pod "LCTabBarController"    # Podfile



## Non-CocoaPods Installation

Just drag the LCTabBarController folder into your project.



## Usage

* Inside your `AppDelegate.m`:
````objc
// Import header file
#import "LCTabBarController.h"

// 1. If you have already started the project, even if it's already done.
UITabBarController *tabBarC = [[UITabBarController alloc] init];


````

