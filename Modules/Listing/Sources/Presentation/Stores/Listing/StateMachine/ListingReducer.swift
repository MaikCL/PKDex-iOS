//
//  ListingReducer.swift
//  
//
//  Created by Miguel Angel on 02-05-21.
//

final class ListingReducer {
    
    static func reduce(_ state: ListingState, _ action: ListingAction) -> ListingState {
        switch action {
            case .searchPokemon(let generation):
                return .loading(generation)
            case .searchedPokemonSuccess(let results):
                return .loaded(results)
            case .searchedPokemonFailed(let exception):
                return .exception(exception)
        }
    }
    
}
