//
//  FavoriteState.swift
//  
//
//  Created by Miguel Angel on 24-05-21.
//

import AltairMDKCommon

public struct FavoritesState {
    public var favorites: Set<Int>
    public var exception: Exception?
    var runningSideEffect: SideEffectTask
}

enum SideEffectTask {
    case none
    case whenGetFavorites
    case whenExceptionHappen
    case whenAddingFavorite(id: Int)
}

extension FavoritesState {
    static var initial: FavoritesState {
        .init(
            favorites: [],
            exception: .none,
            runningSideEffect: .none
        )
    }
}
