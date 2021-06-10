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
    
    //temporal
    func temporalPrint() {
        print(favoritesStore.state.favorites)
    }

    func favoritePokemon(id: Int, state: Toggleable) {
//        switch state {
//            case .on:
//                favoritesStore.trigger(.favorite(id: id))
//            case .off:
//                favoritesStore.trigger(.unfavorite(id: id))
//        }
        
        // TEMPORAL
//        favoritesStore.trigger(.getFavorites)
//        print(favoritesStore.state)
    }
    
}

// MARK: Store State Mapping

private extension ListingViewModel {
    @Injected static var mapPokemonState: ([Pokemon]) -> [PokemonModel]

    private func setupViewStates() {
        listingStore.$state
            .receive(on: DispatchQueue.main)
            .sink { [weak self] state in
                switch state {
                    case .initial:
                        self?.pokemons = .neverLoaded
                    case .loading(_):
                        self?.pokemons = .loading
                    case .loaded(let results):
                        self?.pokemons = .loaded(ListingViewModel.mapPokemonState(results))
                    case .exception(let error):
                        self?.exception = error
                }
            }
            .store(in: &cancellables)
    }
        
}
