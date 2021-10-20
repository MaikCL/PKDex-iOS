import AltairMDKCommon

final class ListingReducer {
     
    static func reduce(state: inout ListingState, action: ListingAction) -> Void {
        switch action {
            case .searchPokemon:
                state.pokemons = .loading
                state.exception = .none
                
            case .searchedPokemonSuccess(let results):
                state.pokemons = .loaded(results)
                state.exception = .none
                
            case .searchedPokemonFailed(let exception):
                state.pokemons = .neverLoaded
                state.exception = exception
        }
    }
}
