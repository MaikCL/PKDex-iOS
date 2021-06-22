//
//  ListingSideEffect.swift
//  
//
//  Created by Miguel Angel on 02-05-21.
//

import Combine
import Resolver
import AltairMDKCommon

final class ListingSideEffects {
    @Injected private var getPokemonUseCase: GetPokemonByGenerationProtocol
    
    func whenInput(action: AnyPublisher<ListingAction, Never>) -> SideEffect<ListingState, ListingAction> {
        SideEffect { _ in action }
    }
    
    func whenLoadingPokemon() -> SideEffect<ListingState, ListingAction> {
        SideEffect { state -> AnyPublisher<ListingAction, Never> in
            guard case .whenLoadingPokemon(let generation) = state.runningSideEffect else { return Empty().eraseToAnyPublisher() }
            return self.getPokemonUseCase
                .execute(generation: generation)
                .map { .searchedPokemonSuccess($0) }
                .replaceEmpty(with: .searchedPokemonFailed(ListingException.noResults))
                .catch { Just(.searchedPokemonFailed($0 as? Exception ?? ListingException.unknown($0))) }
                .eraseToAnyPublisher()
        }
    }
    
    func whenExceptionHappen() -> SideEffect<ListingState, ListingAction> {
        SideEffect { state -> AnyPublisher<ListingAction, Never> in
            guard case .whenExceptionHappen = state.runningSideEffect else { return Empty().eraseToAnyPublisher() }
            print("An exception occurred: \(String(describing: state.exception?.localizedDescription))")
            return Empty().eraseToAnyPublisher()
        }
    }

}
