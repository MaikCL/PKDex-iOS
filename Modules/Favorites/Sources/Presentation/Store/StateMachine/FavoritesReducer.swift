//
//  FavoriteReducer.swift
//  
//
//  Created by Miguel Angel on 24-05-21.
//

import Foundation

final class FavoritesReducer {
    
    static func reduce(_ state: FavoritesState, _ action: FavoritesAction) -> FavoritesState {
        print("Pasa Action: \(action) por reducer")
        let queue = DispatchQueue.global(qos: .userInitiated)
        let group = DispatchGroup()
        var currentState = state
        group.enter()

        queue.async {
            switch action {
                case .getFavorites:
                    print("State muto por getFavorites")
                    currentState.exception = .none
                    currentState.runningSideEffect = .whenGetFavorites
                    group.leave()

                case .getFavoritesSucceeded(let results):
                    print("State muto por getFavoritesSucceeded")
                    currentState.favorites = results
                    currentState.runningSideEffect = .none
                    group.leave()
                    
                case .getFavoritesFailed(let exception):
                    print("State muto por getFavoritesFailed")
                    currentState.favorites = []
                    currentState.exception = exception
                    currentState.runningSideEffect = .whenExceptionHappen
                    group.leave()
                    
                case .favorite(let id):
                    print("State muto por Favorite")
                    currentState.exception = .none
                    currentState.runningSideEffect = .whenAddingFavorite(id: id)
                    group.leave()
                    
                case .favoriteSucceeded(let id):
                    print("State muto por favorite succedeed")
                    currentState.favorites.insert(id)
                    currentState.exception = .none
                    currentState.runningSideEffect = .none
                    group.leave()
                    
                case .favoriteFailed(let exception):
                    print("State muto por favorite failed")
                    currentState.exception = exception
                    currentState.runningSideEffect = .none
                    group.leave()
            }
        }
        group.wait()
        return currentState
    }

}
