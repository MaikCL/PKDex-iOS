//
//  FavoriteSideEffect.swift
//  
//
//  Created by Miguel Angel on 24-05-21.
//

import Combine
import Resolver
import AltairMDKCommon

final class FavoritesSideEffects {
    
    func whenInput(action: AnyPublisher<FavoritesAction, Never>) -> SideEffect<FavoritesAction> {
        SideEffect { _ in action }
    }
    
}
