//
//  FavoriteReducer.swift
//  
//
//  Created by Miguel Angel on 24-05-21.
//

final class FavoritesReducer {
    
    static func reduce(_ state: FavoritesState, _ action: FavoritesAction) -> FavoritesState {
        print("Pasa Action: \(action) por reducer")
        var currentState = state
        switch action {
            case .getFavorites:
                print("State muto por getFavorites")
                currentState.runningSideEffect = .whenGetFavorites

            case .getFavoritesSucceeded(let results):
                print("State muto por getFavoritesSucceeded")
                currentState.favorites = results
                currentState.runningSideEffect = .none
                
            case .getFavoritesFailed(let exception):
                print("State muto por getFavoritesFailed")
                currentState.favorites = []
                currentState.exception = exception
                currentState.runningSideEffect = .whenExceptionHappen
        }
        return currentState
    }

}
