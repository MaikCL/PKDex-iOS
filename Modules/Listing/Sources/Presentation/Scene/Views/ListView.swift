//
//  ListView.swift
//  
//
//  Created by Miguel Angel on 02-05-21.
//

import Core
import SwiftUI
import AltairMDKCommon

struct ListView<ViewModel: ListingViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        Group {
            switch viewModel.pokemons {
                case .neverLoaded:
                    Text("Never Loaded")
                    
                case .loading:
                    Text("Loading")
                    
                case .loaded(let pokemons):
                    List(pokemons) { pokemon in
                        NavigationLink(destination: viewModel.router?.route(to: .detail(id: "\(pokemon.id)"))) {
                            CellView(pokemon: pokemon, favoriteAction: { favoriteState in
                                viewModel.favoritePokemon(id: pokemon.id, state: favoriteState)
                            })
                        }
                    }
                    .environment(\.defaultMinListRowHeight, 60.0)
            }
        }
    }
    
}
