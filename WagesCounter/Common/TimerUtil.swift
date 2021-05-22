//
//  TimerUtil.swift
//  WagesCounter
//
//  Created by El You on 2021/05/22.
//

import Foundation
import RxSwift
import RxRelay

class TimerUtil {
    let interval: Double = 1
    let clock = PublishRelay<Void>()
    private let subscription: DisposeBag = .init()
    private let observable: Observable<Int>


    init() {
        observable = .interval(.milliseconds(Int(interval*1000)), scheduler: MainScheduler.instance)
        observable
            .subscribe { [weak self] _ in
                self?.clock.accept(())
            }
            .disposed(by: subscription)
    }
}
