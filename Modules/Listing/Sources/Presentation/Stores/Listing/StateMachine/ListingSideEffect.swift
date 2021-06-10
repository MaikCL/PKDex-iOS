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
    @LazyInjected private var getPokemonUseCase: GetPokemon
    
    func whenInput(action: AnyPublisher<ListingAction, Never>) -> SideEffect<ListingState, ListingAction> {
        SideEffect { _ in action }
    }
    
    func whenSearchPokemon() -> SideEffect<ListingState, ListingAction> {
        SideEffect { state -> AnyPublisher<ListingAction, Never> in
            guard case .loading(let generation) = state else { return Empty().eraseToAnyPublisher() }
            self.$getPokemonUseCase.args = generation
            return self.getPokemonUseCase
                .execute()
                .map { .searchedPokemonSuccess($0) }
                .replaceEmpty(with: .searchedPokemonFailed(ListingException.noResults))
                .catch { Just(.searchedPokemonFailed($0 as? Exception ?? ListingException.unknown($0))) }
                .eraseToAnyPublisher()
        }
    }
    
    func whenExceptionOccurs() -> SideEffect<ListingState, ListingAction> {
        SideEffect { state -> AnyPublisher<ListingAction, Never> in
            guard case .exception(let exception) = state else { return Empty().eraseToAnyPublisher() }
            print("An exception occurred: [\(exception.code)] \(exception.localizedDescription)")
            return Empty().eraseToAnyPublisher()
        }
    }

}


