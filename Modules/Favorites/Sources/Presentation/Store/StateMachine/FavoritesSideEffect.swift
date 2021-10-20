import Combine
import Resolver
import AltairMDKCommon

final class FavoritesSideEffects {
    @Injected private static var addFavoritesUseCase: AddFavoriteUseCaseProtocol
    @Injected private static var getFavoritesUseCase: GetFavoritesUseCaseProtocol
    @Injected private static var removeFavoritesUseCase: RemoveFavoriteUseCaseProtocol
    
    static func whenGetFavorites() -> SideEffect<FavoritesState, FavoritesAction> {
        return { state, action in
            guard case .getFavorites = action else { return Empty().eraseToAnyPublisher() }
            return self.getFavoritesUseCase
                .execute()
                .map { .getFavoritesSucceeded($0) }
                .catch { Just(.getFavoritesFailed($0 as? Exception ?? GenericException.unknown($0))) }
                .eraseToAnyPublisher()
        }
    }
    
    static func whenFavorite() -> SideEffect<FavoritesState, FavoritesAction> {
        return { state, action in
            guard case .favorite(let id) = action else { return Empty().eraseToAnyPublisher() }
            return self.addFavoritesUseCase
                .execute(id: id)
                .map { .favoriteSucceeded(id: id) }
                .catch { Just(.favoriteFailed($0 as? Exception ?? GenericException.unknown($0))) }
                .eraseToAnyPublisher()
        }
    }
    
    static func whenUnfavorite() -> SideEffect<FavoritesState, FavoritesAction> {
        return { state, action in
            guard case .unfavorite(let id) = action else { return Empty().eraseToAnyPublisher() }
            return self.removeFavoritesUseCase
                .execute(id: id)
                .map { .unfavoriteSucceeded(id: id) }
                .catch { Just(.favoriteFailed($0 as? Exception ?? GenericException.unknown($0))) }
                .eraseToAnyPublisher()
        }
    }

}
