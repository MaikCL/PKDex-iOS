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
    
    func whenInput(action: AnyPublisher<ListingAction, Never>) -> SideEffect<ListingAction> {
        SideEffect { _ in action }
    }
    
    func whenSearchPokemon() -> SideEffect<ListingAction> {
        SideEffect { action -> AnyPublisher<ListingAction, Never> in
            guard case let .searchPokemon(generation) = action else { return Empty().eraseToAnyPublisher() }
            self.$getPokemonUseCase.args = generation
            return self.getPokemonUseCase
                .execute()
                .map { .searchedPokemonSuccess($0) }
                .replaceEmpty(with: .searchedPokemonFailed(ListingException.noResults))
                .catch { Just(.searchedPokemonFailed($0 as? Exception ?? ListingException.unknown($0))) }
                .handleEvents(receiveOutput: { input in
                    guard case let .searchedPokemonFailed(exception) = input else { return }
                    self.logException(exception)
                })
                .eraseToAnyPublisher()
        }
    }

}

extension ListingSideEffects {
    
    private func logException(_ exception: Exception) {
        // TODO: Implement apropiated record of exception
        print("An exception occurred: [\(exception.code)] \(exception.localizedDescription)")
    }
    
}
