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
        switch viewModel.pokemons {
            case .neverLoaded:
                Text("Never Loaded")
                
            case .loading:
                Text("Loading")
    
            case .loaded(let pokemons):
                List(pokemons) { pokemon in
                    NavigationLink(destination: viewModel.router?.route(to: .detail(id: ""))) {
                        CellView(pokemon: pokemon)
                    }
                }
                .environment(\.defaultMinListRowHeight, 60.0)
        }
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(viewModel: ListingFakeViewModel(state: .loaded))
    }
}
