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

    convenience init(extra: Extra = .init()) {
        self.init(input: Input(),
                  state: State(),
                  extra: extra)
    }
}

extension HomeViewStream {

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
