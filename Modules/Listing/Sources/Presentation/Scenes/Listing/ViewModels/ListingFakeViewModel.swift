//
//  ListingFakeViewModel.swift
//  
//
//  Created by Miguel Angel on 10-05-21.
//

import Core
import SwiftUI
import AltairMDKCommon

enum FakeState {
    case neverLoaded
    case loading
    case loaded
    case exception
}

//final class ListingFakeViewModel: ListingViewModelProtocol {
//    @Published var pokemons: Loadable<[PokemonModel]>
//    @Published var exception: Exception?
//    
//    var router: Router?
//    
//    private let fakePokemons: [PokemonModel] = [
//        PokemonModel(name: "Venosaur", favorited: .off),
//        PokemonModel(name: "Blastoise",favorited: .on),
//        PokemonModel(name: "Charizard", favorited: .off),
//        PokemonModel(name: "Zapdos", favorited: .on),
//        PokemonModel(name: "Moltres", favorited: .on),
//        PokemonModel(name: "Articuno", favorited: .off)
//    ]
//    
//    init(state: FakeState) {
//        switch state {
//            case .neverLoaded:
//                self.pokemons = .neverLoaded
//                self.exception = .none
//                
//            case .loading:
//                self.pokemons = .loading
//                self.exception = .none
//                
//            case .loaded:
//                self.pokemons = .loaded(fakePokemons)
//                self.exception = .none
//                
//            case .exception:
//                self.pokemons = .neverLoaded
//                self.exception = MapperException.cantMapToEntity
//        }
//
//    }
//    
//    func getPokemon(_ generation: PokemonGeneration) {
//        // Nothing to do for now
//    }
//    
//}
