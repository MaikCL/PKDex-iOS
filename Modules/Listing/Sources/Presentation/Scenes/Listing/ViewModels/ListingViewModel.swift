//
//  ListingViewModel.swift
//  
//
//  Created by Miguel Angel on 07-05-21.
//

import Core
import Combine
import SwiftUI
import Resolver
import Favorites
import AltairMDKCommon
import Foundation

final class ListingViewModel: ListingViewModelProtocol {
    @ObservedObject private var listingStore: ListingStore = Resolver.resolve()
    @ObservedObject private var favoritesStore: FavoritesStore = Resolver.resolve()

    @Published var pokemons: Loadable<[PokemonModel]> = .neverLoaded
    @Published var exception: Exception? = .none

    private var cancellables = Set<AnyCancellable>()
    let router: Router?

    init(router: Router) {
        self.router = router
        setupViewStates()
    }

}

// MARK: ViewModel Methods Contract

extension ListingViewModel  {
    
    func getPokemon(_ generation: PokemonGeneration) {
        listingStore.trigger(.searchPokemon(generation))
    }
    
    func getFavorites() {
        print("viewModel: GetFavorites")
        favoritesStore.trigger(.getFavorites)
    }
    
    func favoritePokemon(id: Int, state: Toggleable) {
        switch state {
            case .on:
                print("ViewModel - Favoriteando \(id)")
                favoritesStore.trigger(.favorite(id: id))
            case .off:
                print("ViewModel - Unfavoriteando \(id)")
                favoritesStore.trigger(.unfavorite(id: id))
        }
    }
    
}

// MARK: Store State Mapping

private extension ListingViewModel {
    @Injected static var mapPokemonState: ((pokemons: [Pokemon], favorites: Set<Int>)) -> [PokemonModel]

    private func setupViewStates() {
        Publishers
            .CombineLatest(listingStore.$state, favoritesStore.$state)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] states in
                print("Mapeo Estado ViewModel")
                print(states)
                
                self?.pokemons = states.0.pokemons.map { ListingViewModel.mapPokemonState((pokemons: $0, favorites: states.1.favorites)) }
                self?.exception = states.0.exception
            }
            .store(in: &cancellables)
    }
        
}
