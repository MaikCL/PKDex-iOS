//
//  ListingReducer.swift
//  
//
//  Created by Miguel Angel on 02-05-21.
//

final class ListingReducer {
    
    static func reduce(_ state: ListingState, _ action: ListingAction) -> ListingState {
        var currentState = state
        switch action {
            case .searchPokemon:
                currentState.pokemons = .loading
                currentState.exception = .none

            case .searchedPokemonSuccess(let results):
                currentState.pokemons = .loaded(results)
                currentState.exception = .none

            case .searchedPokemonFailed(let exception):
                currentState.pokemons = .neverLoaded
                currentState.exception = exception
        }
        return currentState
    }
    
}
