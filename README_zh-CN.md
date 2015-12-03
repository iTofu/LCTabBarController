# LCTabBarController
一个感天动地的高度自定义的 tabBarController！

你几乎可以自定义 100% 的属性！

![LCTabBarController](https://github.com/LeoiOS/LCTabBarController/blob/master/demo01.png)

````
In me the tiger sniffs the rose.

心有猛虎，细嗅蔷薇。
````



## 特点

* 高度解耦。
> 所有控件全部作为一个单独的类拆开，项目耦合性超低！`-->` 表示属于：
>
> LCTabBarBadge --> LCTabBarItem --> LCTabBar --> LCTabBarController

* 集成简单。
> 把你 `AppDelegate.m` 中的 `UITabBarController` 单词替换成 `LCTabBarController` 即可完成集成！
>
> 所以就算你项目已经完成了，你依然可以随时集成！你也可以随时更换回 `UITabBarController`！（但我有 200% 的把握你不会这么做！）

* 零污染。
> 拥有 `UITabBarController` 的全部功能，而没有任何入侵行为！你要做的永远只有一步！
>
> `LCTabBarController` 利用 KVO 监听系统 tabBarItem，你任何对 tabBarItem 的设置都可以继续生效！
>
> 如：viewController.tabBarItem.image = [UIImage imageNamed:@"tabbar_home"]; // 生效！
>
>    someVC.hidesBottomBarWhenPushed = YES;     // 生效！

* 高度自定义。
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
> ...



## CocoaPods 安装

````ruby
pod 'LCTabBarController'
````



## 无 CocoaPods 安装

直接把 `LCTabBarController` 文件夹拽入你的项目中，这个文件夹可以在 Demo 中找到。



## 使用

* 在你的 `AppDelegate.m` 里面：
````objc
// 导入头文件
#import "LCTabBarController.h"

// 1. 如果你项目已经开工，哪怕已经写完了
// 只需在 application:didFinishLaunchingWithOptions: 方法里面替换一句代码
````objc
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
    
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.view.backgroundColor = [UIColor cyanColor];
    vc2.tabBarItem.badgeValue = @"1";
    vc2.title = @"Message";
    vc2.tabBarItem.image = [UIImage imageNamed:@"tabbar_message_center"];
    vc2.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_message_center_selected"];
    
    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.view.backgroundColor = [UIColor redColor];
    vc3.title = @"Discover";
    vc3.tabBarItem.image = [UIImage imageNamed:@"tabbar_discover"];
    vc3.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_discover_selected"];
    
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

* 搞定！

* 你可以在 `LCTabBarCONST.h/.m` 中随意更改下列属性，其他更多属性可直接阅读代码更改！
````objc
#define LC_TABBAR_ITEM_TITLE_COLOR      // tabBar 标题字体颜色
#define LC_TABBAR_ITEM_TITLE_COLOR_HL   // tabBar 标题字体颜色 (高亮)

const CGFloat LCTabBarItemImageRatio     = 0.70f;   // tabBar 图片所占比例
const CGFloat LCTabBarItemTitleFontSize  = 10.0f;   // tabBar 标题字体大小
const CGFloat LCTabBarBadgeTitleFontSize = 11.0f;   // tabBar badge 字体大小
````



## 示例


![LCTabBarController](https://github.com/LeoiOS/LCTabBarController/blob/master/demo01.png)
![LCTabBarController](https://github.com/LeoiOS/LCTabBarController/blob/master/demo02.png)
![LCTabBarController](https://github.com/LeoiOS/LCTabBarController/blob/master/demo03.png)
![LCTabBarController](https://github.com/LeoiOS/LCTabBarController/blob/master/demo04.png)



## 联系

* 有问题请直接 [Issues](https://github.com/LeoiOS/LCTabBarController/issues/new) :)
* Email:leoios@sina.com & liucsuper@gmail.com
* Blog: http://www.leodong.com



### 授权
本项目采用 [MIT license](http://opensource.org/licenses/MIT) 开源，你可以利用采用该协议的代码做任何事情，只需要继续继承 MIT 协议即可。
