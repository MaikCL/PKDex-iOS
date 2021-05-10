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
import AltairMDKCommon

final class ListingViewModel: ListingViewModelProtocol {
    @ObservedObject private var listingStore: ListingStore = Resolver.resolve()

    @Published var pokemons: Loadable<[PokemonModel]> = .neverLoaded
    @Published var exception: Exception? = .none

    private var bag = Set<AnyCancellable>()
    private let router: Router

    init(router: Router) {
        self.router = router
        setupViewStates()
    }

}

// MARK: ViewModel Methods Contract

extension ListingViewModel {
    
    func getPokemon(_ generation: PokemonGeneration) {
        listingStore.trigger(.searchPokemon(generation))
    }
    
    func openDetail(id: String) -> AnyView {
        router.route(to: .detail(id: id))
    }
    
}

// MARK: Store State Mapping

private extension ListingViewModel {
    @Injected static var mapPokemonState: ([Pokemon]) -> [PokemonModel]

    private func setupViewStates() {
        listingStore.$state
            .receive(on: DispatchQueue.main)
            .sink { [weak self] state in
                self?.pokemons = state.pokemons.map { ListingViewModel.mapPokemonState($0) }
                self?.exception = state.exception
            }
            .store(in: &bag)
    }
        
}
