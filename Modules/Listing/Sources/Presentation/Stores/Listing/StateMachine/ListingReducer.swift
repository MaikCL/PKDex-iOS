//
//  ListingReducer.swift
//  
//
//  Created by Miguel Angel on 02-05-21.
//

final class ListingReducer {
    
    static func reduce(_ state: ListingState, _ action: ListingAction) -> ListingState {
        print("Pasa Action: \(action) por reducer")
        var currentState = state
        switch action {
            case .searchPokemon(let generation):
                print("State muto por search pokemon")
                currentState.pokemons = .loading
                currentState.exception = .none
                currentState.runningSideEffect = .whenLoadingPokemon(generation: generation)
                
            case .searchedPokemonSuccess(let results):
                print("State muto por searched pokemon success")
                currentState.pokemons = .loaded(results)
                currentState.exception = .none
                currentState.runningSideEffect = .none
                
            case .searchedPokemonFailed(let exception):
                print("State muto por searched pokemon fail")
                currentState.pokemons = .neverLoaded
                currentState.exception = exception
                currentState.runningSideEffect = .whenExceptionHappen
        }
        return currentState
    }
    
}
