//
//  ListingScene.swift
//  
//
//  Created by Miguel Angel on 07-05-21.
//

import Core
import Design
import SwiftUI
import AltairMDKCommon

struct ListingScene<ViewModel: ListingViewModelProtocol>: View {
    @ObservedObject private(set) var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            Group {
                switch viewModel.exception {
                    case .none:
                        ListView(viewModel: viewModel).navigationTitle("Pokemons") // TODO: Localize this
                        
                    case .some(let exception):
                        ExceptionView(exception: exception)
                }
            }
            .onAppear {
                if case .neverLoaded = viewModel.pokemons {
                    viewModel.getPokemon(.generationI)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
