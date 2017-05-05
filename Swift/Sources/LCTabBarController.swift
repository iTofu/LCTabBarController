//
//  LCTabBarController.swift
//  LCTabBarController
//
//  Created by Leo on 05/05/2017.
//
//  Copyright (c) 2015-2017 Leo <leodaxia@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.


import UIKit


@objc
public protocol LCTabBarControllerDelegate : NSObjectProtocol {
    
    
    @objc
    optional func tabBarController(_ tabBarController: LCTabBarController, shouldSelect viewController: UIViewController) -> Bool
    
    @objc
    optional func tabBarController(_ tabBarController: LCTabBarController, didSelect viewController: UIViewController)
    
    
    @objc
    optional func tabBarController(_ tabBarController: LCTabBarController, willBeginCustomizing viewControllers: [UIViewController])
    
    @objc
    optional func tabBarController(_ tabBarController: LCTabBarController, willEndCustomizing viewControllers: [UIViewController], changed: Bool)
    
    @objc
    optional func tabBarController(_ tabBarController: LCTabBarController, didEndCustomizing viewControllers: [UIViewController], changed: Bool)
    
    
    @objc
    optional func tabBarControllerSupportedInterfaceOrientations(_ tabBarController: LCTabBarController) -> UIInterfaceOrientationMask
    
    @objc
    optional func tabBarControllerPreferredInterfaceOrientationForPresentation(_ tabBarController: LCTabBarController) -> UIInterfaceOrientation
    
    
    @objc
    optional func tabBarController(_ tabBarController: LCTabBarController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning?
    
    
    @objc
    optional func tabBarController(_ tabBarController: LCTabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning?
}


open class LCTabBarController: UIViewController {
    
    open var viewControllers: [UIViewController]?
    
    // If the number of view controllers is greater than the number displayable by a tab bar, a "More" navigation controller will automatically be shown.
    // The "More" navigation controller will not be returned by -viewControllers, but it may be returned by -selectedViewController.
    open func setViewControllers(_ viewControllers: [UIViewController]?, animated: Bool) {}
    
    
//    unowned(unsafe) open var selectedViewController: UIViewController? // This may return the "More" navigation controller if it exists.
    
    open var selectedIndex: Int = 0
    
    
    open var moreNavigationController: UINavigationController { return UINavigationController() } // Returns the "More" navigation controller, creating it if it does not already exist.
    
    open var customizableViewControllers: [UIViewController]? // If non-nil, then the "More" view will include an "Edit" button that displays customization UI for the specified controllers. By default, all view controllers are customizable.
    
    
    open var tabBar: LCTabBar { return LCTabBar() } // Provided for -[UIActionSheet showFromTabBar:]. Attempting to modify the contents of the tab bar directly will throw an exception.
    
    
    weak open var delegate: LCTabBarControllerDelegate?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension LCTabBarController: LCTabBarDelegate {
    
    
}
