//
//  ListingUI.swift
//  
//
//  Created by Miguel Angel on 02-05-21.
//

import Design
import SwiftUI
import Resolver
import AltairMDKCommon

public struct ListingUI: View {
    @EnvironmentObject private var listingStore: ListingStore
    
    public init() { }
    
    public var body: some View {
        let viewState = ViewState(from: listingStore.state)
        
        return Group {
            switch viewState.currentException {
                case .none:
                    ListView(pokemons: viewState.listingPokemon)
                    
                case .some(let exception):
                    ExceptionView(exception: exception)
            }
        }
        .onAppear {
            listingStore.trigger(.searchPokemon(.generationI))
        }
    }
}

// MARK: ViewState

fileprivate extension ListingUI {
    struct ViewState {
        let listingPokemon: Loadable<[PokemonModel]>
        let currentException: Exception?
    }
}

// MARK: ViewState Mapping

fileprivate extension ListingUI.ViewState {
    @Injected static var mapPokemonState: ([Pokemon]) -> [PokemonModel]
    
    init(from state: ListingState) {
        self.listingPokemon = state.pokemons.map { ListingUI.ViewState.mapPokemonState($0) }
        self.currentException = state.exception
    }
}
