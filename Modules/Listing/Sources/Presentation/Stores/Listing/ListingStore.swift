//
//  ListingStore.swift
//  
//
//  Created by Miguel Angel on 02-05-21.
//

import Combine
import Resolver
import Foundation
import AltairMDKCommon

final public class ListingStore: Store {
    public typealias State = ListingState
    public typealias Action = ListingAction
    
    private var bag = Set<AnyCancellable>()
    private var input = PassthroughSubject<ListingAction, Never>()
    
    @Injected private var sideEffects: ListingSideEffects
    @Published public var state: ListingState = .initial
    
    public init() {
        Publishers.store(
            initial: state,
            input: input,
            reduce: ListingReducer.reduce,
            scheduler: DispatchQueue.main,
            sideEffects: [
                sideEffects.whenInput(action: input.eraseToAnyPublisher()),
                sideEffects.whenSearchPokemon()
            ]
        )
        .assign(to: \.state, on: self)
        .store(in: &bag)
    }

    public func trigger(_ action: ListingAction) {
        input.send(action)
    }
    
}
