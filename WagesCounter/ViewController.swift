//
//  ViewController.swift
//  WagesCounter
//
//  Created by El You on 2021/03/19.
//

import UIKit

protocol TestProtocol {
    func test()
}

class ViewController: UIViewController, TestProtocol {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func test() {
        
    }
}

class SecondViewController: UIViewController {
    var proto: TestProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        proto = ViewController()
        proto?.test()
        
    }
}

