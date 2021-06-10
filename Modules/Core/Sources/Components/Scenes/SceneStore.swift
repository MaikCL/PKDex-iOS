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
    
    private var bag: Set<AnyCancellable> = .init()
    private var input: PassthroughSubject<SceneAction, Never> = .init()
    
    @Injected private var sideEffects: SceneSideEffects
    @Published private(set) public var state: SceneState

    public init() {
        state = .initial
        Publishers.store(
            initial: state,
            reduce: SceneReducer.reduce(_:_:),
            scheduler: RunLoop.main,
            sideEffects: [
                sideEffects.whenInput(input.eraseToAnyPublisher())
            ]
        )
        .assignNoRetain(to: \.state, on: self)
        .store(in: &bag)
    }
    
    public func trigger(_ action: SceneAction) {
        input.send(action)
    }

}
