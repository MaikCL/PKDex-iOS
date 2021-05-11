//
//  ListingAction.swift
//  
//
//  Created by Miguel Angel on 02-05-21.
//

import AltairMDKCommon

enum ListingAction {
    case searchPokemon(_ generation: PokemonGeneration)
    case searchedPokemonSuccess(_ results: [Pokemon])
    case searchedPokemonFailed(_ exception: Exception)
}
