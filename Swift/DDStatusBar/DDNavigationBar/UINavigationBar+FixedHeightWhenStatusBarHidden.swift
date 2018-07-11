
//
//  UINavigationBar+FixedHeightWhenStatusBarHidden.swift
//  DDNavigationBar
//
//  Created by czw on 2017/9/3.
//  Copyright © 2017年 czw. All rights reserved.
//

import Foundation
import UIKit

private let swizzling: (AnyClass, Selector, Selector) -> () = { forClass, originalSelector, swizzledSelector in
    let originalMethod = class_getInstanceMethod(forClass, originalSelector)
    let swizzledMethod = class_getInstanceMethod(forClass, swizzledSelector)
    method_exchangeImplementations(originalMethod, swizzledMethod)
}

private var FixedNavigationBarSize: String = "FixedNavigationBarSize"

extension UINavigationBar {
    
    var fixedHeightWhenStatusBarHidden: Bool {
        get {
            guard (objc_getAssociatedObject(self, &FixedNavigationBarSize) != nil) else {
                return false
            }
            
            return objc_getAssociatedObject(self, &FixedNavigationBarSize) as! Bool
        }
        
        set (newValue) {
            objc_setAssociatedObject(self, &FixedNavigationBarSize, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    func sizeThatFits_fixedHeightWhenStatusBarHidden(size: CGSize) -> CGSize{
        
        if UIApplication.shared.isStatusBarHidden, #available(iOS 7.0, *), fixedHeightWhenStatusBarHidden {
            
            let newSize = CGSize(width: self.frame.size.width, height: 64)
            return newSize;
            
        } else {
            return self.sizeThatFits_fixedHeightWhenStatusBarHidden(size: size);
        }
        
    }

    // 过时写法 || swift3.1中已经没有了initialize
    override open class func initialize() {
        method_exchangeImplementations(class_getInstanceMethod(self, #selector(sizeThatFits(_:))),
                                       class_getInstanceMethod(self, #selector(sizeThatFits_fixedHeightWhenStatusBarHidden(size:))))
    }
    
    
}

