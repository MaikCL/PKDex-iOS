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
    @LazyInjected private var addFavoritesUseCase: AddFavorite
    @LazyInjected private var getFavoritesUseCase: GetFavorites
    @LazyInjected private var removeFavoritesUseCase: RemoveFavorite
    
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
    
    func whenExceptionHappen() -> SideEffect<FavoritesState, FavoritesAction> {
        SideEffect { state -> AnyPublisher<FavoritesAction, Never> in
            guard case .whenExceptionHappen = state.runningSideEffect else { return Empty().eraseToAnyPublisher() }
            print("Se logeara excepcion: \(String(describing: state.exception?.localizedDescription))")
            return Empty().eraseToAnyPublisher()
        }
    }
        
}

//func whenSearchPokemon() -> SideEffect<ListingState, ListingAction> {
//    SideEffect { state -> AnyPublisher<ListingAction, Never> in
//        guard case .loading(let generation) = state else { return Empty().eraseToAnyPublisher() }
//        self.$getPokemonUseCase.args = generation
//        return self.getPokemonUseCase
//            .execute()
//            .map { .searchedPokemonSuccess($0) }
//            .replaceEmpty(with: .searchedPokemonFailed(ListingException.noResults))
//            .catch { Just(.searchedPokemonFailed($0 as? Exception ?? ListingException.unknown($0))) }
//            .eraseToAnyPublisher()
//    }
//}


//    func whenGetFavorites() -> SideEffect<FavoritesAction> {
//        SideEffect { action -> AnyPublisher<FavoritesAction, Never> in
//            guard case .getFavorites = action else { return Empty().eraseToAnyPublisher() }
//            print("Se ejecuta el sideeffect WhenGetFavorites")
//            return self.getFavoritesUseCase
//                .execute()
//                .map { .getFavoritesSucceeded($0) }
//                .catch { Just(.getFavoritesFailed($0 as? Exception ?? FavoritesException.unknown($0))) }
//                .handleEvents(receiveOutput: { input in
//                    guard case let .getFavoritesFailed(exception) = input else { return }
//                    print("Get Favorites Failed: \(exception.localizedDescription)")
//                })
//                .eraseToAnyPublisher()
//        }
//    }
