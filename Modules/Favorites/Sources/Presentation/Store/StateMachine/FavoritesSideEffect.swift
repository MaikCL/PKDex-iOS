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
    @Injected private var addFavoritesUseCase: AddFavoriteUseCaseProtocol
    @Injected private var getFavoritesUseCase: GetFavoritesUseCaseProtocol
    @Injected private var removeFavoritesUseCase: RemoveFavoriteUseCaseProtocol
    
    func whenInput(action: AnyPublisher<FavoritesAction, Never>) -> SideEffect<FavoritesState, FavoritesAction> {
        SideEffect { _ in action }
    }
    
    func whenGetFavorites() -> SideEffect<FavoritesState, FavoritesAction> {
        SideEffect { state -> AnyPublisher<FavoritesAction, Never> in
            guard case .whenGetFavorites = state.runningSideEffect else { return Empty().eraseToAnyPublisher() }
            print("Ejecutando SideEffect GetFavorites")
            return self.getFavoritesUseCase
                .execute()
                .map { .getFavoritesSucceeded($0) }
                .catch { Just(.getFavoritesFailed($0 as? Exception ?? FavoritesException.unknown($0))) }
                .eraseToAnyPublisher()
        }
    }
    
    func whenAddingFavorite() -> SideEffect<FavoritesState, FavoritesAction> {
        SideEffect { state -> AnyPublisher<FavoritesAction, Never> in
            guard case .whenAddingFavorite(let id) = state.runningSideEffect else { return Empty().eraseToAnyPublisher() }
            print("Ejecutando SideEffect Adding Favorite id: \(id)")
            return self.addFavoritesUseCase
                .execute(id: id)
                .map { .favoriteSucceeded(id: id) }
                .catch { Just(.favoriteFailed($0 as? Exception ?? FavoritesException.unknown($0))) }
                .eraseToAnyPublisher()
        }
    }
    
    func whenExceptionHappen() -> SideEffect<FavoritesState, FavoritesAction> {
        SideEffect { state -> AnyPublisher<FavoritesAction, Never> in
            guard case .whenExceptionHappen = state.runningSideEffect else { return Empty().eraseToAnyPublisher() }
            print("Se logeara excepcion: \(String(describing: state.exception?.localizedDescription))")
            return Empty().eraseToAnyPublisher()
        }
    }
        
}
