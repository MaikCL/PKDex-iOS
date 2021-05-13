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
                    Text("Never Loaded").eraseToAnyView()
                    
                case .loading:
                    Text("Loading").eraseToAnyView()
                    
                case .loaded(let pokemons):
//                    List(pokemonsState.indices) { index in
//                        CellView(pokemon: $pokemonsState[index])
//                    }.environment(\.defaultMinListRowHeight, 60.0).eraseToAnyView()
                Text("loaded")
            }
        }
    }
    
}
