//
//  RootViewController.swift
//  WagesCounter
//
//  Created by El You on 2021/03/23.
//

import UIKit
import RxSwift


class RootViewController: UIViewController {
    var proxy: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        initializeAppComponent()
    }
    
    private func initializeAppComponent() {
        DispatchQueue.main.asyncAfter(deadline: .now() + AppConstants.Delay.LaunchScreen) { [weak self] in
            self?.switchViewController(type: .splash, transitionStyle: .partialCurl, completion: nil)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + AppConstants.Delay.Splash) { [weak self] in
            self?.switchViewController(type: .home, transitionStyle: .crossDissolve, completion: nil)
        }
    }
    
    private func switchViewController(type: ViewController,
                              presentationStyle: UIModalPresentationStyle = .fullScreen,
                              transitionStyle: UIModalTransitionStyle = .coverVertical,
                              completion: (() -> Void)?) {
        if let currentVC = proxy {
            currentVC.dismiss(animated: true, completion: nil)
            proxy = nil
        }
        proxy = type.viewController
        proxy?.modalPresentationStyle = presentationStyle
        proxy?.modalTransitionStyle = transitionStyle
        guard let vc = proxy else { return }
        present(vc, animated: true, completion: completion)
    }
}

extension RootViewController {
    /// 表示するVCの種類
    enum ViewController: CaseIterable {
        case splash
        case home
        var viewController: UIViewController {
            switch self {
                case .splash:
                    return SplashViewController()
                case .home:
                    return HomeViewController()
            }
        }
    }
}
