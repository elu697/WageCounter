//
//  UINavigationControllerEx.swift
//  WagesCounter
//
//  Created by El You on 2021/03/24.
//

import Foundation
import UIKit

extension UINavigationController {
    
    override open var childForStatusBarStyle : UIViewController? {
        return self.visibleViewController
    }
    
    override open var childForStatusBarHidden: UIViewController? {
        return self.visibleViewController
    }
    
}
