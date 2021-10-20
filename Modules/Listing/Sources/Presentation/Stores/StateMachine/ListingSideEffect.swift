import Combine
import Resolver
import AltairMDKCommon

final class ListingSideEffects {
    @Injected private static var getPokemonUseCase: GetPokemonByGenerationProtocol

    static func whenSearchPokemon() -> SideEffect<ListingState, ListingAction> {
        return { state, action in
            guard case .searchPokemon(let generation) = action else { return Empty().eraseToAnyPublisher() }
            return self.getPokemonUseCase
                .execute(generation: generation)
                .map { .searchedPokemonSuccess($0) }
                .catch { Just(.searchedPokemonFailed($0 as? Exception ?? GenericException.unknown($0)))  }
                .eraseToAnyPublisher()
        }
    }

}
