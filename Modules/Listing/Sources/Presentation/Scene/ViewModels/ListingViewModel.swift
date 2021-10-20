import Core
import Combine
import SwiftUI
import Resolver
import Favorites
import AltairMDKCommon
import Foundation

final class ListingViewModel: ListingViewModelProtocol {
    @ObservedObject private var listingStore: Store<ListingState, ListingAction> = Resolver.resolve()
    @ObservedObject private var favoritesStore: Store<FavoritesState, FavoritesAction> = Resolver.resolve()

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
        favoritesStore.trigger(.getFavorites)
    }
    
    func favoritePokemon(id: Int, state: Toggleable) {
        switch state {
            case .on:
                favoritesStore.trigger(.favorite(id: id))
            case .off:
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
                self?.pokemons = states.0.pokemons.map { ListingViewModel.mapPokemonState((pokemons: $0, favorites: states.1.favorites)) }
                self?.exception = states.0.exception
            }
            .store(in: &cancellables)
    }
        
}
