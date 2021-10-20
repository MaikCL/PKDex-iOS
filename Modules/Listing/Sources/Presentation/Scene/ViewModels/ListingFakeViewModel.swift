import Core
import SwiftUI
import AltairMDKCommon

enum FakeState {
    case neverLoaded
    case loading
    case loaded
    case exception
}

final class ListingFakeViewModel: ListingViewModelProtocol {
    @Published var pokemons: Loadable<[PokemonModel]>
    @Published var exception: Exception?
    
    var router: Router?
    
    private let fakePokemons: [PokemonModel] = [
        PokemonModel(id: 1, name: "Venosaur", favorited: .off),
        PokemonModel(id: 2, name: "Blastoise",favorited: .on),
        PokemonModel(id: 3, name: "Charizard", favorited: .off),
        PokemonModel(id: 4, name: "Zapdos", favorited: .on),
        PokemonModel(id: 5, name: "Moltres", favorited: .on),
        PokemonModel(id: 6, name: "Articuno", favorited: .off)
    ]
    
    init(state: FakeState) {
        switch state {
            case .neverLoaded:
                self.pokemons = .neverLoaded
                self.exception = .none
                
            case .loading:
                self.pokemons = .loading
                self.exception = .none
                
            case .loaded:
                self.pokemons = .loaded(fakePokemons)
                self.exception = .none
                
            case .exception:
                self.pokemons = .neverLoaded
                self.exception = MapperException.cantMapToEntity
        }

    }
    
    func getPokemon(_ generation: PokemonGeneration) {
        // Nothing to do for now
    }
    
    func getFavorites() {
        // Nothing to do for now
    }
    
    func favoritePokemon(id: Int, state: Toggleable) {
        // Nothing to do for now
    }
    
}
