//
//  AppDelegate.swift
//  WagesCounter
//
//  Created by El You on 2021/03/19.
//

import UIKit
import RxSwift
import SnapKit
import SwifterSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow? = nil

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.        
        let window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window = window
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = RootViewController()
        return true
    }
    
    
}

