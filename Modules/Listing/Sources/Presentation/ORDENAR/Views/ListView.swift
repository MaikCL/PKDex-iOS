//
//  ListView.swift
//  
//
//  Created by Miguel Angel on 02-05-21.
//

import SwiftUI
import AltairMDKCommon

// TODO: Try to make this List as Design component
struct ListView: View {
    var pokemons: Loadable<[PokemonModel]>
    
    var body: some View {
        switch pokemons {
            case .neverLoaded:
                Text("Never Loaded")
                
            case .loading:
                Text("Loading")
    
            case .loaded(let pokemons):
                List(pokemons) { pokemon in
                    CellView(name: pokemon.name)
                }.environment(\.defaultMinListRowHeight, 60.0)
        }
    }
    
}

struct ListView_Previews: PreviewProvider {
    private static let fakePokemons: [PokemonModel] = [
        PokemonModel(name: "Venosaur"),
        PokemonModel(name: "Blastoise"),
        PokemonModel(name: "Charizard"),
        PokemonModel(name: "Zapdos"),
        PokemonModel(name: "Moltres"),
        PokemonModel(name: "Articuno")
    ]
    
    static var previews: some View {
        ListView(pokemons: .loaded(fakePokemons))
    }
}
