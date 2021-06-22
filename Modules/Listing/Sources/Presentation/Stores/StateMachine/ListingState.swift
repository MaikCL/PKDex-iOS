//
//  ListingState.swift
//  
//
//  Created by Miguel Angel on 02-05-21.
//

import AltairMDKCommon

struct ListingState {
    var pokemons: Loadable<[Pokemon]>
    var exception: Exception?
    var runningSideEffect: SideEffectTask
}

enum SideEffectTask {
    case none
    case whenLoadingPokemon(generation: PokemonGeneration)
    case whenExceptionHappen
}

extension ListingState {
    static var initial: ListingState {
        .init(
            pokemons: .neverLoaded,
            exception: .none,
            runningSideEffect: .none
        )
    }
}
