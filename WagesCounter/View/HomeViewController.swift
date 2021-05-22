//
//  HomeViewController.swift
//  WagesCounter
//
//  Created by El You on 2021/03/23.
//

import RxSwift
import UIKit
import Unio
import SnapKit

final class HomeViewController: UINavigationController {

    let viewStream: HomeViewStreamType = HomeViewStream()
    let homeView: HomeView = HomeView()
    private let disposeBag = DisposeBag()
    
    override func loadView() {
        super.loadView()
        view = homeView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.layoutIfNeeded()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppConstants.Color.BackGround
        navigationBar.setColors(background: AppConstants.Color.Dark, text: AppConstants.Color.Text)
        /*
         *  EXAMPLE:
         *
         *  let input = viewStream.input
         *
         *  button.rx.tap
         *      .bind(to: input.accept(for: \.buttonTap))
         *      .disposed(by: disposeBag)
         */

        /*
         *  EXAMPLE:
         *
         *  let output = viewStream.output
         *
         *  output.observable(for: \.isEnabled)
         *      .bind(to: button.rx.isEnabled)
         *      .disposed(by: disposeBag)
         *
         *  print("rawValue of isEnabled = \(output.value(for: \.isEnabled))")
         */
    }
}
