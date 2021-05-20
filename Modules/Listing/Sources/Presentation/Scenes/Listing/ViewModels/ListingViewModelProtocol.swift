//
//  ViewModelProtocols.swift
//  
//
//  Created by Miguel Angel on 10-05-21.
//

import Core
import SwiftUI
import AltairMDKCommon

protocol ListingViewModelProtocol: ViewModel {
    var pokemons: Loadable<[PokemonModel]> { get }
    var exception: Exception? { get }
    
    func getPokemon(_ generation: PokemonGeneration)
    func favoritePokemon(id: Int, state: Toggleable)
}
