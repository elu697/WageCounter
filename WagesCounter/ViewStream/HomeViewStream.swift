//
//  HomeViewStream.swift
//  WagesCounter
//
//  Created by El You on 2021/03/23.
//

import RxCocoa
import RxSwift
import Unio

protocol HomeViewStreamType: AnyObject {
    var input: InputWrapper<HomeViewStream.Input> { get }
    var output: OutputWrapper<HomeViewStream.Output> { get }
}

final class HomeViewStream: UnioStream<HomeViewStream>, HomeViewStreamType {
    convenience init(wage: Wage = .init()) {
        self.init(input: Input(),
                  state: State(),
                  extra: Extra(wage: wage))
    }
}

extension HomeViewStream {

    struct Input: InputType {
        let o2ButtonTap = PublishRelay<Void>()
        let settingButtonTap = PublishRelay<Void>()
        /*
         *  EXAMPLE:
         *
         *  let buttonTap = PublishRelay<Void>()
         */
    }

    struct Output: OutputType {
        let isWaging: Observable<Bool>
        let updateWage: Observable<Wage>
        let openSettingVC: Observable<Void>
        /*
         *  EXAMPLE:
         *
         *  let isEnabled: Observable<Bool>
         */
    }

    struct State: StateType {
        let isWaging = BehaviorRelay<Bool>(value: false)
        /*
         *  EXAMPLE:
         *
         *  let isEnabled = BehaviorRelay<Bool>(value: true)
         */
    }

    struct Extra: ExtraType {
        let wage: Wage
    }

    static func bind(from dependency: Dependency<Input, State, Extra>, disposeBag: DisposeBag) -> Output {

        let state = dependency.state
        let input = dependency.inputObservables
        var wage = dependency.extra.wage
        let clock = TimerUtil()

        let isWaging = state.isWaging
        let updateWage = BehaviorRelay<Wage>(value: wage)
        let openSettingVC = input.settingButtonTap

        input.o2ButtonTap
            .map({ _ in !state.isWaging.value })
            .bind(to: state.isWaging)
            .disposed(by: disposeBag)

        clock.clock
            .filter({ isWaging.value })
            .subscribe { _ in
                wage.time += clock.interval
                wage.wage += (Double(wage.hwage) * clock.interval / 3600.0)
                updateWage.accept(wage)
            }
            .disposed(by: disposeBag)



        /*
         *  EXAMPLE:
         *
         *  dependency.inputObservable(for: \.buttonTap)
         *      .map { _ in false }
         *      .bind(to: state.isEnabled)
         *      .disposed(by: disposeBag)
         */

        return Output(isWaging: isWaging.asObservable(),
                      updateWage: updateWage.asObservable(),
                      openSettingVC: openSettingVC.asObservable())
    }
}
