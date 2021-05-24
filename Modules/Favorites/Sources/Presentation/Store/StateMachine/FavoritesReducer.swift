//
//  FavoriteReducer.swift
//  
//
//  Created by Miguel Angel on 24-05-21.
//

final class FavoritesReducer {
    
    static func reduce(_ state: FavoritesState, _ action: FavoritesAction) -> FavoritesState {
        var currentState = state
        switch action {
            case .getFavorites(let result):
                currentState.favorites = result
            case .favorite(let id):
                currentState.favorites.insert(id)
            case .unfavorite(let id):
                currentState.favorites.remove(id)
            case .favoritedFailed(_, let id):
                currentState.favorites.remove(id)
            case .unfavoritedFailed(_ , let id):
                currentState.favorites.insert(id)
        }
        return currentState
    }
    
}
