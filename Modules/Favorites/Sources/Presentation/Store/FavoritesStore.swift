//
//  FavoritesStore.swift
//  
//
//  Created by Miguel Angel on 24-05-21.
//

import Combine
import Resolver
import Foundation
import AltairMDKCommon

public final class FavoritesStore: Store {
    public typealias State = FavoritesState
    public typealias Action = FavoritesAction
    
    private var cancellables = Set<AnyCancellable>()
    private var input = PassthroughSubject<FavoritesAction, Never>()
    
    @Injected private var sideEffects: FavoritesSideEffects
    @Published public var state: FavoritesState = .initial
    
    init() {
        Publishers.store(
            initial: state,
            reduce: FavoritesReducer.reduce,
            scheduler: DispatchQueue.main,
            sideEffects: [
                sideEffects.whenGetFavorites(),
                sideEffects.whenExceptionHappen(),
                sideEffects.whenInput(action: input.eraseToAnyPublisher())
            ]
        )
        .assignNoRetain(to: \.state, on: self)
        .store(in: &cancellables)
    }
    
    public func trigger(_ action: FavoritesAction) {
        input.send(action)
    }
    
}
