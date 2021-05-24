//
//  FavoriteState.swift
//  
//
//  Created by Miguel Angel on 24-05-21.
//

import AltairMDKCommon

protocol FavoritesStateProtocol {
    var favorites: Set<Int> { get set }
}

struct FavoritesState: FavoritesStateProtocol {
    var favorites: Set<Int>
}

extension FavoritesState {
    static var initial: FavoritesState {
        .init(favorites: .init())
    }
}
