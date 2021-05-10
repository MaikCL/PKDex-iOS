//
//  ViewModelProtocols.swift
//  
//
//  Created by Miguel Angel on 10-05-21.
//

import SwiftUI
import AltairMDKCommon

protocol ListingViewModelProtocol: ObservableObject {
    var pokemons: Loadable<[PokemonModel]> { get }
    var exception: Exception? { get }
    
    func getPokemon(_ generation: PokemonGeneration)
    func openDetail(id: String) -> AnyView
}
