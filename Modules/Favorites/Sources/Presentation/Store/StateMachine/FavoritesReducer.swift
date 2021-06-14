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

        print("Pasa Action: \(action) por reducer")
        var currentState = state
        switch action {
            case .getFavorites:
                print("State muto por getFavorites")
                currentState.exception = .none
                currentState.runningSideEffect = .whenGetFavorites
                semaphore.signal()

            case .getFavoritesSucceeded(let results):
                print("State muto por getFavoritesSucceeded")
                currentState.favorites = results
                currentState.runningSideEffect = .none
                semaphore.signal()
                
            case .getFavoritesFailed(let exception):
                print("State muto por getFavoritesFailed")
                currentState.favorites = []
                currentState.exception = exception
                currentState.runningSideEffect = .whenExceptionHappen
                semaphore.signal()
                
            case .favorite(let id):
                print("State muto por Favorite")
                currentState.exception = .none
                currentState.runningSideEffect = .whenFavorite(id: id)
                semaphore.signal()
                
            case .favoriteSucceeded(let id):
                print("State muto por favorite succedeed")
                currentState.favorites.insert(id)
                currentState.exception = .none
                currentState.runningSideEffect = .none
                semaphore.signal()
                
            case .favoriteFailed(let exception):
                print("State muto por favorite failed")
                currentState.exception = exception
                currentState.runningSideEffect = .whenExceptionHappen
                semaphore.signal()
                
            case .unfavorite(let id):
                print("State muto por Unfavorite failed")
                currentState.exception = .none
                currentState.runningSideEffect = .whenUnfavorite(id: id)
                semaphore.signal()
                
            case .unfavoriteSucceeded(let id):
                print("State muto por unfavorite succeed")
                currentState.favorites.remove(id)
                currentState.exception = .none
                currentState.runningSideEffect = .none
                semaphore.signal()
                
            case .unfavoriteFailed(let exception):
                print("State muto por unfavorite failed")
                currentState.exception = exception
                currentState.runningSideEffect = .whenExceptionHappen
                semaphore.signal()
                
        }
        semaphore.wait()
        return currentState
    }

}
