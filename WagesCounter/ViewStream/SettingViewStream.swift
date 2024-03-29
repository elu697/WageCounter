//
//  SettingViewStream.swift
//  WagesCounter
//
//  Created by El You on 2021/05/22.
//

import RxCocoa
import RxSwift
import Unio

protocol SettingViewStreamType: AnyObject {
    var input: InputWrapper<SettingViewStream.Input> { get }
    var output: OutputWrapper<SettingViewStream.Output> { get }
}

final class SettingViewStream: UnioStream<SettingViewStream>, SettingViewStreamType {
    convenience init(wage: Wage = .init()) {
        self.init(input: Input(),
                  state: State(),
                  extra: Extra(wage: wage))
    }
}

extension SettingViewStream {

    struct Input: InputType {

        /*
         *  EXAMPLE:
         *
         *  let buttonTap = PublishRelay<Void>()
         */
    }

    struct Output: OutputType {

        /*
         *  EXAMPLE:
         *
         *  let isEnabled: Observable<Bool>
         */
    }

    struct State: StateType {

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

        /*
         *  EXAMPLE:
         *
         *  dependency.inputObservable(for: \.buttonTap)
         *      .map { _ in false }
         *      .bind(to: state.isEnabled)
         *      .disposed(by: disposeBag)
         */

        return Output(
            /*
             * EXAMPLE:
             *
             * isEnabled: state.isEnabled.asObservable()
             */
        )
    }
}
