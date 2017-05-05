//
//  LCTabBar.swift
//  Pods
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
public protocol LCTabBarDelegate {
    
    @objc
    optional func tabBar(_ tabBar: LCTabBar, didSelect item: UITabBarItem) // called when a new view is selected by the user (but not programatically)
    
    
    /* called when user shows or dismisses customize sheet. you can use the 'willEnd' to set up what appears underneath.
     changed is YES if there was some change to which items are visible or which order they appear. If selectedItem is no longer visible,
     it will be set to nil.
     */
    
    @objc
    optional func tabBar(_ tabBar: LCTabBar, willBeginCustomizing items: [UITabBarItem]) // called before customize sheet is shown. items is current item list
    
    @objc
    optional func tabBar(_ tabBar: LCTabBar, didBeginCustomizing items: [UITabBarItem]) // called after customize sheet is shown. items is current item list
    
    @objc
    optional func tabBar(_ tabBar: LCTabBar, willEndCustomizing items: [UITabBarItem], changed: Bool) // called before customize sheet is hidden. items is new item list
    
    @objc
    optional func tabBar(_ tabBar: LCTabBar, didEndCustomizing items: [UITabBarItem], changed: Bool) // called after customize sheet is hidden. items is new item list
}

open class LCTabBar: UIView {
    
    weak open var delegate: LCTabBarDelegate? // weak reference. default is nil
    
    open var items: [UITabBarItem]? // get/set visible UITabBarItems. default is nil. changes not animated. shown in order
    
    weak open var selectedItem: UITabBarItem? // will show feedback based on mode. default is nil
    
    
    open func setItems(_ items: [UITabBarItem]?, animated: Bool) {} // will fade in or out or reorder and adjust spacing
    
    
    // Reorder items. This will display a sheet with all the items listed, allow the user to change/reorder items and shows a 'Done' button at the top
    
    open func beginCustomizingItems(_ items: [UITabBarItem]) {} // list all items that can be reordered. always animates a sheet up. visible items not listed are fixed in place
    
    open func endCustomizing(animated: Bool) -> Bool { return true } // hide customization sheet. normally you should let the user do it. check list of items to see new layout. returns YES if layout changed
    
    
    open var isCustomizing: Bool { return false }
    
    
//    /*
//     The behavior of tintColor for bars has changed on iOS 7.0. It no longer affects the bar's background
//     and behaves as described for the tintColor property added to UIView.
//     To tint the bar's background, please use -barTintColor.
//     */
//    open var tintColor: UIColor! = .yellow
    
    open var barTintColor: UIColor? // default is nil
    
    /// Unselected items in this tab bar will be tinted with this color. Setting this value to nil indicates that UITabBar should use its default value instead.
    @NSCopying open var unselectedItemTintColor: UIColor?
    
    
    /* The background image will be tiled to fit, even if it was not created via the UIImage resizableImage methods.
     */
    open var backgroundImage: UIImage?
    
    
    /* The selection indicator image is drawn on top of the tab bar, behind the bar item icon.
     */
    open var selectionIndicatorImage: UIImage?
    
    
    /* Default is nil. When non-nil, a custom shadow image to show instead of the default shadow image. For a custom shadow to be shown, a custom background image must also be set with -setBackgroundImage: (if the default background image is used, the default shadow image will be used).
     */
    open var shadowImage: UIImage?
    
    
    /*
     Default is UITabBarItemPositioningAutomatic. The tab bar items fill horizontally
     for the iPhone user interface idiom, and are centered with a default width and
     inter-item spacing (customizable with the itemWidth and itemSpacing
     properties) for the iPad idiom. When the tab bar is owned by a UITabBarController
     further heuristics may determine the positioning for UITabBarItemPositioningAutomatic.
     Use UITabBarItemPositioningFill to force the items to fill horizontally.
     Use UITabBarItemPositioningCenter to force the items to center with a default
     width (or the itemWidth, if set).
     */
    open var itemPositioning: UITabBarItemPositioning = .automatic
    
    
    /*
     Set the itemWidth to a positive value to be used as the width for tab bar items
     when they are positioned as a centered group (as opposed to filling the tab bar).
     Default of 0 or values less than 0 will be interpreted as a system-defined width.
     */
    open var itemWidth: CGFloat = 0.0
    
    
    /*
     Set the itemSpacing to a positive value to be used between tab bar items
     when they are positioned as a centered group.
     Default of 0 or values less than 0 will be interpreted as a system-defined spacing.
     */
    open var itemSpacing: CGFloat = 0.0
    
    
    /*
     Valid bar styles are UIBarStyleDefault (default) and UIBarStyleBlack.
     */
    open var barStyle: UIBarStyle = .default
    
    
    /*
     Default is YES.
     You may force an opaque background by setting the property to NO.
     If the tab bar has a custom background image, the default is inferred from the alpha
     values of the image—YES if it has any pixel with alpha < 1.0
     If you send setTranslucent:YES to a tab bar with an opaque custom background image
     the tab bar will apply a system opacity less than 1.0 to the image.
     If you send setTranslucent:NO to a tab bar with a translucent custom background image
     the tab bar will provide an opaque background for the image using the bar's barTintColor if defined, or black
     for UIBarStyleBlack or white for UIBarStyleDefault if barTintColor is nil.
     */
    open var isTranslucent: Bool = true
    
//    public override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//    
//    required public init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
}
