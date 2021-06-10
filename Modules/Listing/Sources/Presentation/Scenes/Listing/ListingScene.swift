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
    @EnvironmentObject var viewModel: ViewModel
    @State var didAppear = false
    
    var body: some View {
        NavigationView {
            Group {
                switch viewModel.exception {
                    case .none:
                        ListView(viewModel: viewModel).navigationTitle("Pokemons") // TODO: Localize this
                            
                        let _ = print("Estado Favoritos")
                        let _ = viewModel.temporalPrint()
//                        let _ = viewModel.favoritePokemon(id: 13, state: .on)
                        
                    case .some(let exception):
                        ExceptionView(exception: exception)
                }
            }
            .onAppear(perform: onLoad)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func onLoad() {
        if !didAppear {
            viewModel.getPokemon(.generationI)
            viewModel.getFavorites()
        }
        didAppear = true
    }
}
