//
//  ListingState.swift
//  
//
//  Created by Miguel Angel on 02-05-21.
//

import AltairMDKCommon

protocol ListingStateProtocol {
    var pokemons: Loadable<[Pokemon]> { get set }
    var exception: Exception? { get set }
}

public struct ListingState: ListingStateProtocol {
    var pokemons: Loadable<[Pokemon]>
    var exception: Exception?
}

extension ListingState {
    static var initial: ListingState {
        .init(
            pokemons: .neverLoaded,
            exception: .none)
    }
}
