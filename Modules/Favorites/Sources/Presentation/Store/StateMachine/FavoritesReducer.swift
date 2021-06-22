//
//  FavoriteReducer.swift
//  
//
//  Created by Miguel Angel on 24-05-21.
//

import Foundation

final class FavoritesReducer {
    
    static func reduce(_ state: FavoritesState, _ action: FavoritesAction) -> FavoritesState {
        let semaphore = DispatchSemaphore(value: 0)
        var currentState = state
        switch action {
            case .getFavorites:
                currentState.exception = .none
                currentState.runningSideEffect = .whenGetFavorites
                semaphore.signal()

            case .getFavoritesSucceeded(let results):
                currentState.favorites = results
                currentState.runningSideEffect = .none
                semaphore.signal()
                
            case .getFavoritesFailed(let exception):
                currentState.favorites = []
                currentState.exception = exception
                currentState.runningSideEffect = .whenExceptionHappen
                semaphore.signal()
                
            case .favorite(let id):
                currentState.exception = .none
                currentState.runningSideEffect = .whenFavorite(id: id)
                semaphore.signal()
                
            case .favoriteSucceeded(let id):
                currentState.favorites.insert(id)
                currentState.exception = .none
                currentState.runningSideEffect = .none
                semaphore.signal()
                
            case .favoriteFailed(let exception):
                currentState.exception = exception
                currentState.runningSideEffect = .whenExceptionHappen
                semaphore.signal()
                
            case .unfavorite(let id):
                currentState.exception = .none
                currentState.runningSideEffect = .whenUnfavorite(id: id)
                semaphore.signal()
                
            case .unfavoriteSucceeded(let id):
                currentState.favorites.remove(id)
                currentState.exception = .none
                currentState.runningSideEffect = .none
                semaphore.signal()
                
            case .unfavoriteFailed(let exception):
                currentState.exception = exception
                currentState.runningSideEffect = .whenExceptionHappen
                semaphore.signal()
                
        }
        semaphore.wait()
        return currentState
    }

}
