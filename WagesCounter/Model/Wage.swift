//
//  Wage.swift
//  WagesCounter
//
//  Created by El You on 2021/05/22.
//

import Foundation

struct Wage {
    private var appData = AppData()
    /// get set
    var time: Double {
        get {
            return appData.currentTime
        }

        set {
            appData.currentTime = newValue
        }
    }
    
    /// get set
    var hwage: Int {
        get {
            return appData.hwage
        }
        
        set {
            appData.hwage = newValue
        }
    }
    
    /// get
    var wage: Double {
        get {
            return appData.wage
        }
        
        set {
            appData.wage = newValue
        }
    }
    
    
}
