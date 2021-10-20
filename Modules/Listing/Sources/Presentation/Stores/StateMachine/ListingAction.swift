import AltairMDKCommon

enum ListingAction {
    case searchPokemon(_ generation: PokemonGeneration)
    case searchedPokemonSuccess(_ results: [Pokemon])
    case searchedPokemonFailed(_ exception: Exception)
}
