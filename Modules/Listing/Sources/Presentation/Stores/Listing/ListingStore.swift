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

final class ListingStore: Store {
    typealias State = ListingState
    typealias Action = ListingAction
    
    private var cancellables = Set<AnyCancellable>()
    private var input = PassthroughSubject<ListingAction, Never>()
    
    @Injected private var sideEffects: ListingSideEffects
    @Published var state: ListingState = .initial
    
    init() {
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
        .store(in: &cancellables)
    }

    func trigger(_ action: ListingAction) {
        input.send(action)
    }
    
}
