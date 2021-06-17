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
            case .searchPokemon(let generation):
                currentState.pokemons = .loading
                currentState.exception = .none
                currentState.runningSideEffect = .whenLoadingPokemon(generation: generation)
                
            case .searchedPokemonSuccess(let results):
                currentState.pokemons = .loaded(results)
                currentState.exception = .none
                currentState.runningSideEffect = .none
                
            case .searchedPokemonFailed(let exception):
                currentState.pokemons = .neverLoaded
                currentState.exception = exception
                currentState.runningSideEffect = .whenExceptionHappen
        }
        return currentState
    }
    
}
