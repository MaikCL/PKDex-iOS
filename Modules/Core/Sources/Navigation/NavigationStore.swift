//
//  NavigationStore.swift
//  
//
//  Created by Miguel Angel on 04-05-21.
//

import Combine
import Resolver
import Foundation
import AltairMDKCommon

final public class NavigationStore: Store {
    public typealias State = NavigationState
    public typealias Action = NavigationAction
    
    private var bag: Set<AnyCancellable> = .init()
    private var input: PassthroughSubject<NavigationAction, Never> = .init()
    
    @Injected private var sideEffects: NavigationSideEffects
    @Published public var state: NavigationState = .initial
    
    public init() {
        Publishers.store(
            initial: state,
            input: input,
            reduce: NavigationReducer.reduce,
            scheduler: RunLoop.main,
            sideEffects: [
                sideEffects.whenInput(input.eraseToAnyPublisher())
            ]
        )
        .assign(to: \.state, on: self)
        .store(in: &bag)
    }
    
    public func trigger(_ action: NavigationAction) {
        input.send(action)
    }
    
}
