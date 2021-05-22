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

        let input = viewStream.input
        let output = viewStream.output

        homeView.o2Button.rx.tap
            .bind(to: input.o2ButtonTap)
            .disposed(by: disposeBag)

        homeView.settingButton.rx.tap
            .bind(to: input.settingButtonTap)
            .disposed(by: disposeBag)

        output.isWaging
            .subscribe { [weak self] value in
                self?.homeView.o2Button.setTitle(value.element ?? false ? "Stop" : "Start", for: .normal)
            }
            .disposed(by: disposeBag)

        output.updateWage
            .map({ element -> (String, String) in
//                var formatter = DateFormatter()
//                formatter.dateFormat = "hh:mm:ss"
//                let targetDate = Date(timeIntervalSinceReferenceDate: element.time)
//                let time = formatter.string(from: targetDate)
                let time = String(format: "%02i:%02i:%02i", Int(element.time) / 3600, Int(element.time) / 60 % 60, Int(element.time) % 60)
                let wage = "￥\(Int(element.wage))"
                return (time, wage)
            })
            .subscribe { [weak self] time, wage in
                self?.homeView.clockLabel.rx.text.onNext(time)
                self?.homeView.wageLabel.rx.text.onNext(wage)
            }
            .disposed(by: disposeBag)
        
        output.openSettingVC
            .subscribe { [weak self] _ in
                let vc = UINavigationController(rootViewController: SettingViewController())
                vc.modalPresentationStyle = .formSheet

                self?.present(vc, animated: true) {
                    self?.loadViewIfNeeded()
                }
            }
            .disposed(by: disposeBag)
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
