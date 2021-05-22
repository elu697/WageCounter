//
//  SettingViewController.swift
//  WagesCounter
//
//  Created by El You on 2021/05/22.
//

import RxSwift
import UIKit
import Unio

final class SettingViewController: UIViewController {

    let viewStream: SettingViewStreamType = SettingViewStream()
    let settingView: SettingView = SettingView()
    private let disposeBag = DisposeBag()
    
    
    override func loadView() {
        super.loadView()
        view = settingView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
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
