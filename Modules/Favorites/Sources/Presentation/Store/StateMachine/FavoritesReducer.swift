import Foundation

final class FavoritesReducer {
    
    static func reduce(state: inout FavoritesState, action: FavoritesAction) -> Void {
        let semaphore = DispatchSemaphore(value: 0)
        switch action {
            case .getFavorites:
                state.exception = .none
                semaphore.signal()

            case .getFavoritesSucceeded(let results):
                state.favorites = results
                semaphore.signal()
                
            case .getFavoritesFailed(let exception):
                state.favorites = []
                state.exception = exception
                semaphore.signal()
                
            case .favorite:
                state.exception = .none
                semaphore.signal()
                
            case .favoriteSucceeded(let id):
                state.favorites.insert(id)
                state.exception = .none
                semaphore.signal()
                
            case .favoriteFailed(let exception):
                state.exception = exception
                semaphore.signal()
                
            case .unfavorite:
                state.exception = .none
                semaphore.signal()
                
            case .unfavoriteSucceeded(let id):
                state.favorites.remove(id)
                state.exception = .none
                semaphore.signal()
                
            case .unfavoriteFailed(let exception):
                state.exception = exception
                semaphore.signal()
                
        }
        semaphore.wait()
    }

}
