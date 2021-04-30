//
//  SceneStore.swift
//  
//
//  Created by Miguel Angel on 30-04-21.
//

import Combine
import Resolver
import Foundation
import AltairMDKCommon

final public class SceneStore: Store {
    public typealias State = SceneState
    public typealias Action = SceneAction
    
    private var bag: Set<AnyCancellable> = ()
    private var input: PassthroughSubject<SceneAction, Never> = ()
    
    @Injected private var sideEffects: SceneSideEffects
    @Published public var state: SceneState = .initial
    
    public init() {
        Publishers.store(
            initial: state,
            input: input,
            reduce: SceneReducer.reduce(_:_:),
            scheduler: RunLoop.main,
            sideEffects: [
                sideEffects.whenInput(input.eraseToAnyPublisher())
            ]
        )
        .assign(to: \.state, on: self)
        .store(in: &bag)
    }
    
    public func trigger(_ action: SceneAction) {
        input.send(action)
    }

}
