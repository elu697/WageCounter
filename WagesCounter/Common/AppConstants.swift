//
//  AppConstants.swift
//  WagesCounter
//
//  Created by El You on 2021/03/24.
//

import Foundation
import UIKit


struct AppConstants {
    struct Delay {
        /// RootVCのViewDidloadが終わる一瞬のち円 
        static var LaunchScreen: Double = 0.001
        static var Splash: Double = 1
    }
    
    struct Color {
        static var BackGround: UIColor = .init(red255: 27, green255: 27, blue255: 27, alpha: 1.0)
        static var Dark: UIColor = .init(red255: 20, green255: 20, blue255: 20, alpha: 1.0)
        static var Text: UIColor = .init(red255: 200, green255: 200, blue255: 200, alpha: 1.0)
    }
}
